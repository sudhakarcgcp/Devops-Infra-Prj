data "aws_vpc" "existing_vpc" {
  filter {
   name = "tag:Name"
   values = ["Default-Devops-vpc"]
  }
}

resource "aws_security_group" "Devsecgrp-sonar" {
 name = "Devsecgrp-sonar"
 description = "Security group for sonarqube server"
 ingress {
	from_port = 9000
	to_port   = 9000
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
 ingress {
	from_port = 22
	to_port   = 22
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
 egress {
	from_port = 0
	to_port   = 65535
	protocol  = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
	}
	
 tags = {
	Name = "SonarSG"
	}
}
resource "aws_instance" "sonar_instance" {
	ami= var.ami_id
	key_name = var.key_name
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.Devsecgrp-sonar.id]
	tags= {
	Name = var.tag_name
	}
}


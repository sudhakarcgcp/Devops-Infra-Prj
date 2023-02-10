resource "aws_vpc" "sonar" {
 cidr_block = "172.31.0.0/16"
 instance_tenancy = "default"
 tags = {
   Name = "Devops-Prj"
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
	Name = aws_instance.tag_name
	}
}


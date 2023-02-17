terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "infraprj-tfstate-bucket"
    key            = "dc/s3/terraform.tfstate"
    region         = "eu-west-2"
    #Replace this with your DynamoDB table name!
    dynamodb_table = "infraprj-tfstatelock-table"
    encrypt        = true
    }
}

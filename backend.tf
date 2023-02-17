terraform {
  backend "s3" {
    #Replace this with your bucket name!
    bucket         = "infraprj-tfstate-bucket"
    key            = "dc/s3/terraform.tfstate"
    region         = "us-east-2"
    #Replace this with your DynamoDB table name!
    dynamodb_table = "tf-up-and-run-locks"
    encrypt        = true
    }
}

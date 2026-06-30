terraform {
  backend "s3" {
    bucket         = "platform-infra-tfstate-z"
    key            = "platform-infra/ap-south-1/vpc.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks-z"
    encrypt        = true
  }
}
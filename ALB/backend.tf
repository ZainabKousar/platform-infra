terraform {
  backend "s3" {
    bucket         = "platform-infra-tfstate-z"
    key            = "platform-infra/ap-south-1/alb.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks-z"
    encrypt        = true
  }
}
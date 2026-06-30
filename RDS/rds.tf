data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "platform-infra-tfstate-z"
    key    = "platform-infra/ap-south-1/vpc.tfstate"
    region = "ap-south-1"
  }
}
module "rds" {
  source = "git::https://github.com/ZainabKousar/terraform-rds-module.git?ref=main"

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  db_subnet_ids = data.terraform_remote_state.vpc.outputs.db_private_subnets

  db_name = var.db_name

  username = var.username

  password = var.password
}
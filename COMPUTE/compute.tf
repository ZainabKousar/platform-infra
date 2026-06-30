data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "platform-infra-tfstate-z"
    key    = "platform-infra/ap-south-1/vpc.tfstate"
    region = "ap-south-1"
  }
}
data "terraform_remote_state" "rds" {
  backend = "s3"

  config = {
    bucket = "platform-infra-tfstate-z"
    key    = "platform-infra/ap-south-1/rds.tfstate"
    region = "ap-south-1"
  }
}
module "compute" {
  source = "git::https://github.com/ZainabKousar/terraform-compute-module.git?ref=main"

  project_prefix = var.project_prefix

  public_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnets

  app_private_subnets = data.terraform_remote_state.vpc.outputs.app_private_subnets

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ami = var.ami

  instance_type = var.instance_type

  rds_endpoint = data.terraform_remote_state.rds.outputs.endpoint
}
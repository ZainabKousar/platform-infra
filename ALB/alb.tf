data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "platform-infra-tfstate-z"
    key    = "platform-infra/ap-south-1/vpc.tfstate"
    region = "ap-south-1"
  }
}
data "terraform_remote_state" "compute" {
  backend = "s3"

  config = {
    bucket = "platform-infra-tfstate-z"
    key    = "platform-infra/ap-south-1/compute.tfstate"
    region = "ap-south-1"
  }
}
module "alb" {
  source = "git::https://github.com/ZainabKousar/terraform-alb-module.git?ref=main"

  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnets
  alb_sg_id  = data.terraform_remote_state.compute.outputs.alb_sg_id
}
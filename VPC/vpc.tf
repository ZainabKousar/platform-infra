module "vpc" {
  source = "git::https://github.com/ZainabKousar/terraform-vpc-module.git?ref=main"

  project_prefix     = var.project_prefix
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["ap-south-1a", "ap-south-1b"]
}
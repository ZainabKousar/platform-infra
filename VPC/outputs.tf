output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "app_private_subnets" {
  value = module.vpc.app_private_subnets
}

output "db_private_subnets" {
  value = module.vpc.db_private_subnets
}
output "endpoint" {
  value = module.rds.endpoint
}

output "db_sg_id" {
  value = module.rds.db_sg_id
}
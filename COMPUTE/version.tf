output "alb_dns" {
  value = module.alb.alb_dns
}

output "app_target_group_arn" {
  value = module.alb.app_target_group_arn
}
output "vpc_id" {
  value       = module.network.vpc_id
  description = "VPC の ID"
}

output "public_subnet_ids" {
  value       = module.network.public_subnet_ids
  description = "Public Subnet の ID リスト"
}

output "private_app_subnet_ids" {
  value       = module.network.private_app_subnet_ids
  description = "Private Subnet (App) の ID リスト"
}

output "private_db_subnet_ids" {
  value       = module.network.private_db_subnet_ids
  description = "Private Subnet (DB) の ID リスト"
}

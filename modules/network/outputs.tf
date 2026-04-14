output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC の ID"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "Public Subnet の ID リスト"
}

output "private_app_subnet_ids" {
  value       = aws_subnet.private_app[*].id
  description = "Private Subnet (App) の ID リスト"
}

output "private_db_subnet_ids" {
  value       = aws_subnet.private_db[*].id
  description = "Private Subnet (DB) の ID リスト"
}

output "alb_sg_id" {
  value       = aws_security_group.alb.id
  description = "ALB 用 Security Group の ID"
}

output "app_sg_id" {
  value       = aws_security_group.app.id
  description = "App 用 Security Group の ID"
}

output "db_sg_id" {
  value       = aws_security_group.db.id
  description = "DB 用 Security Group の ID"
}

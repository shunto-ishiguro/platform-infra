variable "name_prefix" {
  type        = string
  description = "リソース名のプレフィックス"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC の CIDR ブロック"
}

variable "azs" {
  type        = list(string)
  description = "使用する Availability Zone のリスト"
}

variable "public_subnets" {
  type        = list(string)
  description = "Public Subnet の CIDR ブロックのリスト"
}

variable "private_app_subnets" {
  type        = list(string)
  description = "Private Subnet (App) の CIDR ブロックのリスト"
}

variable "private_db_subnets" {
  type        = list(string)
  description = "Private Subnet (DB) の CIDR ブロックのリスト"
}

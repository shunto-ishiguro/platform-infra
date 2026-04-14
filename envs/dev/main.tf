locals {
  name_prefix = "${var.project}-${var.env}"
}

# ==============================================================================
# Network — VPC, サブネット, ゲートウェイ, セキュリティグループ
# ==============================================================================

module "network" {
  source = "../../modules/network"

  name_prefix         = local.name_prefix
  vpc_cidr            = var.vpc_cidr
  azs                 = var.azs
  public_subnets      = var.public_subnets
  private_app_subnets = var.private_app_subnets
  private_db_subnets  = var.private_db_subnets
}

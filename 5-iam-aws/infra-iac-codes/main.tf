module "vpc_maker" {
  source             = "./modules/network"
  vpc_cidr_block     = var.vpc_cidr_block
  network_infra_tags = var.network_infra_tags
  subnet_cidr_block  = var.subnet_cidr_block

}
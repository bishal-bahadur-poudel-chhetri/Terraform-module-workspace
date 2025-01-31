module "vpc" {
  source = "../modules/network"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name              = var.vpc_name
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr = var.public_subnet_cidr
  azs   =   var.azs
  environment = var.environment
}
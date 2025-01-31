module "sg" {
    source = "../modules/security"
    service_ports = var.service_ports
    rds_ports = var.rds_ports
    vpc_id = module.vpc.vpc_id
    environment = var.environment
}
module "ec2" {
    source = "../modules/compute"
    vpc_name = module.vpc.vpc_name
    instance_type = var.instance_type
    public_subnet_id   = module.vpc.public_subnet_id
    private_subnet_id  = module.vpc.private_subnet_id
    
    key_name = var.key_name
    ami = var.ami
    aws_region = var.aws_region
    enviroment = var.environment
    sg_id = module.sg.allow_web
}
module "rds" {
    source = "../modules/rds"
    storage_type = var.storage_type
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
    parameter_group_name = var.parameter_group_name
    engine = var.engine
    password = var.password
    username = var.username
    db_name = var.db_name
    vpc_security_group_ids = module.sg.allow_rds
    subnet_id= module.vpc.private_subnet_id
  
}
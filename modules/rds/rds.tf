

resource "aws_db_instance" "name" {
    allocated_storage = var.allocated_storage
    username = var.username
    storage_type = var.storage_type
    engine = var.engine
    instance_class = var.instance_class
    engine_version = var.engine_version
    password = var.password
    parameter_group_name = var.parameter_group_name
    skip_final_snapshot = true
    publicly_accessible = false
    vpc_security_group_ids = [var.vpc_security_group_ids]
    db_subnet_group_name=aws_db_subnet_group.rds_subnet_group.name
}


resource "aws_instance" "private_server" {
    count=var.enviroment == "Production" ? 1:1 
    ami = lookup(var.ami,var.aws_region)
    subnet_id = element(var.private_subnet_id, count.index)
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = [var.sg_id]
    tags={
        Name        = "${var.vpc_name}-private-server"
        Enviroment  = var.enviroment
    }
}


resource "aws_security_group" "allow_web" {
    vpc_id = var.vpc_id
    name = "${var.environment}-allow web"
    description = "Allow webserver inbound traffic"
    dynamic "ingress" {
      for_each = var.service_ports
      content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name ="${var.environment}-all-basic"
      enviroment=var.environment
    } 
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
  name        = "rds-security-group"
  description = "Allow inbound access to RDS"
  
  dynamic "ingress" {
    for_each = var.rds_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "rds-security-group"
    environment = var.environment
  }
}

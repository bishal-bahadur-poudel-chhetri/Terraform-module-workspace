resource "aws_vpc" "default" {
    cidr_block = var.vpc_cidr

    tags = {
        Name=var.vpc_name

    }
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.default.id
 
    tags={
        Name = "${var.vpc_name}-IGW" 
    }
  
}


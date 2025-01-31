resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_cidr)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.private_subnet_cidr,count.index)
    availability_zone = element(var.azs,count.index)
    
    tags = {
      Name ="${var.vpc_name}-private-subnet-${count.index+1}"
      enviroment=var.environment
    }
    
  
}


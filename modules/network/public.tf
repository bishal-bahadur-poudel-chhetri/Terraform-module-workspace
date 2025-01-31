resource "aws_subnet" "public_subnet" {
    count = length(var.public_subnet_cidr)
    vpc_id = aws_vpc.default.id
    cidr_block = element(var.public_subnet_cidr,count.index)
    availability_zone = element(var.azs,count.index)
    tags = {
      Name ="${var.vpc_name}-public-subnet-${count.index+1}"
      enviroment=var.environment
    }
}
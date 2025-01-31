resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.default.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name= "${var.vpc_name}-Public_Route"
      enviroment=var.environment
    }
  
}


resource "aws_route_table_association" "public-subnet" {
    count = length(var.public_subnet_cidr)
    subnet_id = element(aws_subnet.public_subnet.*.id,count.index)
    route_table_id = aws_route_table.rt.id
  
}
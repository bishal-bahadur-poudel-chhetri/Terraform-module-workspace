output "vpc_id" {
    value = aws_vpc.default.id
}

output "vpc_name" {
  value = aws_vpc.default.tags["Name"]
}


output "public_subnet_id" {
  value = aws_subnet.public_subnet[*].id 
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet[*].id  
}
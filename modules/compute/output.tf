output "public_subnet_id" {
  value = aws_instance.private_server[*].id
}
output "private_subnet_id" {
  value = aws_instance.public_server[*].id
}

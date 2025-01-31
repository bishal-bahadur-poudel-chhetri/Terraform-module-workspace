output "allow_web" {
    value = aws_security_group.allow_web.id
}
output "allow_rds" {
    value = aws_security_group.rds_sg.id
}
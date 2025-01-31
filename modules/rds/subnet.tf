resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "rds-subnet-group-${var.username}"
  subnet_ids = flatten([var.subnet_id]) 
}

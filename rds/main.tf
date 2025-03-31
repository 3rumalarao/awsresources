resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags       = merge(var.common_tags, { Name = "rds-subnet-group" })
}

resource "aws_db_instance" "this" {
  count                = var.create_rds ? 1 : 0
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  db_subnet_group_name = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids
  multi_az             = var.multi_az
  skip_final_snapshot  = true

  tags = merge(var.common_tags, { Name = "rds-instance" })
}

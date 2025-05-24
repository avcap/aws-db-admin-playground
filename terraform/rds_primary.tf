provider "aws" {
  region = "us-east-1"
}

resource "aws_db_subnet_group" "main" {
  name       = "rds-main-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "primary" {
  identifier               = "db-primary"
  engine                   = "mysql"
  engine_version           = "8.0"
  instance_class           = "db.t3.medium"
  allocated_storage        = 20
  username                 = var.db_username
  password                 = var.db_password
  db_subnet_group_name     = aws_db_subnet_group.main.name
  skip_final_snapshot      = true
  backup_retention_period  = 7
}


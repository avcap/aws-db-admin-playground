provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "sql_alwayson" {
  identifier              = "sql-alwayson"
  engine                  = "sqlserver-se"
  engine_version          = "14.00"
  instance_class          = "db.m5.large"
  username                = var.db_username
  password                = var.db_password
  allocated_storage       = 100
  multi_az                = true
  db_subnet_group_name    = aws_db_subnet_group.main.name
  skip_final_snapshot     = true
  backup_retention_period = 7
}


resource "aws_db_instance" "replica" {
  identifier           = "db-replica"
  engine               = aws_db_instance.primary.engine
  instance_class       = "db.t3.small"
  replicate_source_db  = aws_db_instance.primary.id
  db_subnet_group_name = aws_db_subnet_group.main.name
  skip_final_snapshot  = true
}


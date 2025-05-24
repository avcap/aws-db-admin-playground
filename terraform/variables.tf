variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "db_username" {
  description = "Master username for RDS instances"
  type        = string
}

variable "db_password" {
  description = "Master password for RDS instances"
  type        = string
}

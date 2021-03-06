resource "random_string" "random" {
  length = 5
  upper  = false
  number = false
  special = false
}

module "gitlab_rds_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "gitlab-postgres-${var.environment}-db"
  multi_az   = true

  engine               = "postgres"
  engine_version       = "11.9"
  major_engine_version = "11"
  family               = "postgres11"

  instance_class    = var.gitlab_rds_db_flavor
  allocated_storage = var.gitlab_rds_db_size
  storage_encrypted = false

  name     = "gitlab${var.environment}${random_string.random.result}"
  port     = "5432"
  username = var.gitlab_rds_db_user
  password = var.gitlab_rds_db_password

  vpc_security_group_ids = var.gitlab_rds_sg_ids
  subnet_ids             = var.gitlab_rds_subnet_ids

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  tags = {
    Terraform   = "true"
    Environment = var.environment
    Application = "gitlab"
  }

  # Database Deletion Protection
  deletion_protection = false
}

resource "aws_ssm_parameter" "gitlab_db_instance_db" {
  name        = "/gitlab/${var.environment}/rds/db"
  description = "The database endpoint"
  type        = "String"
  value       = module.gitlab_rds_db.this_db_instance_name

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "gitlab_db_instance_address" {
  name        = "/gitlab/${var.environment}/rds/address"
  description = "The database address"
  type        = "String"
  value       = module.gitlab_rds_db.this_db_instance_address

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "gitlab_db_instance_endpoint" {
  name        = "/gitlab/${var.environment}/rds/endpoint"
  description = "The database endpoint"
  type        = "String"
  value       = module.gitlab_rds_db.this_db_instance_endpoint

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "gitlab_db_instance_username" {
  name        = "/gitlab/${var.environment}/rds/username"
  description = "The database username"
  type        = "String"
  value       = module.gitlab_rds_db.this_db_instance_username

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

resource "aws_ssm_parameter" "gitlab_db_instance_password" {
  name        = "/gitlab/${var.environment}/rds/password"
  description = "The database password"
  type        = "SecureString"
  value       = module.gitlab_rds_db.this_db_instance_password

  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}

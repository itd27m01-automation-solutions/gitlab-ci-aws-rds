module "gitlab_rds_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "gitlab-db"
  multi_az   = true

  engine               = "postgres"
  engine_version       = "10.14"
  major_engine_version = "10"
  family               = "postgres10"

  instance_class    = var.gitlab_rds_db_flavor
  allocated_storage = var.gitlab_rds_db_size
  storage_encrypted = false

  name     = "gitlab"
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
  }

  # Database Deletion Protection
  deletion_protection = false
}
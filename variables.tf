variable "environment" {
  type        = string
  description = "Environment name to create RDS instance for"
}

variable "gitlab_rds_db_flavor" {
  type        = string
  default     = "db.m4.large"
  description = "Flavor for rds db instance"
}

variable "gitlab_rds_db_size" {
  type        = number
  default     = 10
  description = "Storage size for rds db instance"
}

variable "gitlab_rds_db_user" {
  type        = string
  default     = "gitlab"
  description = "Master user for rds db instance"
}

variable "gitlab_rds_db_password" {
  type        = string
  description = "Master password for rds db instance"
}

variable "gitlab_rds_sg_ids" {
  type        = list(string)
  description = "List of SGs IDs for rds db instance"
}

variable "gitlab_rds_subnet_ids" {
  type        = list(string)
  description = "List of subnets IDs for rds db instance"
}

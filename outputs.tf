output "gitlab_db_instance_db" {
  description = "Database name"
  value       = module.gitlab_rds_db.this_db_instance_name
}

output "gitlab_db_instance_address" {
  description = "The connection address"
  value       = module.gitlab_rds_db.this_db_instance_address
}

output "gitlab_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.gitlab_rds_db.this_db_instance_endpoint
}

output "gitlab_db_instance_username" {
  description = "The master username for the database"
  value       = module.gitlab_rds_db.this_db_instance_username
}

output "gitlab_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.gitlab_rds_db.this_db_instance_password
  sensitive   = true
}

# RDS terraform module for GitLab CI on AWS

Deploys PostgreSQL server on AWS RDS service for GitLab CI deployment on AWS

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.5 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.14 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name to create RDS instance for | `string` | n/a | yes |
| gitlab\_rds\_db\_flavor | Flavor for rds db instance | `string` | `"db.m4.large"` | no |
| gitlab\_rds\_db\_password | Master password for rds db instance | `string` | n/a | yes |
| gitlab\_rds\_db\_size | Storage size for rds db instance | `number` | `10` | no |
| gitlab\_rds\_db\_user | Master user for rds db instance | `string` | `"gitlab"` | no |
| gitlab\_rds\_sg\_ids | List of SGs IDs for rds db instance | `list(string)` | n/a | yes |
| gitlab\_rds\_subnet\_ids | List of subnets IDs for rds db instance | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gitlab\_db\_instance\_endpoint | The connection endpoint |
| gitlab\_db\_instance\_password | The database password (this password may be old, because Terraform doesn't track it after initial creation) |
| gitlab\_db\_instance\_username | The master username for the database |


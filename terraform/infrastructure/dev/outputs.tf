output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "ALB DNS name (use as the CNAME target in Namecheap)"
}

output "rds_endpoint" {
  value       = module.rds.db_endpoint
  description = "RDS endpoint address for application connectivity"
}

output "secrets_manager_arn" {
  value       = module.secrets.secret_arn
  description = "Secrets Manager ARN storing DB credentials"
}

output "ec2_instance_ids" {
  value       = module.ec2.instance_ids
  description = "Application EC2 instance IDs"
}

output "ansible_control_instance_id" {
  value       = module.ansible.instance_id
  description = "Ansible control node instance ID"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "VPC ID created for this environment"
}

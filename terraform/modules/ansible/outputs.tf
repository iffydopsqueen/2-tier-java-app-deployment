output "instance_id" {
  value       = aws_instance.this.id
  description = "Ansible control node instance ID"
}

output "private_ip" {
  value       = aws_instance.this.private_ip
  description = "Private IP of the Ansible control node instance"
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "Security group ID for the Ansible control node"
}

# Phase 2: Application Deployment (Docker + ECR)

This phase deploys **WordPress** (Docker + Nginx) on the Phase 1 infrastructure.

The image is built and pushed to **ECR**, then pulled by private EC2 app instances over SSM using Ansible.

## Terraform prerequisites
- Phase 1 Terraform applied successfully.
- ECR repo created for `wordpress`.
- EC2 app role has `AmazonEC2ContainerRegistryReadOnly` (set `attach_ecr_readonly = true`).

Outputs used by Ansible:
- `rds_endpoint`
- `secrets_manager_arn`
- `ansible_ssm_bucket_name`
- `ecr_repo_urls`

## WordPress deployment (Docker)
```
export AWS_REGION=us-east-1
export PROJECT=wordpress
export ENVIRONMENT=dev
export ANSIBLE_SSM_BUCKET=<ansible_ssm_bucket_name>
export DB_HOST=<rds_endpoint>
export DB_NAME=wordpress
export DB_SECRET_ARN=<secrets_manager_arn>
export WORDPRESS_IMAGE=<ecr_repo_url>:<tag>
export WORDPRESS_ECR_REGISTRY=<account>.dkr.ecr.<region>.amazonaws.com

ansible-playbook ansible/wordpress.yml
```

## Recommended ALB health check
Set in `terraform/infrastructure/dev/dev.tfvars`:
```
alb_health_check_path = "/healthz"
```

## Switching between implementations
N/A (WordPress only)

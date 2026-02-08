# Architecture diagram notes (draw.io)

## Layout
- Left/top: Internet
- Center: VPC boundary
- Inside VPC: 2 AZs columns (AZ-a, AZ-b)
- Top row: Public subnets
- Middle row: Private app subnets
- Bottom row: Private DB subnets

## Components to place
- Internet
- Internet Gateway (attached to VPC)
- ALB in public subnets (one ALB spanning both)
- NAT Gateways (one per public subnet/AZ)
- EC2 app instances in private app subnets
- RDS instance in private DB subnets (multi-AZ)
- Secrets Manager (outside VPC box, AWS service)
- IAM Role (attached to EC2)

## Security groups (show as labels/arrows)
- ALB-SG
  - Inbound: 443 from 0.0.0.0/0
  - Outbound: to App-SG (app ports)
- App-SG
  - Inbound: from ALB-SG
  - Outbound: to DB-SG (db port) + AWS endpoints (443)
- DB-SG
  - Inbound: from App-SG only
  - No public access

## Traffic flow annotations
1. Internet → ALB :443 (TLS)
2. ALB → EC2 :80/443
3. EC2 → RDS :3306 (MySQL) or 5432 (Postgres)
4. EC2 → Secrets Manager (AWS API)
5. EC2 → Internet via NAT (updates/ECR pulls)

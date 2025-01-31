# Terraform Infrastructure Setup

## Overview
This Terraform configuration provisions **public and private servers** along with an **RDS instance** attached to a private subnet. The setup ensures a **secure, modular, and scalable** cloud infrastructure using Terraform modules and environments.

## Features
- **Public and Private Servers**: Ensures accessibility and security.
- **RDS in a Private Subnet**: Restricts database access from external networks.
- **Modular Approach**: Uses Terraform modules for reusability and maintainability.
- **Multi-AZ RDS Deployment**: Ensures high availability by spreading subnets across different availability zones.
- **State Management**: Terraform remote state handling for better collaboration.

## Prerequisites
Before running this Terraform script, ensure you have the following:
- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed.
- AWS CLI configured with appropriate IAM credentials.
- IAM permissions to create VPC, EC2, RDS, and related resources.

## Directory Structure
```
├── main
│   ├── dev.tfvars
│   ├── ec2.tf
│   ├── infra.tf
│   ├── prod.tfvars
│   ├── sg.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
│   ├── terraform.tfstate.d
│   │   └── development
│   │       ├── terraform.tfstate
│   │       └── terraform.tfstate.backup
│   └── variable.tf
└── modules
    ├── compute
    │   ├── output.tf
    │   ├── private_server.tf
    │   ├── public_server.tf
    │   └── variable.tf
    ├── network
    │   ├── output.tf
    │   ├── private.tf
    │   ├── public.tf
    │   ├── route.tf
    │   ├── variable.tf
    │   └── vpc.tf
    ├── rds
    │   ├── output.tf
    │   ├── rds.tf
    │   ├── subnet.tf
    │   └── variable.tf
    └── security
        ├── output.tf
        ├── private.tf
        ├── public.tf
        └── variable.tf
```

## Usage
### Initialize Terraform
```sh
terraform init
```

### Plan Deployment
```sh
terraform plan -var-file="prod.tfvars"
```

### Apply Configuration
```sh
terraform apply -auto-approve -var-file="prod.tfvars"
```

### Destroy Infrastructure (If Needed)
```sh
terraform destroy -auto-approve -var-file="prod.tfvars"
```

## Outputs
After successful execution, Terraform will output:
- **Public EC2 Instance IP**
- **Private Subnet IDs**
- **RDS Endpoint (Private Access)**

## Best Practices
- **Use Remote State**: Store `terraform.tfstate` in AWS S3 with DynamoDB locking for collaboration.
- **Secrets Management**: Use AWS Secrets Manager or SSM Parameter Store for database credentials.
- **Security Measures**: Apply least privilege IAM roles, security groups, and encrypted storage.
---
#Terraform #AWS #DevOps #InfrastructureAsCode

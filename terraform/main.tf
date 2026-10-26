terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Fetch the latest Amazon Linux 2023 AMI dynamically
data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# 1. VPC Module (Networking)
module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
  subnet_cidr  = var.subnet_cidr
}

# 2. Security Group Module (Firewall)
module "security_group" {
  source       = "./modules/security_group"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

# 3. EC2 Module (Compute + Docker)
module "ec2" {
  source            = "./modules/ec2"
  project_name      = var.project_name
  ami_id            = data.aws_ami.amazon_linux_2023.id
  instance_type     = var.instance_type
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = var.key_name
}

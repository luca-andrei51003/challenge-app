variable "aws_region" {
  description = "AWS deployment region"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Project name prefix for tags and resources"
  type        = string
  default     = "web-counter-app"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Public Subnet CIDR block"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance size"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Optional AWS Key Pair name for SSH"
  type        = string
  default     = ""
}


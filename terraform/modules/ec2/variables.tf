variable "project_name" {
  description = "Project name tag prefix"
  type        = string
  default     = "challenge-app"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where the instance will reside"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID attached to the instance"
  type        = string
}

variable "key_name" {
  description = "Optional EC2 Key Pair name for SSH access"
  type        = string
  default     = ""
}


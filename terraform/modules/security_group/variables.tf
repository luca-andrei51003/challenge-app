variable "project_name" {
  description = "Project name tag prefix"
  type        = string
  default     = "challenge-app"
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}


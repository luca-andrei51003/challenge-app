output "ec2_public_ip" {
  description = "Public IP address of the deployed web server"
  value       = module.ec2.public_ip
}

output "app_url" {
  description = "Direct URL to access the deployed web application"
  value       = "http://${module.ec2.public_ip}"
}


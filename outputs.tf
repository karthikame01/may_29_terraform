output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.network.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.network.public_subnet_id
}

output "private_subnet_id" {
  description = "The ID of the private subnet"
  value       = module.network.private_subnet_id
}

output "public_instance_id" {
  description = "The ID of the EC2 instance in the public subnet"
  value       = module.public_ec2.instance_id
}

output "private_instance_id" {
  description = "The ID of the EC2 instance in the private subnet"
  value       = module.private_ec2.instance_id
}

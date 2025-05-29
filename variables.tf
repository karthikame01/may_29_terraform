variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "public_ami" {
  description = "AMI ID for EC2 instances"
  type        = string
    default     = "ami-0e35ddab05955cf57" # Example AMI ID, replace with your own
}

variable "private_ami" {
  description = "AMI ID for EC2 instances"
  type        = string
    default     = "ami-0e35ddab05955cf57" # Example AMI ID, replace with your own
}


variable "public_instance_type" {
  description = "Instance type for public EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "private_instance_type" {
  description = "Instance type for private EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "my_key_name" {
  description = "Key pair name for EC2 instances"
  type        = string
  default     = "personal_lap2" # Replace with your key pair name
}

variable "public_tags" {
  description = "Tags for the public EC2 instance"
  type        = map(string)
  default     = {
    Name        = "public_ec2"
    Environment = "dev"
    Owner       = "Karthikeyan"
  }
}

variable "private_tags" {
  description = "Tags for the private EC2 instance"
  type        = map(string)
  default     = {
    Name        = "private_ec2"
    Environment = "dev"
    Owner       = "Karthikeyan"
  }
}


provider "aws" {
  region = var.region
}

module "network" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  
}

module "public_ec2" {
  source        = "./modules/ec2"
  ami           = var.public_ami
  instance_type = var.public_instance_type
  # instance_type = "t2.micro"
  subnet_id     = module.network.public_subnet_id
  vpc_id        = module.network.vpc_id
  public_ip     = true
    my_key_name = var.my_key_name
  tags          = var.public_tags
  
}

module "private_ec2" {
  source        = "./modules/ec2"
  ami           = var.private_ami
  instance_type = var.private_instance_type
  subnet_id     = module.network.private_subnet_id
  vpc_id        = module.network.vpc_id
  public_ip     = false
  my_key_name = var.my_key_name
  tags = var.private_tags

  }

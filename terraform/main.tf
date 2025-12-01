terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/network"

  vpc_cidr_block = var.vpc_cidr_block
  public_cidr    = var.public_cidr
}

module "compute" {
  source = "./modules/compute"

  vpc_id            = module.network.vpc_id
  public_subnet_id  = module.network.public_subnet_id
  key_name          = var.key_name
  instance_type     = var.instance_type
  allowed_ssh_cidr  = var.allowed_ssh_cidr
}
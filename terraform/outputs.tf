output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "ec2_public_ip" {
  value = module.compute.instance_public_ip
}

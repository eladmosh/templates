output "vpc_id" {
  value       = module.my_vpc.vpc_id
  description = "VPC id"
}

output "private_subnets" {
  value       = module.my_vpc.private_subnets
}

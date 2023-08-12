output "vpc_cidr"{
  value         = module.vpc.vpc_cidr
}
output "vpc_id" {
  value       = module.vpc.vpc_id
}
output "igw_id" {
        value = module.vpc.igw_id
}
output "public_subnet_id" {
        value = module.vpc.public_subnet_id
}
output "public_route_id" {
        value = module.vpc.public_route_id
}
output "private_subnet_id" {
        value = module.vpc.private_subnet_id
}
output "private_route_id" {
        value = module.vpc.private_route_id
}
output "nat_gateway_id" {
        value = module.vpc.nat_gateway_id
}
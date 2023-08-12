#### Outputs
output "vpc_cidr"{
  value         = var.cidr_block
}
output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "VPC ID"
}

output "igw_id" {
  value       = aws_internet_gateway.igw.id
  description = "Internet Gateway ID"
}
output "public_subnet_id" {
  value       = {
        for i in aws_subnet.public-subnet:
                element(split(".", i.tags["Name"]),3) => i.id
                }
}
output "private_subnet_id" {
  value       = {
        for i in aws_subnet.private-subnet:
                element(split(".", i.tags["Name"]),4) => i.id
                }
}
output "nat_gateway_id" {
        value = {
        for i in aws_nat_gateway.nat-gw:
                element(split(".", i.tags["Name"]),3) => i.id
                }
}
output "public_route_id" {
  value       = {
        for i in aws_route_table.public-rt:
                element(split(".", i.tags["Name"]),4) => i.id
                }
}
output "private_route_id" {
  value       = {
        for i in aws_route_table.private-rt:
                element(split(".", i.tags["Name"]),4) => i.id
                }
}
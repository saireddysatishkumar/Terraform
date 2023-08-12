/* VPC */
resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames	= "true"

  tags = {
    Name = "${var.company}.${var.env}"
  }
}

/* Internet Gateway */
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.company}.${var.az}.${var.env}.igw"
  }
}

/* Public Subnet */
resource "aws_subnet" "public-subnet" {
  count = length(var.public_subnet_cidr_block)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.public_subnet_cidr_block, count.index)
  availability_zone = "${var.zones[ count.index % length(var.zones) ]}"
  map_public_ip_on_launch = true

  tags = {
    Name = format("${var.company}.${var.az}.${var.env}.public%d", count.index+1)
  }
}
/* Public Subnet Route Table */
resource "aws_route_table" "public-rt" {
  count = length(var.public_subnet_cidr_block)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = format("${var.company}.${var.az}.${var.env}.public.route%d", count.index+1)
  }
}

/* Private Subnet */
resource "aws_subnet" "private-subnet" {
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.vpc.id
  cidr_block = element(var.private_subnet_cidr_block, count.index)
  availability_zone = var.availability_zone

  tags = {
    Name = format("${var.company}.${var.az}.${var.env}.private.%s",element(var.app, count.index))
  }
}
/* Private Subnet Route Table */
resource "aws_route_table" "private-rt" {
  count = length(var.private_subnet_cidr_block)
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.nat-gw.*.id, count.index)
  }
    tags = {
    Name = format("${var.company}.${var.az}.${var.env}.private.%s.route1",element(var.app, count.index))
  }
}

/* EIP allocation */
resource "aws_eip" "eip" {
  count = length(var.private_subnet_cidr_block)
  vpc = true
  tags = {
  Name = format("${var.company}.${var.az}.${var.env}.%s.eip",element(var.app, count.index))
}
}

/* Pick Random Public Subnet for allocating NAT IP */
resource "random_shuffle" "pub-subnet" {
  input = aws_subnet.public-subnet.*.id
  result_count = length(var.public_subnet_cidr_block)
}

/* NAT Gateway */
resource "aws_nat_gateway" "nat-gw" {
  count = length(var.private_subnet_cidr_block)
  allocation_id = element(aws_eip.eip.*.id, count.index)
  subnet_id     = random_shuffle.pub-subnet.result[count.index % length( random_shuffle.pub-subnet.result)]

  tags = {
    Name = format("${var.company}.${var.az}.${var.env}.%s.natgw",element(var.app, count.index))
  }
  depends_on = [aws_internet_gateway.igw]
}

/* Route Table Association - Public Subnet */
resource "aws_route_table_association" "public-rtb-assoc" {
  count = length(var.public_subnet_cidr_block)
  subnet_id      = element(aws_subnet.public-subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public-rt.*.id, count.index)
}

/* Route Table Association - Private Subnet */
resource "aws_route_table_association" "private-rtb-assoc" {
  count = length(var.private_subnet_cidr_block)
  subnet_id      = element(aws_subnet.private-subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private-rt.*.id, count.index)
}
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "${var.name}-vpc"
  }

}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.name}-ig"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_subnet" "public_01" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr[0]
  availability_zone = var.availability_zone[0]
  tags = {
    Name = "${var.name}-Public-01"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_subnet" "public_02" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr[1]
  availability_zone = var.availability_zone[1]
  tags = {
    Name = "${var.name}-Public-02"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    "Name" = "${var.name}-rt"
  }
  depends_on = [
    aws_vpc.vpc
  ]
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.route_table.id
  gateway_id             = aws_internet_gateway.public.id
  destination_cidr_block = "0.0.0.0/0"
  depends_on             = [aws_route_table.route_table]
}

resource "aws_route_table_association" "public_01" {
  subnet_id      = aws_subnet.public_01.id
  route_table_id = aws_route_table.route_table.id

  depends_on = [
    aws_route.internet
  ]
}

resource "aws_route_table_association" "public_02" {
  subnet_id      = aws_subnet.public_02.id
  route_table_id = aws_route_table.route_table.id

  depends_on = [
    aws_route.internet
  ]
}



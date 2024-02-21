resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.my_vpc.id

  tags      = {
    Name    = "My-VPC"
  }
}

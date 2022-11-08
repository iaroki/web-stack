resource "aws_vpc" "web_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
      "Name" = "web_vpc"
    }
}

resource "aws_subnet" "web_subnet" {
  count             = 2
  vpc_id            = aws_vpc.web_vpc.id
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  cidr_block        = element(cidrsubnets(var.vpc_cidr, 8, 8), count.index)

  tags = {
    "Name" = "web-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "web_igw" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    "Name" = "web-igw"
  }
}

resource "aws_route_table" "web_rt" {
  vpc_id = aws_vpc.web_vpc.id

  tags = {
    "Name" = "web-route-table"
  }
}

resource "aws_route" "web_route" {
  route_table_id         = aws_route_table.web_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.web_igw.id
}

resource "aws_route_table_association" "web_rt_association" {
  count          = length(aws_subnet.web_subnet) == 2 ? 2 : 0
  route_table_id = aws_route_table.web_rt.id
  subnet_id      = element(aws_subnet.web_subnet.*.id, count.index)
}

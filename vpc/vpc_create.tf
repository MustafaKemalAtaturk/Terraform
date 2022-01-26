resource "aws_vpc" "hwork_vpc" {
	cidr_block = var.cidr_ip_block
	tags = var.tags
}
resource "aws_subnet" "private1" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.private_ip_cidr1
	availability_zone = data.aws_availability_zones.available.names[0]
	tags = var.tags
}
resource "aws_subnet" "private2" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.private_ip_cidr2
	availability_zone = data.aws_availability_zones.available.names[1]
	tags = var.tags
}
resource "aws_subnet" "private3" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.private_ip_cidr3
	availability_zone = data.aws_availability_zones.available.names[2]
	tags = var.tags
}
resource "aws_subnet" "public1" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.public_ip_cidr1
	availability_zone = data.aws_availability_zones.available.names[0]
	map_public_ip_on_launch = true
	tags = var.tags
}

resource "aws_subnet" "public2" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.public_ip_cidr2
	availability_zone = data.aws_availability_zones.available.names[1]
	map_public_ip_on_launch = true
	tags = var.tags
}
resource "aws_subnet" "public3" {
	vpc_id = aws_vpc.hwork_vpc.id
	cidr_block = var.public_ip_cidr3
	availability_zone = data.aws_availability_zones.available.names[2]
	map_public_ip_on_launch = true
	tags = var.tags
}

resource "aws_eip" "hwork_nat" {
	vpc = true
	tags = var.tags
}
resource "aws_nat_gateway" "int_gw" {
	depends_on = [ aws_internet_gateway.int_gw ]
	allocation_id = aws_eip.hwork_nat.id
	subnet_id = aws_subnet.private1.id
	tags = var.tags
}
resource "aws_route_table" "private" {
	vpc_id = aws_vpc.hwork_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		nat_gateway_id = aws_nat_gateway.int_gw.id
	}
	tags = var.tags
}


resource "aws_route_table_association" "private1" {
	subnet_id = aws_subnet.private1.id
	route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private2" {
	subnet_id = aws_subnet.private2.id
	route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private3" {
	subnet_id = aws_subnet.private3.id
	route_table_id = aws_route_table.private.id
}
resource "aws_route_table" "public" {
	vpc_id = aws_vpc.hwork_vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.int_gw.id
	}
	tags = var.tags
}


resource "aws_route_table_association" "public1" {
	subnet_id = aws_subnet.public1.id
	route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
	subnet_id = aws_subnet.public2.id
	route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public3" {
	subnet_id = aws_subnet.public3.id
	route_table_id = aws_route_table.public.id
}


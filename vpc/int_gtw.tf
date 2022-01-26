resource "aws_internet_gateway" "int_gw" {
  vpc_id = aws_vpc.hwork_vpc.id
  tags = var.tags
}
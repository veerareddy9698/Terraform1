# Creating Nat Gateway
resource "aws_eip" "nat" {
  vpc = "true"
}

resource "aws_nat_gateway" "project_1_nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.project_1-public-1.id
  depends_on    = [aws_internet_gateway.projet_1-gw]
}

# Add routes for VPC
resource "aws_route_table" "project_1-private" {
  vpc_id = aws_vpc.VPC_Project_1.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.project_1_nat-gw.id
  }

  tags = {
    Name = "project_1-private-1"
  }
}

# Creating route associations for private Subnets
resource "aws_route_table_association" "project_1-private-1-a" {
  subnet_id      = aws_subnet.project_1-private-1.id
  route_table_id = aws_route_table.project_1-private.id
}

resource "aws_route_table_association" "project_1-private-2-a" {
  subnet_id      = aws_subnet.projet_1-private-2.id
  route_table_id = aws_route_table.project_1-private.id
}
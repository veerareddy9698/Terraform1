# Creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "projet_1-gw" {
  vpc_id = aws_vpc.VPC_Project_1.id

  tags = {
    Name = "projet_1-gw"
  }
}

# Creating Route Tables for Internet gateway
resource "aws_route_table" "route_project_1-public" {
  vpc_id = aws_vpc.VPC_Project_1.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.projet_1-gw.id
  }

  tags = {
    Name = "route_project_1-public-public-1"
  }
}

# Creating Route Associations public subnets
resource "aws_route_table_association" "project_1-public-1-a" {
  subnet_id      = aws_subnet.prject_1-public-1.id
  route_table_id = aws_route_table.route_project_1-public-public-1.id
}

resource "aws_route_table_association" "project_1-public-2-a" {
  subnet_id      = aws_subnet.project_1-public-2.id
  route_table_id = aws_route_table.route_project_1-public-public-1.id
}
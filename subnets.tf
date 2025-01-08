# Creating Public Subnets in VPC
resource "aws_subnet" "project_1-public-1" {
  vpc_id                  = aws_vpc.VPC_Project_1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "prject_1-public-1"
  }
}

resource "aws_subnet" "project_1-public-2" {
  vpc_id                  = aws_vpc.VPC_Project_1.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "project_1-public-2"
  }
}

# Creating Private Subnets in VPC
resource "aws_subnet" "project_1-private-1" {
  vpc_id                  = aws_vpc.VPC_Project_1.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "project_1-private-1"
  }
}

resource "aws_subnet" "project_1-private-2" {
  vpc_id                  = aws_vpc.dev.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "projet_1-private-2"
  }
}

resource "aws_vpc" "VPC_Project_1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "VPC_Project_1"
  }
}

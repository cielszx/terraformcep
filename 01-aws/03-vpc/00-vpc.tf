
resource "aws_vpc" "zhenxing-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
    tags = {
    Name = "zhenxing-vpc"
  }
}
resource "aws_internet_gateway" "zhenxing-vpc-igw" {
  vpc_id = aws_vpc.zhenxing-vpc.id
  tags ={
    Name = "zhenxing-vpc-igw"
  }
}
resource "aws_route_table" "zhenxing-vpc-rt-pb" {
  
  vpc_id = aws_vpc.zhenxing-vpc.id
  route{
      cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.zhenxing-vpc-igw.id
  }
  tags ={
    Name = "zhenxing-vpc-rt-pb"
  }
}



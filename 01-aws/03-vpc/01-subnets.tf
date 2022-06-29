resource "aws_subnet" "zhenxing-vpc-pb-1a" {
  vpc_id = aws_vpc.zhenxing-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-southeast-1a"
    map_public_ip_on_launch = true

    tags ={
        Name = "zhenxing-vpc-pb-1a"
    }
}
resource "aws_route_table_association" "pb-1a" {
  subnet_id      = aws_subnet.zhenxing-vpc-pb-1a.id
  route_table_id = aws_route_table.zhenxing-vpc-rt-pb.id
}

resource "aws_subnet" "zhenxing-vpc-pb-1b" {
    vpc_id = aws_vpc.zhenxing-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-southeast-1b"
    map_public_ip_on_launch = true

    tags ={
        Name = "zhenxing-vpc-pb-1b"
    }
}
resource "aws_route_table_association" "pb-1b" {
  subnet_id      = aws_subnet.zhenxing-vpc-pb-1b.id
  route_table_id = aws_route_table.zhenxing-vpc-rt-pb.id
}

resource "aws_eip" "nat_gateway" {
  vpc = true
}
resource "aws_nat_gateway" "zhenxing-vpc-nat-gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.zhenxing-vpc-pb-1a.id

  tags = {
    Name = "zhenxing-vpc-nat-gw"
  }
  depends_on = [aws_internet_gateway.zhenxing-vpc-igw]
}

resource "aws_route_table" "zhenxing-vpc-rt-pvt" {
  vpc_id = aws_vpc.zhenxing-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.zhenxing-vpc-nat-gw.id
  }
}

resource "aws_subnet" "zhenxing-vpc-pvt-1a" {
    vpc_id = aws_vpc.zhenxing-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-southeast-1a"
    tags ={
        Name = "zhenxing-vpc-pvt-1a"
    }
}
resource "aws_route_table_association" "pvt-1a" {
  subnet_id      = aws_subnet.zhenxing-vpc-pvt-1a.id
  route_table_id = aws_route_table.zhenxing-vpc-rt-pvt.id
}
resource "aws_subnet" "zhenxing-vpc-pvt-1b" {
    vpc_id = aws_vpc.zhenxing-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "ap-southeast-1b"
    tags ={
        Name = "zhenxing-vpc-pvt-1b"
    }
}
resource "aws_route_table_association" "pvt-1b" {
  subnet_id      = aws_subnet.zhenxing-vpc-pvt-1b.id
  route_table_id = aws_route_table.zhenxing-vpc-rt-pvt.id
}
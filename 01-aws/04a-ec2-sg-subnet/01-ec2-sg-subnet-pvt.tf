resource "aws_instance" "zhenxing-vpc-ec2" {
  count                         = 1
  ami                           = "ami-02d1e544b84bf7502"
  instance_type                 = "t3a.micro"
  key_name                      = "zhenxing"
  vpc_security_group_ids        = [aws_security_group.zhenxing-vpc-sg.id]
  subnet_id                     = aws_subnet.zhenxing-vpc-pvt-1a.id
tags = {
    Name = "zhenxing-vpc_${count.index}"
  }
}
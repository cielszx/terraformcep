resource "aws_instance" "apache-server" {
subnet_id = aws_subnet.zhenxing-vpc-pb-1b.id
  vpc_security_group_ids = [aws_security_group.zhenxing-vpc-sg.id]
  ami = "ami-02d1e544b84bf7502" 
  instance_type = "t3a.nano"
  key_name = data.aws_key_pair.keypair.key_name
  tags={
    Name = "apache-server"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOF
}
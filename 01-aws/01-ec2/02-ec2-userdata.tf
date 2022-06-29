resource "aws_instance" "apache-server" {
  ami = "ami-02d1e544b84bf7502" 
  instance_type = "t3a.nano"
  tags={
    Name = "terraform-httpd-zhenxing"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOF
}
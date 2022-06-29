resource "aws_instance" "tier-front" {
  ami           = "ami-02d1e544b84bf7502"
  instance_type = "t3a.micro"

  tags = {
    Name = "terraform-ec2-rajesh"
  }
}
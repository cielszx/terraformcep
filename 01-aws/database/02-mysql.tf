## DB Subent Group
resource "aws_db_subnet_group" "zhenxing-vpc-db-subnet-grp" {
  name       = "zhenxing-vpc-db-subnet-grp"
  subnet_ids = [aws_subnet.zhenxing-vpc-pvt-1a.id, aws_subnet.zhenxing-vpc-pvt-1b.id]
tags = {
    Name = "zhenxing-vpc-db-subnet-grp"
  }
}
## DB instance
resource "aws_db_instance" "zhenxing-vpc-db-mysql" {
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = "smartbankapp"
  identifier              = "zhenxing-vpc"
  username                = "mysql"
  password                = "mysqlsba"
  parameter_group_name    = "default.mysql8.0"
  db_subnet_group_name    = aws_db_subnet_group.zhenxing-vpc-db-subnet-grp.name
  vpc_security_group_ids  = [aws_security_group.zhenxing-vpc-sg-db.id]
  skip_final_snapshot     = "true"
}
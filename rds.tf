resource "aws_db_instance" "myinstance" {
  engine               = "mysql"
  identifier           = "myrdsinstance"
  allocated_storage    = 10
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "sajath"
  password             = "sajath123"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot  = true
  publicly_accessible = false
  db_subnet_group_name     = aws_db_subnet_group.db_subnet.id
}

# RDS DB subnet group
resource "aws_db_subnet_group" "db_subnet" {
  name        = "main_subnet_group"
  description = "Our main group of subnets"
  subnet_ids  = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
}

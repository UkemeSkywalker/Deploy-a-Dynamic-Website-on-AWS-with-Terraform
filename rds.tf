# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database subnet group"
  subnet_ids   = [var.private_data_subnet_az1_cidr, var.private_data_subnet_az2_cidr]
  description  = "database subnet group"

  tags   = {
    Name = "database subnet group"
  }
}


# create the rds instance
resource "aws_db_instance" "db_instance" {
  engine                  = 
  engine_version          = 
  multi_az                = 
  identifier              = 
  username                = 
  password                = 
  instance_class          = 
  allocated_storage       = 
  db_subnet_group_name    = 
  vpc_security_group_ids  = 
  availability_zone       = 
  db_name                 = 
  skip_final_snapshot     = 
}

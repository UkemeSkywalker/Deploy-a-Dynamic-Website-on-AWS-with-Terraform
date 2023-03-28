# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}

# create the subnet group for the rds instance

resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database-subnet"
  subnet_ids   = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id ]
  description  = "subnets for database instance"

  tags   = {
    Name = "database-subnet"
  }
}


# create the rds instance

resource "aws_db_instance" "mysql_db" {
  engine               = "mysql"
  engine_version       = "8.0.31"
  multi_az             = false
  identifier           = "dev-rds-instance"
  instance_class       = "db.t2.micro"
  username             = "skywalker"
  password             = "examplepassword"
  allocated_storage    = 200
  # parameter_group_name = "default.mysql8.0.31"
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.id
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  db_name = "applicationdb"
  skip_final_snapshot  = true

}

# # use data source to get all avalablility zones in region
# data "aws_availability_zones" "available_zones" {}

# # create the subnet group for the rds instance

# resource "aws_db_subnet_group" "database_subnet_group" {
#   name        = "database-subnet"
#   subnet_ids  = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
#   description = "subnets for database instance"

#   tags = {
#     Name = "database-subnet"
#   }
# }


# # create the rds instance

# resource "aws_db_instance" "mysql_db" {
#   engine            = "mysql"
#   engine_version    = "8.0.31"
#   multi_az          = false
#   identifier        = "dev-rds-instance2"
#   instance_class    = "db.t2.micro"
#   username          = "skywalker"
#   password          = "examplepassword"
#   allocated_storage = 200
#   # parameter_group_name = "default.mysql8.0.31"
#   db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.id
#   vpc_security_group_ids = [aws_security_group.database_security_group.id]
#   availability_zone      = data.aws_availability_zones.available_zones.names[0]
#   db_name                = "applicationdb"
#   skip_final_snapshot    = false

# }


# create database subnet group
# terraform aws db subnet group
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database subnet group"
  subnet_ids   = [aws_subnet.private_data_subnet_az1.id,aws_subnet.private_data_subnet_az2.id]
  description  = "subnets for database instance"

  tags   = {
    Name = "database subnet group"
  }
}

# get the latest db snapshot
# terraform aws data db snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
  db_snapshot_identifier = var.database_snapshot_identifier
  most_recent            = true
  snapshot_type          = "manual"
}

# create database instance restored from db snapshots
# terraform aws db instance
resource "aws_db_instance" "database_instance" {
  instance_class          = var.database_instance_class
  skip_final_snapshot     = true
  availability_zone       = "us-east-1b"
  identifier              = var.database_identifier
  snapshot_identifier     = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  multi_az                = var.multi_az_deployment
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
}
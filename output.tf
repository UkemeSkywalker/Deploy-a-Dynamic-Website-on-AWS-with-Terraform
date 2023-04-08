output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "rds_name" {
    value = aws_db_instance.database_instance.db_name
}

output "domain_name"  {
    value = join("", ["https://", var.record_name, ".", var.domain_name])
}
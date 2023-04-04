variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "Vpc cidr block"
  type        = string
}

variable "public_subnet_az1_cidr" {
  default     = "10.0.0.0/24"
  description = "Public subnet az1 cidr block"
  type        = string
}

variable "public_subnet_az2_cidr" {
  default     = "10.0.1.0/24"
  description = "Public subnet az2 cidr block"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  default     = "10.0.2.0/24"
  description = "Private app subnet az1 cidr block"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  default     = "10.0.3.0/24"
  description = "Private app subnet az2 cidr block"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  default     = "10.0.4.0/24"
  description = "Private data subnet az1 cidr block"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  default     = "10.0.5.0/24"
  description = "Private data subnet az2 cidr block"
  type        = string
}

variable "ssh_ip_location" {
  default     = "0.0.0.0/0"
  description = "ip address to access ssh security group"
  type        = string
}

# Database Variables
variable "db_username" {
  default     = "ukemzy"
  description = "username of mysql instance"
  type        = string
}

variable "database_snapshot_identifier" {
  default     = "arn:aws:rds:us-east-1:910883278292:snapshot:marketsquaredb2-snapshot"
  description = " database snapshot identifier"
  type        = string
}

#Application load balancer variable
variable "ssl_certificate_arn" {
  default     = "arn:aws:acm:us-east-1:910883278292:certificate/cda19244-2b5a-4ede-b285-13b7909b5b3c"
  description = "ssl certificate arn"
  type        = string
}

# Sns topic variables
variable "operator_email" {
  default     = "ukemzyreloaded@gmail.com"
  description = "a valid email"
  type        = string
}
variable "vpc_cidr" {
    default         = "10.0.0.0/16"
    description     = "Vpc cidr block"
    type            = string      
}

variable "public_subnet_az1" {
    default         = "10.0.0.0/24"
    description     = "Public subnet az1 cidr block"
    type            = string      
}

variable "public_subnet_az2" {
    default         = "10.0.1.0/24"
    description     = "Public subnet az2 cidr block"
    type            = string      
}
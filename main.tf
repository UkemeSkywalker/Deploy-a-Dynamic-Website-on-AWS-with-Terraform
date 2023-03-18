# configure aws provider
provider "aws" {
  region  = "us-east-1"
  profile = "cyrax"
}


# Store terraform state file in s3 bucket
terraform {
  backend "s3" {
    bucket  = "cyrax-terraform-remote-state2"
    key     = "terraform.tfstate.dev"
    region  = "us-east-1"
    profile = "cyrax"
  }
}

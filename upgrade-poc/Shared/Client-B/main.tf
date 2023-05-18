terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  version = "~> 2.0"
}

module "ec2_instance" {
  source     = "../../Modules/ec2/"
  ami        = "ami-0b5eea76982371e91"
}


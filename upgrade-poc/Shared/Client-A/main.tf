terraform {
  required_version = "~> 0.12"
}

provider "aws" {
  version = "~> 2.0"
}

module "ec2_instance" {
  source = "../../Modules/ec2/"

  ami    = "ami-04e914639d0cca79a"
}


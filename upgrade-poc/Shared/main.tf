terraform {
  required_version = "~> 0.12"

  backend "s3" {
    encrypt        = true
    bucket         = "terraform-upgrade-poc"
    key            = "terraform-upgrade-poc"
    region       = "us-west-2"
    session_name = "Terraform"
    external_id  = "Terraform"
  }
}

provider "aws" {
  version = "~> 2.0"
  alias   = "Client-A"

  region = "us-west-2"
#   assume_role {
#     role_arn     = "arn:aws:iam::033702960125:role/GALE-DevOps"
#     session_name = "Terraform"
#     external_id  = "Terraform"
#   }
}

provider "aws" {
  version = "~> 2.0"
  alias   = "Client-B"

  region = "us-east-1"
#   assume_role {
#     role_arn     = "arn:aws:iam::033702960125:role/GALE-DevOps"
#     session_name = "Terraform"
#     external_id  = "Terraform"
#   }
}
module "client_a" {
  source = "./Client-A"
  providers = {
    aws = aws.Client-A
  }
}

module "client_b" {
    source = "./Client-B"
    
    providers = {
      aws = aws.Client-B
    }
  
}

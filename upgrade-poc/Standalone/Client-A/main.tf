terraform {
 required_version = "~> 0.12"

  backend "s3" {
    encrypt        = true
    bucket         = "terraform-poc-clienta"
    key            = "terraform-poc-2"

    region       = "us-west-2"
    # role_arn     = "arn:aws:iam::033702960125:role/gale-training-interview"
    # session_name = "Terraform"
    # external_id  = "Terraform"
  }
}
provider "aws" {
  version = "~> 2.0"
  region = "us-west-2"
}

data "terraform_remote_state" "shared_information" {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "terraform-upgrade13-poc"
    key            = "terraform-upgrade-poc"
    

    region       = "us-west-2"
    # role_arn     = "arn:aws:iam::033702960125:role/gale-training-interview"
    # session_name = "Terraform"
    # external_id  = "Terraform"
  }
}


resource "aws_s3_bucket" "test" {
  bucket = data.terraform_remote_state.shared_information.outputs.client_a.instance_id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

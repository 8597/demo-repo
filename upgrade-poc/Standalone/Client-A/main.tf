terraform {
 required_version = "~> 0.12"

  backend "s3" {
    encrypt        = true
    bucket         = "terraform-poc-2"
    key            = "terraform-poc-2"

    region       = "us-west-2"
    # role_arn     = "arn:aws:iam::033702960125:role/gale-training-interview"
    # session_name = "Terraform"
    # external_id  = "Terraform"
  }
}

data "terraform_remote_state" "shared_information" {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "terraform-upgrade-poc"
    key            = "terraform-upgrade-poc"
    

    region       = "us-west-2"
    # role_arn     = "arn:aws:iam::033702960125:role/gale-training-interview"
    # session_name = "Terraform"
    # external_id  = "Terraform"
  }
}

locals {
  client_information = data.terraform_remote_state.shared_information
}


resource "aws_instance" "web-2" {
  ami           = data.terraform_remote_state.shared_information.aws_instance.ami
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld-2"
  }
}
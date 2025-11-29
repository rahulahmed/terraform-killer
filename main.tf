terraform {
  backend "s3" {
    bucket         = "fundednext-terraform-state-2025"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "state_bucket" {
  bucket        = "fundednext-terraform-state-2025"
  force_destroy = true
}

resource "aws_dynamodb_table" "lock_table" {
  name           = "terraform-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_instance" "demo" {
  ami           = "ami-0dee22c13ea7a9a60"  # Amazon Linux 2023 Mumbai
  instance_type = "t3.micro"
  tags = {
    Name = "FundedNext-Demo-Instance"
  }
}

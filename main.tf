terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# EC2 Instance
resource "aws_instance" "myinstance" {
  ami                         = "ami-00ca32bbc84273381"
  instance_type               = "t3.micro"
  key_name                    = "key1"
  associate_public_ip_address = true
  count                       = 1

  tags = {
    Name = "tf-jenkins-ubuntu24"
  }
}

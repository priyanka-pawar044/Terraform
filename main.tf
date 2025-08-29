terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
       version = "5.92.0"
      }
    }
}

provider "aws" {
  region = "us-east-1"
}

variable "myenv" {
  type = string
  default = "test"
}

variable "env" {
  type = map(any)
  default = {
    prod = "t2.small"
    test = "t2.micro"
    dev ="t2.medium"
  }
}

resource "aws_instance" "myinstance" {
   ami                     = "ami-00ca32bbc84273381"
   instance_type           = "${var.env["${var.myenv}"]}"
   key_name                = "key1"
   associate_public_ip_address = true
tags = {
  Name = "myinstancel"
  }
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-08c191625cfb7ee61"
  instance_type = "t2.medium"
  key_name = "pushpendra-import"

  tags = {
    Name = "Pushpendra-DevOps-batch-server"
    env = "Production"
    owner = "Pushpendra Singh"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}


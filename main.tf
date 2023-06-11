provider "aws" {
	region = "eu-west-1"
}

resource "aws_instance" "example" {
	ami = "ami-04b1c88a6bbd48f8e"
	instance_type = "t2.micro"

	tags = {
	  Name = "My First Terraform Instance"
	}
}
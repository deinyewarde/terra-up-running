provider "aws" {
	region = "eu-west-1"
}

resource "aws_instance" "example" {
	ami = "ami-0136ddddd07f0584f"
	instance_type = "t2.micro"

	tags = {
	  Name = "My First Terraform Instance"
	}
}
provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "example" {
  ami                    = "ami-0136ddddd07f0584f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
	            #!/bin/bash
              sudo apt -y update
              sudo apt -y install apache2 
              sudo ufw allow 'Apache'
	            echo "Hello, Dee" | sudo tee /var/www/html/index.html
	            EOF

  tags = {
    Name = "My First Terraform Instance"
  }
}

resource "aws_security_group" "instance" {
  name = "terra-sg"

  ingress {
    description = "Allow SSH in"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {
    description = "Allow HTTP in"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All Traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
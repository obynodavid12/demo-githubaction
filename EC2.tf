## Random
# resource "dev-project" "sg" {}

## AWS VPC
resource "aws_vpc" "awsec2demo-vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "vpc-dataalgebra"
  }
}
## AWS VPC Subnet
resource "aws_subnet" "awsec2demo" {
  vpc_id            = aws_vpc.awsec2demo-vpc.id
  cidr_block        = "172.16.10.0/24"
  #availability_zone = "us-east-2a"
  tags = {
    Name = "subnet-dataalgebra"
  }
}

## AWS Network Interface
resource "aws_network_interface" "awsec2demo" {
  subnet_id   = aws_subnet.awsec2demo.id
  private_ips = ["172.16.10.100"]
  security_groups = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "NI-dataalgebra"
  }
}

## AWS Security Group
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh_traffic"
  description = "Allow SSH connection"
  vpc_id      = aws_vpc.awsec2demo-vpc.id
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"  

  }
}

## AWS EC2
resource "aws_instance" "awsec2demo" {
  ami           = "ami-0f597975071f4c4ec"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.awsec2demo.id
    device_index         = 0
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo bash -c 'echo obi and nicole very first web server>/var/www/html/index.html'
              EOF
  tags = {
    Name = "ssh-server"
  }  
              
}           





















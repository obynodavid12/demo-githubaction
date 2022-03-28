## Random
resource "dev-project" "sg" {}

## AWS VPC
resource "aws_vpc" "awsec2demo-vpc" {
  cidr_block = "172.16.0.0/16"
  tags = {
    Name = "vpc-dataalgebra"
  }
}
## AWS VPC Subnet
resource "aws_subnet" "awsec2demo" {
  vpc_id            = aws_vpc.awsec2demo.id
  cidr_block        = "172.16.10.0/24"

  tags = {
    Name = "subnet-dataalgebra"
  }
}

## AWS Network Interface
resource "aws_network_interface" "awsec2demo" {
  subnet_id   = aws_subnet.awsec2demo.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "NI-dataalgebra"
  }
}

## AWS Security Group
resource "aws_security_group" "awsec2demo" {
  name = "${random_dev-project.id}-sg"
  vpc_id      = aws_vpc.awsec2demo.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["68.83.212.136/32"]

  }
}

## AWS EC2
resource "aws_instance" "awsec2demo" {
  ami           = "ami-015848f7d63c649a5"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.awsec2demo.id
    device_index         = 0
  }
}

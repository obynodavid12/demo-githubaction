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
              mkdir /home/ubuntu/actions-runner && cd /home/ubuntu/actions-runner || exit
              curl -o actions-runner-linux-x64-2.289.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.289.2/actions-runner-linux-x64-2.289.2.tar.gz
              tar xzf ./actions-runner-linux-x64-2.289.2.tar.gz
              chown -R ubuntu /home/ubuntu/actions-runner
              EOF
  tags = {
    Name = "ssh-server"
  }  
              
}           





















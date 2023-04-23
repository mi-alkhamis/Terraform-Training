
resource "aws_instance" "server1" {
  instance_type = "t2.micro"
  ami           = "ami-007855ac798b5175e"
  tags          = { "Name" = "WebServer" }
  user_data     = file("./user_data")
  # can also give user data string like 
  # user data = <<EOL
  # !/usr/bin/bash
  # yum -y install http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpmapt install -y btop+
  # yum -y install puppet
  key_name          = aws_key_pair.webserver_key.key_name
  security_groups   = [aws_security_group.EC2_security_group.name]
  availability_zone = "us-east-1a"
}

resource "aws_key_pair" "webserver_key" {
  key_name   = "webserver-ssh-key"
  public_key = file("./WebServer.pub")

}

data "aws_vpc" "default-vpc" {
  id = "vpc-09ded618bf61808d6"

}

resource "aws_security_group" "EC2_security_group" {
  name        = "allow_tls"
  description = "Allow ssh inbound traffic"
  vpc_id      = data.aws_vpc.default-vpc.id

  ingress {
    description = "Access ssh to server"
    from_port   = 0
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description      = "Any outnound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
  tags = {
    name = "Tags_name"
  }
}

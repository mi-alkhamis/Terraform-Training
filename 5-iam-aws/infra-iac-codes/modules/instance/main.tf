resource "aws_instance" "my_instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.instance_key_name
  associate_public_ip_address = var.instance_associate_public_ip_address
  # security_groups             = var.instance_security_groups
  vpc_security_group_ids = var.instance_security_groups
  subnet_id                   = var.instance_subnet_id

  tags = {
    "name" = var.instance_name
  }

}
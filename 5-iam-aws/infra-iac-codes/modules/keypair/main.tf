resource "aws_key_pair" "aws_key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.ssh_key_pair.public_key_openssh

}


resource "tls_private_key" "ssh_key_pair" {
  algorithm = "ED25519"
}

resource "local_file" "aws_ssh_file" {
  filename        = "ssh.key"
  content         = tls_private_key.ssh_key_pair.private_key_openssh
  file_permission = "0600" # file permission for ssh.key file

}
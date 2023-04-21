output "public_ip4" {
  value = aws_instance.ubuntu_server.public_ip
}
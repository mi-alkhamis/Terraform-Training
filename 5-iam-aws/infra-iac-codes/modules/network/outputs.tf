output "vpc_default_security_group" {
  value = aws_security_group.aws_security_group.id

}

output "vpc_subnet_ids" {
  value = [
    for v in aws_subnet.subnet : v.id
  ]

}
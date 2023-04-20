data "aws_ami" "name" {
  filter {
    name   = "name"
    values = ["Amazon Linux*"]
  }
}
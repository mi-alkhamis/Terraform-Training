resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  # dafault_tags = {
  #   "Created_By" = "Terraform"
  # }
  tags = var.network_infra_tags
}


resource "aws_subnet" "subnet" {
  for_each                = var.subnet_cidr_block
  cidr_block              = each.value.subnet
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.public_ip_on_launch
  # dafault_tags = {
  #   "Created_By" = "Terraform"
  # }
  tags = var.network_infra_tags

}
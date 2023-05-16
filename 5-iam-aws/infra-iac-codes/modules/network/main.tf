resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  # dafault_tags = {
  #   "Created_By" = "Terraform"
  # }
  tags = var.network_infra_tags
}


resource "aws_subnet" "subnet" {
  for_each                = var.subnet_cidr_block
  cidr_block              = each.value.subnet_cidr_block
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.public_ip_on_launch
  # dafault_tags = {
  #   "Created_By" = "Terraform"
  # }
  tags = var.network_infra_tags

}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.network_infra_tags


}

#  dont need to attach when create a new one :)
# resource "aws_internet_gateway_attachment" "internet_gateway_attachment" {
#   vpc_id = aws_vpc.vpc.id
#   internet_gateway_id = aws_internet_gateway.internet_gateway.id

# } 




data "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

}

resource "aws_route" "route_to_internet_gateway" {
  route_table_id         = data.aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id

}

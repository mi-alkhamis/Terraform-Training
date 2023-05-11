
variable "network_infra_tags" {
  default = {
    "Name"  = "MainNetwork",
    "Scope" = "NonProd"
  }

}
variable "vpc_cidr_block" {
  default = "10.10.0.0/16"

}
variable "subnet_cidr_block" {
  default = {
    "az1" = {
      "subnet_cidr_block"       = "10.10.1.0/24",
      "map_ip_public_on_launch" = true,
      "availability_zone"       = "us-east-1a"
    },
    "az2" = {
      "subnet_cidr_block"       = "10.10..0/24",
      "map_ip_public_on_launch" = true,
      "availability_zone"       = "us-east-1b"
    },
  }

}
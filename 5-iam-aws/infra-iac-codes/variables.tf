variable "aws_ssh_key_pair_name" {
  default = "MyKey"

}

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
      "subnet_cidr_block"   = "10.10.1.0/24",
      "public_ip_on_launch" = true,
      "availability_zone"   = "us-east-1a"
    },
    "az2" = {
      "subnet_cidr_block"   = "10.10.2.0/24",
      "public_ip_on_launch" = true,
      "availability_zone"   = "us-east-1b"
    },
    "az3" = {
      "subnet_cidr_block"   = "10.10.3.0/24",
      "public_ip_on_launch" = false,
      "availability_zone"   = "us-east-1c"
    },
  }

}


variable "ec2_instances" {
  default = {
    "instance1" = {
      name          = "instance_1"
      ami           = "ami-007855ac798b5175e"
      type          = "t2.micro"
      set_public_ip = true
    }
    "instance2" = {
      name          = "instance_2"
      ami           = "ami-007855ac798b5175e"
      type          = "t2.micro"
      set_public_ip = true
    }
  }
}


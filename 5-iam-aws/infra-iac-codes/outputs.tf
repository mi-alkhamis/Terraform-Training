output "subnet_ids" {
  value = module.infra_network.vpc_subnet_ids
}

output "az_list" {

  value = data.aws_availability_zones.available.names

}

output "instance_public_ip" {
  value = { 
    for k,v in  module.ec2_instances : k => v.instance_public_ip 
    }
  
}



output "instance_private_ip" {
  value = { 
    for k,v in  module.ec2_instances : k => v.instance_private_ip 
    }
  
}



# output "instance_public_ip" {
#   value = module.ec2_instances
# } 

# Print The whole output of the module
# Like Below
          # instance_public_ip = {
          #   "instance1" = {
          #     "instance_private_ip" = "10.10.2.150"
          #     "instance_public_ip" = "34.226.139.11"
          #   }
          #   "instance2" = {
          #     "instance_private_ip" = "10.10.2.254"
          #     "instance_public_ip" = "54.172.94.191"
          #   }
          # }
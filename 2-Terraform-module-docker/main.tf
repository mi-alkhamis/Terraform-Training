module "nginx" {
  source                    = "./nginx"
  nginx_version =    "1.19"
  deployment_name         = "my_naginx"
  common_name =   "milad.local"
  dns_name = ["nginx.local","www.nginx.local"]
}

output "nginx_output" {
  value = module.nginx.nginx_address



}


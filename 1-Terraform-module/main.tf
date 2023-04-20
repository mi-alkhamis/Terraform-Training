module "nginx" {
  source                    = "./nginx"
  deployment_name           = "myNginx"
  nginx_deployment_replicas = 4
  deployment_image          = "nginx:1.19"
  default_namespace         = "default"
}

output "nginx_service_port" {
  value = module.nginx.ServicePort


}


variable "deployment_name" {
  type        = string
  default     = "nginx"
  description = "Nginx container name"
}
variable "default_namespace" {
  type        = string
  default     = "default"
  description = "default namespce"
}
variable "nginx_deployment_replicas" {
  type        = number
  default     = 3
  description = "number of replicas"
}
variable "deployment_image" {
  type        = string
  default     = "nginx:latest"
  description = "Deployment resource image"
}






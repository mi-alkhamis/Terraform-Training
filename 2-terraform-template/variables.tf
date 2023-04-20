variable "kubernetes_deployment" {
  type = map(any)
  default = {
    nginx = {
      namespace = "default"
      image     = "nginx:latest"
    },
    httpd = {

    }
  }
  description = "description"
}

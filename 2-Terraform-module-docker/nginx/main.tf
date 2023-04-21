# https://github.com/ssbostan/terraform-awesome

resource "docker_image" "nginx_image" {
  name = join(":", ["nginx", var.nginx_version])
}

resource "docker_container" "nginx_container" {
  name    = var.deployment_name
  image   = docker_image.nginx_image.name
  restart = var.restart_policy
  memory  = var.memory_limit
  volumes {
    host_path      = abspath("nginx.conf")
    container_path = "/etc/nginx/nginx.conf"
  }
  volumes {
    host_path      = abspath("tls.crt")
    container_path = "/etc/nginx/certs/tls.crt"
  }
  volumes {
    host_path      = abspath("tls.key")
    container_path = "/etc/nginx/certs/tls.key"
  }
  ports {
    internal = "80"
    external = var.http_port
  }
  ports {
    internal = "443"
    external = var.https_port
  }
  labels {
    label = "app.docker.io/name"
    value = "nginx"
  }
  labels {
    label = "app.docker.io/created-by"
    value = "terraform-awesome"
  }
  depends_on = [
    local_file.nginx_https_tls_key,
    local_file.nginx_https_tls_cert
  ]
}

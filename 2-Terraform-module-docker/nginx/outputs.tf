output "nginx_address" {
  value = "https://${var.common_name}:${var.https_port}"
}

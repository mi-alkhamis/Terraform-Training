output ServicePort {
  value       = "Nodport is ${kubernetes_service.nginx.spec.0.port.0.node_port}"
  sensitive   = true
  description = "show node port"
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx-service"
    namespace = var.default_namespace
  }
  spec {
    selector = {
      "app.kubernetes.io/name" = "nginx"
      "app.kubernetes.io/type" = "deployment"
    }
    port {
      port = 80
    }
    type = "NodePort"
  }

}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = var.deployment_name
    namespace = var.default_namespace
    labels = {
      "app.kubernetes.io/name" = "nginx"
      "app.kubernetes.io/type" = "deployment"
    }
  }
  spec {
    replicas = var.nginx_deployment_replicas
    selector {
      match_labels = {
        "app.kubernetes.io/name" = "nginx"
        "app.kubernetes.io/type" = "deployment"
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = "nginx"
          "app.kubernetes.io/type" = "deployment"

        }
      }
      spec {
        container {
          image = var.deployment_image
          name  = var.deployment_name
        }
      }
    }
  }

  lifecycle {
    replace_triggered_by = [
      kubernetes_service.nginx.id,
    ]
  }
  depends_on = [
    kubernetes_service.nginx,
  ]
}



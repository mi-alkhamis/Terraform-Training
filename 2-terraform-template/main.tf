resource "kubernetes_deployment" "deployment" {
  for_each = var.kubernetes_deployment
  metadata {
    name      = each.key
    namespace = each.value.namespace
    labels = {
      "app.kubernetes.io/name" = each.key
    }
  }
  spec {
    selector {
      match_labels = {
        "app.kubernetes.io/name" = each.key
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = each.key
        }
      }
      spec {
        container {
          image = each.value.image
          name  = each.key
        }
      }
    }
  }
}

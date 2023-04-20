
resource "kubernetes_deployment" "redis" {
  metadata {
    name      = "redis"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name" = "redis"
    }
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        "app.kubernetes.io/name" = "redis"
      }
    }
    template {
      metadata {
        labels = {
          "app.kubernetes.io/name" = "redis"

        }
      }
      spec {
        container {
          image = "redis:latest"
          name  = "redis"
          args  = ["redis-server", "/etc/redis/redis.conf"]
          volume_mount {
            mount_path = "/etc/redis/"
            name       = "redis-volume"
          }
        }
        volume {
          name = "redis-volume"
          config_map {
            name = kubernetes_config_map.redis.metadata.0.name
          }
        }
      }
    }
  }

  lifecycle {
    replace_triggered_by = [
      kubernetes_config_map.redis.data
    ]
  }
}
resource "kubernetes_config_map" "redis" {
  metadata {
    name      = "redis"
    namespace = "default"
    labels = {
      "app.kubernetes.io/name" = "redis"
    }
  }
  data = {
    "redis.conf" = "appendOnly yes\nappendfilename \"test.aof\""
  }
}

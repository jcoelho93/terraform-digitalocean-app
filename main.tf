resource "digitalocean_app" "main" {
  spec {
    name   = var.name
    region = var.region
    dynamic "domain" {
      for_each = var.domain != null ? [true] : []
      content {
        name = var.domain
      }
    }
    dynamic "alert" {
      for_each = var.alert_rules
      content {
        rule     = alert.value
        disabled = false
      }
    }
    service {
      name               = var.name
      instance_count     = var.instance_count
      instance_size_slug = var.instance_size

      dynamic "github" {
        for_each = var.type == "github" ? [true] : []
        content {
          branch         = var.branch
          repo           = var.github_repository
          deploy_on_push = true
        }
      }
      dynamic "image" {
        for_each = var.type == "image" ? [true] : []
        content {
          registry_type        = "GHCR"
          registry             = var.registry
          repository           = var.image == null ? var.name : var.image
          registry_credentials = var.registry_credentials
          tag                  = var.image_tag
        }
      }
      dynamic "health_check" {
        for_each = var.health_check != null ? [true] : []
        content {
          http_path             = var.health_check.http_path
          port                  = var.health_check.port
          initial_delay_seconds = var.health_check.initial_delay_seconds
          period_seconds        = var.health_check.period_seconds
          timeout_seconds       = var.health_check.timeout_seconds
          success_threshold     = var.health_check.success_threshold
          failure_threshold     = var.health_check.failure_threshold
        }
      }
    }
    ingress {
      rule {
        component {
          name                 = var.name
          preserve_path_prefix = true
        }
        match {
          path {
            prefix = "/"
          }
        }
      }
    }
  }
  lifecycle {
    ignore_changes = [spec[0].service[0].image[0].registry_credentials]
  }
}

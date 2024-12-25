terraform {
  required_version = "~> 1.9"
}

variable "registry_credentials" {
  type = object({
    username = string
    password = string
  })
  sensitive = true
}

module "app" {
  source               = "../../"
  name                 = "api"
  type                 = "image"
  registry_credentials = "${var.registry_credentials.username}:${var.registry_credentials.password}"

  health_check = {
    http_path = "/health"
  }

  notification_emails = ["notifications@example.org"]
}

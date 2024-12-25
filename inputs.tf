variable "name" {
  type        = string
  description = "Name of the app"
}

variable "region" {
  type        = string
  description = "Region of the app. Default is Amsterdam"
  default     = "ams"
}

variable "type" {
  type        = string
  default     = "image"
  description = "Type of the app. One of `image` or `github`"
  validation {
    condition     = contains(["image", "github"], var.type)
    error_message = "Invalid type"
  }
}

variable "github_repository" {
  type        = string
  description = "GitHub repository to deploy from, required if type is `github`. eg. reportr-news/my-app"
  default     = null
  validation {
    error_message = "If type is github then github_repository must be set."
    condition     = var.type != "github" || var.github_repository != null
  }
}

variable "branch" {
  type        = string
  description = "Branch to deploy from. Required if type is `github`. Default is main"
  default     = "main"
  validation {
    error_message = "If type is github then branch must be set."
    condition     = var.type != "github" || var.branch != null
  }
}

variable "domain" {
  type        = string
  description = "Domain of the app"
  default     = null
}

variable "instance_count" {
  type        = number
  description = "Number of instances to run. Default is 1"
  default     = 1
}

variable "instance_size" {
  type        = string
  description = "Size of the instances. Default is apps-s-1vcpu-0.5gb"
  default     = "apps-s-1vcpu-0.5gb"
}

variable "registry" {
  type        = string
  description = "Container registry to pull the image from. Required if type is `image`"
  default     = null
  validation {
    error_message = "If type is image then registry must be set."
    condition     = var.type != "image" || var.registry != null
  }
}

variable "image" {
  type        = string
  description = "Container image to deploy. If not provided, the name of the app will be used"
  default     = null
}

variable "image_tag" {
  type        = string
  description = "Container image tag to deploy. Default is latest"
  default     = "latest"
  validation {
    error_message = "If type is image then image_tag must be set."
    condition     = var.type != "image" || var.image_tag != null
  }
}

variable "registry_credentials" {
  type        = string
  description = "Image registry credentials, in the format username:password"
  default     = null
  validation {
    error_message = "If type is image then registry_credentials must be set."
    condition     = var.type != "image" || var.registry_credentials != null
  }
  sensitive = true
}

variable "health_check" {
  type = object({
    http_path             = optional(string)
    port                  = optional(number)
    initial_delay_seconds = optional(number)
    period_seconds        = optional(number)
    timeout_seconds       = optional(number)
    success_threshold     = optional(number)
    failure_threshold     = optional(number)
  })
  description = "Health check configuration"
  default     = null
}

variable "slack_notifications" {
  type = object({
    channel = string
    url     = optional(string)
  })
  default = null
}

variable "notification_emails" {
  type    = list(string)
  default = ["notifications@example.com"]
}

variable "alert_rules" {
  type        = list(string)
  description = "List of alert rules to create. Default is DEPLOYMENT_FAILED and DOMAIN_FAILED"
  default = [
    "DEPLOYMENT_FAILED",
    "DOMAIN_FAILED"
  ]
}

variable "uptime_alert" {
  type        = bool
  description = "If true sets up an uptime check for the app. Default is true"
  default     = true

}

variable "uptime_check_regions" {
  type        = list(string)
  default     = ["eu_west"]
  description = "List of regions to run the uptime check in. Default is eu_west"
}

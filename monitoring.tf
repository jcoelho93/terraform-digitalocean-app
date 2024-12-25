resource "digitalocean_uptime_check" "main" {
  count   = var.uptime_alert ? 1 : 0
  name    = "${var.name}-uptime-check"
  target  = digitalocean_app.main.live_url
  regions = var.uptime_check_regions
}

resource "digitalocean_uptime_alert" "main" {
  count      = var.uptime_alert ? 1 : 0
  name       = "${var.name}-uptime-alert"
  check_id   = digitalocean_uptime_check.main[0].id
  type       = "down"
  comparison = "less_than"
  period     = "5m"
  threshold  = 1
  notifications {
    dynamic "slack" {
      for_each = var.slack_notifications != null ? [true] : []
      content {
        channel = var.slack_notifications.channel
        url     = var.slack_notifications.url
      }
    }
    email = var.notification_emails
  }
}

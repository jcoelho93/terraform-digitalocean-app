output "app_url" {
  value       = digitalocean_app.main.live_url
  description = "Live URL of the app"
}

# Terraform DigitalOcean App Module

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | ~> 2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | ~> 2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_app.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/app) | resource |
| [digitalocean_uptime_alert.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/uptime_alert) | resource |
| [digitalocean_uptime_check.main](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/uptime_check) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_rules"></a> [alert\_rules](#input\_alert\_rules) | List of alert rules to create. Default is DEPLOYMENT\_FAILED and DOMAIN\_FAILED | `list(string)` | <pre>[<br/>  "DEPLOYMENT_FAILED",<br/>  "DOMAIN_FAILED"<br/>]</pre> | no |
| <a name="input_branch"></a> [branch](#input\_branch) | Branch to deploy from | `string` | `"main"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain of the app | `string` | `null` | no |
| <a name="input_github_repository"></a> [github\_repository](#input\_github\_repository) | GitHub repository to deploy from. eg. reportr-news/my-app | `string` | `null` | no |
| <a name="input_health_check"></a> [health\_check](#input\_health\_check) | Health check configuration | <pre>object({<br/>    http_path             = optional(string)<br/>    port                  = optional(number)<br/>    initial_delay_seconds = optional(number)<br/>    period_seconds        = optional(number)<br/>    timeout_seconds       = optional(number)<br/>    success_threshold     = optional(number)<br/>    failure_threshold     = optional(number)<br/>  })</pre> | `null` | no |
| <a name="input_image"></a> [image](#input\_image) | Container image to deploy. If not provided, the name of the app will be used | `string` | `null` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | Container image tag to deploy. Default is latest | `string` | `"latest"` | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | Number of instances to run. Default is 1 | `number` | `1` | no |
| <a name="input_instance_size"></a> [instance\_size](#input\_instance\_size) | Size of the instances. Default is apps-s-1vcpu-0.5gb | `string` | `"apps-s-1vcpu-0.5gb"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the app | `string` | n/a | yes |
| <a name="input_notification_emails"></a> [notification\_emails](#input\_notification\_emails) | n/a | `list(string)` | <pre>[<br/>  "notifications@example.com"<br/>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Region of the app. Default is Amsterdam | `string` | `"ams"` | no |
| <a name="input_registry"></a> [registry](#input\_registry) | Container registry to pull the image from. Default is reportr-news | `string` | `"reportr-news"` | no |
| <a name="input_registry_credentials"></a> [registry\_credentials](#input\_registry\_credentials) | Image registry credentials, in the format username:password | `string` | `null` | no |
| <a name="input_slack_notifications"></a> [slack\_notifications](#input\_slack\_notifications) | n/a | <pre>object({<br/>    channel = string<br/>    url     = optional(string)<br/>  })</pre> | `null` | no |
| <a name="input_type"></a> [type](#input\_type) | Type of the app. One of 'image' or 'github' | `string` | `"image"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_url"></a> [app\_url](#output\_app\_url) | n/a |
<!-- END_TF_DOCS -->

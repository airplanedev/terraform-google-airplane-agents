# terraform-google-airplane-agents/modules/storage

This terraform module creates the non-Kubernetes infrastructure needed to run
Airplane agents with self-hosted storage.

See the [Airplane docs](https://docs.airplane.dev/self-hosting/storage) for more details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.12.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_global_address.agent_external_server](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_redis_instance.agent_storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |
| [google_storage_bucket.agent_storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [http_http.update_external_alb_dns](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_token"></a> [api\_token](#input\_api\_token) | Airplane API key - generate one via `airplane apikeys create`. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region for agent | `string` | n/a | yes |
| <a name="input_service_account_email"></a> [service\_account\_email](#input\_service\_account\_email) | Email for service account | `string` | n/a | yes |
| <a name="input_team_id"></a> [team\_id](#input\_team\_id) | Airplane team ID - retrieve via `airplane auth info` | `string` | n/a | yes |
| <a name="input_agent_storage_domain"></a> [agent\_storage\_domain](#input\_agent\_storage\_domain) | For development purposes only | `string` | `"d.airstage.app"` | no |
| <a name="input_agent_storage_zone_slug"></a> [agent\_storage\_zone\_slug](#input\_agent\_storage\_zone\_slug) | Zone slug for use with self-hosted agent storage | `string` | `"gke"` | no |
| <a name="input_api_host"></a> [api\_host](#input\_api\_host) | For development purposes only | `string` | `"https://api.airstage.app"` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Suffix to be added to all names; a dash will be automatically added at the beginning | `string` | `"gke"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_agent_server_addr_name"></a> [agent\_server\_addr\_name](#output\_agent\_server\_addr\_name) | n/a |
| <a name="output_agent_server_ip"></a> [agent\_server\_ip](#output\_agent\_server\_ip) | n/a |
| <a name="output_storage_bucket_name"></a> [storage\_bucket\_name](#output\_storage\_bucket\_name) | n/a |
| <a name="output_storage_redis_addr"></a> [storage\_redis\_addr](#output\_storage\_redis\_addr) | n/a |
<!-- END_TF_DOCS -->

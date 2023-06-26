variable "agent_storage_domain" {
  type        = string
  description = "For development purposes only"
  default     = "d.airstage.app"
}

variable "agent_storage_zone_slug" {
  type        = string
  description = "Zone slug for use with self-hosted agent storage"
  default     = "test"
}

variable "api_host" {
  type        = string
  description = "For development purposes only"
  default     = "https://api.airstage.app"
}

variable "api_token" {
  type        = string
  description = "Airplane API key - generate one via `airplane apikeys create`."
  sensitive   = true
}

variable "name_suffix" {
  type        = string
  description = "Suffix to be added to all names; a dash will be automatically added at the beginning"
  default     = "test"
}

variable "region" {
  type        = string
  description = "Region for agent"
}

variable "team_id" {
  type        = string
  description = "Airplane team ID - retrieve via `airplane auth info`"
}

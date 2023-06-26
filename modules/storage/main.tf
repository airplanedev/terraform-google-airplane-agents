resource "google_service_account" "agent_storage" {
  account_id   = "ap-agent-${var.name_suffix}"
  display_name = "Airplane agent service account"
}

resource "google_storage_bucket" "agent_storage" {
  name          = "airplane-agent-storage-${var.name_suffix}"
  location      = var.region
  storage_class = "STANDARD"

  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "policy" {
  bucket = google_storage_bucket.agent_storage.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.agent_storage.email}"
}

resource "google_redis_instance" "agent_storage" {
  name           = "airplane-agent-storage-${var.name_suffix}"
  tier           = "STANDARD_HA"
  region         = var.region
  memory_size_gb = 1
  redis_version  = "REDIS_6_X"
}

resource "google_compute_address" "agent_external_server" {
  name   = "agent-storage-${var.name_suffix}"
  region = var.region
}

data "http" "update_external_alb_dns" {
  url    = "${var.api_host}/v0/zones/updateDNS"
  method = "POST"

  request_headers = {
    "X-Airplane-API-Key" = var.api_token
  }
  request_body = jsonencode({
    hostname             = "${var.agent_storage_zone_slug}.${var.team_id}.${var.agent_storage_domain}."
    loadBalancerHostname = "${aws_alb.external[0].dns_name}."
  })

  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "Status code invalid"
    }
  }
}

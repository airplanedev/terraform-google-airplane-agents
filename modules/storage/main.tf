resource "google_storage_bucket" "agent_storage" {
  name          = "airplane-agent-storage-${var.name_suffix}"
  location      = var.region
  storage_class = "STANDARD"

  public_access_prevention = "enforced"
  uniform_bucket_level_access = true
}

resource "google_redis_instance" "redis" {
  name           = "airplane-agent-storage-${var.name_suffix}"
  tier           = "BASIC"
  region         = var.region
  memory_size_gb = 2
  redis_version  = "REDIS_6_X"
}

resource "google_storage_bucket" "agent_storage" {
  name          = "BUCKET_NAME"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

resource "google_redis_instance" "redis" {
  name           = "myinstance"
  tier           = "BASIC"
  memory_size_gb = 2
  region         = "us-central1"
  redis_version  = "REDIS_6_X"
}

output "agent_service_account_id" {
  value = google_service_account.agent_storage.id
}

output "agent_service_account_email" {
  value = google_service_account.agent_storage.email
}

output "storage_bucket_name" {
  value = google_storage_bucket.agent_storage.name
}

output "storage_redis_addr" {
  value = "${google_redis_instance.agent_storage.host}:${google_redis_instance.agent_storage.port}"
}

output "agent_server_ip" {
  value = google_compute_address.agent_external_server.address
}

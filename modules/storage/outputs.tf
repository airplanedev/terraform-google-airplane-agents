output "agent_server_addr_name" {
  value = google_compute_global_address.agent_external_server.name
}

output "agent_server_ip" {
  value = google_compute_global_address.agent_external_server.address
}

output "service_account_email" {
  value = var.service_account_email != "" ? var.service_account_email : google_service_account.agent_storage[0].email
}

output "storage_bucket_name" {
  value = google_storage_bucket.agent_storage.name
}

output "storage_redis_auth_string" {
  value     = google_redis_instance.agent_storage.auth_string
  sensitive = true
}

output "storage_redis_addr" {
  value = "${google_redis_instance.agent_storage.host}:${google_redis_instance.agent_storage.port}"
}

output "storage_redis_ca_cert" {
  value = (
    var.redis_transit_encryption_mode == "SERVER_AUTHENTICATION"
    ? google_redis_instance.agent_storage.server_ca_certs[0].cert
    : ""
  )
}

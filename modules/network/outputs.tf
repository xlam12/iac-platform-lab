output "network_id" {
  value = google_compute_network.vpc.id
}

output "subnet_ids" {
  value = {
    for k, v in google_compute_subnetwork.subnets :
    k => v.id
  }
}

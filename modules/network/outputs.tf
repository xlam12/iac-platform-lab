output "network_id" {
  value = google_compute_network.vpc.id
}

output "router_name" {
  value = google_compute_router.router.name
}

output "nat_name" {
  value = google_compute_router_nat.nat.name
}

######################################
output "vpc_name" {
  value = google_compute_network.vpc.name
}

output "subnets" {
  description = "Subnet name by key"
  value = {
    for k, s in google_compute_subnetwork.subnets :
    k => s.name
  }
}

output "subnet_ids" {
  description = "Subnet ID by key"
  value = {
    for k, s in google_compute_subnetwork.subnets :
    k => s.id
  }
}

output "pod_ranges" {
  description = "Pod secondary range names per subnet"
  value = {
    for k, s in google_compute_subnetwork.subnets :
    k => s.secondary_ip_range[0].range_name
  }
}

output "service_ranges" {
  description = "Service secondary range names per subnet"
  value = {
    for k, s in google_compute_subnetwork.subnets :
    k => s.secondary_ip_range[1].range_name
  }
}

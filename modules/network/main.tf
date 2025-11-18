resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each               = var.subnets
  name                   = each.value.name
  ip_cidr_range          = each.value.cidr
  region                 = var.region
  network                = google_compute_network.vpc.id
  private_ip_google_access = true
}

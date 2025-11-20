
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  name          = each.value.name
  region        = var.region
  network       = google_compute_network.vpc.id
  ip_cidr_range = each.value.primary_cidr

  private_ip_google_access = true

  # 🚀 Modern GKE best practice — embed pod + service ranges here
  secondary_ip_range {
    range_name    = "${each.key}-pods"
    ip_cidr_range = each.value.pod_cidr
  }

  secondary_ip_range {
    range_name    = "${each.key}-services"
    ip_cidr_range = each.value.service_cidr
  }
}


#Step 4: Add Router + NAT + Firewall to modules/network/main.tf

resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router"
  region  = var.region
  network = google_compute_network.vpc.id
}


resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc_name}-nat"
  router                             = google_compute_router.router.name
  region                             = var.region

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}


resource "google_compute_firewall" "allow_internal" {
  name    = "${var.vpc_name}-allow-internal"
  network = google_compute_network.vpc.name

  allow {
    protocol = "all"
  }

  source_ranges = ["10.0.0.0/8"]  # (covers your 10.10.x.x ranges)
}

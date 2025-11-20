resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  network    = var.network
  subnetwork = var.subnet

  ip_allocation_policy {
    cluster_secondary_range_name  = var.pod_range
    services_secondary_range_name = var.service_range
  }

  release_channel {
    channel = "REGULAR"
  }

  remove_default_node_pool = true
  initial_node_count       = 1

  master_authorized_networks_config {
    cidr_blocks = [
      for cidr in var.master_authorized_ranges : {
        cidr_block   = cidr
        display_name = "allowed"
      }
    ]
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  network_policy {
    enabled  = true
    provider = "CALICO"
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  resource_labels = var.labels

  maintenance_policy {
    recurring_window {
      window {
        daily_maintenance_window {
          start_time = "03:00"
        }
      }
    }
  }
}


# Node pool module block (in same file)

resource "google_container_node_pool" "primary_nodes" {
  cluster  = google_container_cluster.primary.name
  location = var.region
  name     = "${var.cluster_name}-primary-nodes"

  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.disk_size
    image_type   = "COS_CONTAINERD"

    labels = {
      env = var.environment
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    tags = ["gke-node"]
  }

  autoscaling {
    min_node_count = var.autoscale_min
    max_node_count = var.autoscale_max
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}


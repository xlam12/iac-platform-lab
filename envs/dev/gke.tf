module "gke" {
  source = "../../modules/gke"

  project_id = var.project_id
  region     = var.region

  cluster_name = "xuan-dev-gke"
  environment  = "dev"

  network = module.network.vpc_name
  subnet  = module.network.subnets["private"]

  pod_range     = module.network.pod_ranges["private"]
  service_range = module.network.service_ranges["private"]

  master_authorized_ranges = ["0.0.0.0/0"]
}

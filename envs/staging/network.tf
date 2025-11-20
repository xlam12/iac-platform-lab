module "network" {
  source = "../../modules/network"

  vpc_name = "xuan-staging-vpc"
  region   = var.region

  subnets = {
    public = {
      name         = "xuan-staging-public-subnet"
      primary_cidr = "10.1.1.0/24"
      pod_cidr     = "10.12.0.0/20"
      service_cidr = "10.22.0.0/20"
    }
    private = {
      name         = "xuan-staging-private-subnet"
      primary_cidr = "10.1.2.0/24"
      pod_cidr     = "10.13.0.0/20"
      service_cidr = "10.23.0.0/20"
    }
  }
}

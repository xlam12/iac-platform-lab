module "network" {
  source = "../../modules/network"

  vpc_name = "xuan-dev-vpc"
  region   = var.region

  subnets = {
    public = {
      name         = "xuan-dev-public-subnet"
      primary_cidr = "10.0.1.0/24"
      pod_cidr     = "10.10.0.0/20"
      service_cidr = "10.20.0.0/20"
    }
    private = {
      name         = "xuan-dev-private-subnet"
      primary_cidr = "10.0.2.0/24"
      pod_cidr     = "10.11.0.0/20"
      service_cidr = "10.21.0.0/20"
    }
  }
}

terraform {
  required_version = ">= 1.9.0"
}

variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}


#Include provider config
provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
}

# Placeholder for modules we will add later
module "network" {
  source = "../../modules/network"

  vpc_name = "dev-vpc"
  region   = var.region

  subnets = {
    public = {
      name = "dev-public-subnet"
      cidr = "10.10.1.0/24"
    }
    private = {
      name = "dev-private-subnet"
      cidr = "10.10.2.0/24"
    }
  }
}

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

  vpc_name = "staging-vpc"
  region   = var.region

  subnets = {
    public = {
      name = "staging-public-subnet"
      cidr = "10.20.1.0/24"
    }
    private = {
      name = "staging-private-subnet"
      cidr = "10.20.2.0/24"
    }
  }
}

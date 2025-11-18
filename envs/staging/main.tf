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


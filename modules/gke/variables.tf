variable "project_id" {}
variable "region" {}

variable "network" {}
variable "subnet" {}

variable "cluster_name" {}
variable "environment" {}

variable "pod_range" {}
variable "service_range" {}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "node_count"    { default = 1 }
variable "machine_type"  { default = "e2-medium" }
variable "disk_size"     { default = 50 }

variable "autoscale_min" { default = 1 }
variable "autoscale_max" { default = 3 }

variable "master_authorized_ranges" {
  type = list(string)
  default = []
}

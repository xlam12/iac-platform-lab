variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "region" {
  description = "Region for subnets"
  type        = string
}

variable "subnets" {
  description = "Map of subnets with primary + secondary ranges"
  type = map(object({
    name         = string
    primary_cidr = string
    pod_cidr     = string
    service_cidr = string
  }))
}
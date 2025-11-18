variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "region" {
  description = "Region for subnets"
  type        = string
}

variable "subnets" {
  description = "Map of subnets to create"
  type = map(object({
    name = string
    cidr = string
  }))
}


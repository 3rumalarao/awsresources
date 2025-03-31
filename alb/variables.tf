variable "app_name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "route53_zone_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

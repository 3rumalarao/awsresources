variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "performance_mode" {
  type = string
}

variable "encrypted" {
  type = bool
}

variable "security_groups" {
  type = list(string)
}

variable "mount_points" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

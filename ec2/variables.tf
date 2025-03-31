variable "instance_count" {
  type = number
}

variable "instance_config" {
  type = object({
    name            = string,
    ami             = list(string),
    instance_type   = string,
    security_groups = list(string),
    key_name        = string
  })
}

variable "subnet_ids" {
  type = list(string)
}

variable "iam_role" {
  type = string
}

variable "assign_public_ip" {
  type = bool
}

variable "common_tags" {
  type = map(string)
}

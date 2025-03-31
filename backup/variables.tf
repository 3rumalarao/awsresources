variable "create_snapshots" {
  type = bool
}

variable "instance_ids" {
  type = list(string)
}

variable "retention_days" {
  type = number
}

variable "backup_vault_name" {
  type = string
}

variable "backup_role_arn" {
  type = string
}

output "efs_id" {
  value = aws_efs_file_system.this.id
}

output "mount_target_ids" {
  value = aws_efs_mount_target.this[*].id
}

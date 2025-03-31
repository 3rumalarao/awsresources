resource "aws_efs_file_system" "this" {
  performance_mode = var.performance_mode
  encrypted        = var.encrypted
  tags             = merge(var.common_tags, { Name = "efs" })
}

resource "aws_efs_mount_target" "this" {
  count            = length(var.private_subnet_ids)
  file_system_id   = aws_efs_file_system.this.id
  subnet_id        = var.private_subnet_ids[count.index]
  security_groups  = var.security_groups
}

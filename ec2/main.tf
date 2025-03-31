resource "aws_instance" "this" {
  count                     = var.instance_count
  ami                       = var.instance_config.ami[count.index % length(var.instance_config.ami)]
  instance_type             = var.instance_config.instance_type
  subnet_id                 = var.subnet_ids[count.index % length(var.subnet_ids)]
  vpc_security_group_ids    = var.instance_config.security_groups
  key_name                  = var.instance_config.key_name
  associate_public_ip_address = var.assign_public_ip
  iam_instance_profile      = var.iam_role != "" ? var.iam_role : null

  tags = merge(var.common_tags, {
    Name = var.instance_config.name
  })
}

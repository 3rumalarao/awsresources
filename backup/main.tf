resource "aws_backup_plan" "this" {
  count = var.create_snapshots ? 1 : 0

  name = "backup-plan"

  rule {
    rule_name         = "daily-snapshots"
    target_vault_name = var.backup_vault_name
    schedule          = "cron(0 0 * * ? *)"
    lifecycle {
      delete_after = var.retention_days
    }
  }
}

resource "aws_backup_selection" "this" {
  count        = var.create_snapshots ? 1 : 0
  name         = "backup-selection"
  iam_role_arn = var.backup_role_arn
  resources    = var.instance_ids
  plan_id      = aws_backup_plan.this[0].id
}

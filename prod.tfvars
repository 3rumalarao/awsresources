region                   = "us-east-1"
vpc_cidr                 = "10.0.0.0/16"
public_subnets           = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets          = ["10.0.101.0/24", "10.0.102.0/24"]
azs                      = ["us-east-1a", "us-east-1b"]
enable_vpc_flow_logs     = true

dynamic_dhcp_options = {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
}

common_tags = {
  Environment = "prod"
  Project     = "aws-solution"
  Owner       = "team"
}

iam_role = "my-common-iam-role"

private_servers = {
  "app1" = {
    name            = "private-app1"
    ami             = ["ami-prod-app1"]
    instance_type   = "t3.medium"
    security_groups = ["sg-prod-app1", "sg-additional1", "sg-additional2"]
    key_name        = "mykey"
  },
  "app2" = {
    name            = "private-app2"
    ami             = ["ami-prod-app2"]
    instance_type   = "t3.medium"
    security_groups = ["sg-prod-app2", "sg-additional3", "sg-additional4"]
    key_name        = "mykey"
  }
}

applications = {
  "app1" = {
    name            = "app1"
    ami             = ["ami-prod-app1"]
    instance_type   = "m5.xlarge"
    security_groups = ["sg1", "sg2"]
    domain_name     = "app1-prod.internal.example.com"
    key_name        = "mykey"
  },
  "app2" = {
    name            = "app2"
    ami             = ["ami-prod-app2"]
    instance_type   = "t3.large"
    security_groups = ["sg56", "sg4534"]
    domain_name     = "app2-prod.internal.example.com"
    key_name        = "mykey"
  },
  "app3" = {
    name            = "app3"
    ami             = ["ami-prod-app3"]
    instance_type   = "m5.large"
    security_groups = ["sg10", "sg11"]
    domain_name     = "app3-prod.internal.example.com"
    key_name        = "mykey"
  }
}

public_instances = {
  "app1" = {
    name            = "public-app1"
    ami             = ["ami-prod-app1"]
    instance_type   = "t3.medium"
    security_groups = ["sg-prod-app1", "sg-additional1", "sg-additional2"]
    key_name        = "mypublickey"
  },
  "app2" = {
    name            = "public-app2"
    ami             = ["ami-prod-app2"]
    instance_type   = "t3.medium"
    security_groups = ["sg-prod-app2", "sg-additional3", "sg-additional4"]
    key_name        = "mypublickey"
  }
}

efs_performance_mode = "generalPurpose"
efs_encrypted        = true
efs_mount_points     = ["/mnt/efs1", "/mnt/efs2"]
efs_security_groups  = ["sg-efs-prod"]

rds_security_groups   = ["sg-rds-prod"]
rds_engine_version    = "8.0"
rds_instance_class    = "db.t3.medium"
rds_allocated_storage = 100
rds_username          = "admin"
rds_password          = "prodpassword123"
rds_db_name           = "proddatabase"
rds_multi_az          = true
create_rds            = true

create_snapshots        = true
snapshot_retention_days = 7
backup_vault_name       = "prod-vault"
backup_role_arn         = "arn:aws:iam::123456789012:role/AWSBackupDefaultServiceRole"

route53_zone_id = "Z0123456789PRODZONE"

resource "google_container_aws_cluster" "container_aws_clusters" {
  for_each = var.container_aws_clusters

  aws_region      = each.value.aws_region
  location        = each.value.location
  name            = each.value.name
  annotations     = each.value.annotations
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  project         = each.value.project

  authorization {
    dynamic "admin_groups" {
      for_each = each.value.authorization.admin_groups != null ? each.value.authorization.admin_groups : []
      content {
        group = admin_groups.value.group
      }
    }
    dynamic "admin_users" {
      for_each = each.value.authorization.admin_users
      content {
        username = admin_users.value.username
      }
    }
  }

  control_plane {
    aws_services_authentication {
      role_arn          = each.value.control_plane.aws_services_authentication.role_arn
      role_session_name = each.value.control_plane.aws_services_authentication.role_session_name
    }
    config_encryption {
      kms_key_arn = each.value.control_plane.config_encryption.kms_key_arn
    }
    database_encryption {
      kms_key_arn = each.value.control_plane.database_encryption.kms_key_arn
    }
    iam_instance_profile = each.value.control_plane.iam_instance_profile
    instance_type        = each.value.control_plane.instance_type
    dynamic "main_volume" {
      for_each = each.value.control_plane.main_volume != null ? [each.value.control_plane.main_volume] : []
      content {
        iops        = main_volume.value.iops
        kms_key_arn = main_volume.value.kms_key_arn
        size_gib    = main_volume.value.size_gib
        throughput  = main_volume.value.throughput
        volume_type = main_volume.value.volume_type
      }
    }
    dynamic "proxy_config" {
      for_each = each.value.control_plane.proxy_config != null ? [each.value.control_plane.proxy_config] : []
      content {
        secret_arn     = proxy_config.value.secret_arn
        secret_version = proxy_config.value.secret_version
      }
    }
    dynamic "root_volume" {
      for_each = each.value.control_plane.root_volume != null ? [each.value.control_plane.root_volume] : []
      content {
        iops        = root_volume.value.iops
        kms_key_arn = root_volume.value.kms_key_arn
        size_gib    = root_volume.value.size_gib
        throughput  = root_volume.value.throughput
        volume_type = root_volume.value.volume_type
      }
    }
    security_group_ids = each.value.control_plane.security_group_ids
    dynamic "ssh_config" {
      for_each = each.value.control_plane.ssh_config != null ? [each.value.control_plane.ssh_config] : []
      content {
        ec2_key_pair = ssh_config.value.ec2_key_pair
      }
    }
    subnet_ids = each.value.control_plane.subnet_ids
    tags       = each.value.control_plane.tags
    version    = each.value.control_plane.version
  }

  fleet {
    project = each.value.fleet.project
  }

  networking {
    per_node_pool_sg_rules_disabled = each.value.networking.per_node_pool_sg_rules_disabled
    pod_address_cidr_blocks         = each.value.networking.pod_address_cidr_blocks
    service_address_cidr_blocks     = each.value.networking.service_address_cidr_blocks
    vpc_id                          = each.value.networking.vpc_id
  }

  dynamic "binary_authorization" {
    for_each = each.value.binary_authorization != null ? [each.value.binary_authorization] : []
    content {
      evaluation_mode = binary_authorization.value.evaluation_mode
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


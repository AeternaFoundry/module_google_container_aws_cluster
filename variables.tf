variable "container_aws_clusters" {
  description = <<EOT
Map of container_aws_clusters, attributes below
Required:
    - aws_region
    - location
    - name
    - authorization (block):
        - admin_groups (optional, block):
            - group (required)
        - admin_users (required, block):
            - username (required)
    - control_plane (block):
        - aws_services_authentication (required, block):
            - role_arn (required)
            - role_session_name (optional)
        - config_encryption (required, block):
            - kms_key_arn (required)
        - database_encryption (required, block):
            - kms_key_arn (required)
        - iam_instance_profile (required)
        - instance_type (optional)
        - main_volume (optional, block):
            - iops (optional)
            - kms_key_arn (optional)
            - size_gib (optional)
            - throughput (optional)
            - volume_type (optional)
        - proxy_config (optional, block):
            - secret_arn (required)
            - secret_version (required)
        - root_volume (optional, block):
            - iops (optional)
            - kms_key_arn (optional)
            - size_gib (optional)
            - throughput (optional)
            - volume_type (optional)
        - security_group_ids (optional)
        - ssh_config (optional, block):
            - ec2_key_pair (required)
        - subnet_ids (required)
        - tags (optional)
        - version (required)
    - fleet (block):
        - project (optional)
    - networking (block):
        - per_node_pool_sg_rules_disabled (optional)
        - pod_address_cidr_blocks (required)
        - service_address_cidr_blocks (required)
        - vpc_id (required)
Optional:
    - annotations
    - deletion_policy
    - description
    - project
    - binary_authorization (block):
        - evaluation_mode (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    aws_region      = string
    location        = string
    name            = string
    annotations     = optional(map(string))
    deletion_policy = optional(string)
    description     = optional(string)
    project         = optional(string)
    authorization = object({
      admin_groups = optional(list(object({
        group = string
      })))
      admin_users = list(object({
        username = string
      }))
    })
    control_plane = object({
      aws_services_authentication = object({
        role_arn          = string
        role_session_name = optional(string)
      })
      config_encryption = object({
        kms_key_arn = string
      })
      database_encryption = object({
        kms_key_arn = string
      })
      iam_instance_profile = string
      instance_type        = optional(string)
      main_volume = optional(object({
        iops        = optional(number)
        kms_key_arn = optional(string)
        size_gib    = optional(number)
        throughput  = optional(number)
        volume_type = optional(string)
      }))
      proxy_config = optional(object({
        secret_arn     = string
        secret_version = string
      }))
      root_volume = optional(object({
        iops        = optional(number)
        kms_key_arn = optional(string)
        size_gib    = optional(number)
        throughput  = optional(number)
        volume_type = optional(string)
      }))
      security_group_ids = optional(list(string))
      ssh_config = optional(object({
        ec2_key_pair = string
      }))
      subnet_ids = list(string)
      tags       = optional(map(string))
      version    = string
    })
    fleet = object({
      project = optional(string)
    })
    networking = object({
      per_node_pool_sg_rules_disabled = optional(bool)
      pod_address_cidr_blocks         = list(string)
      service_address_cidr_blocks     = list(string)
      vpc_id                          = string
    })
    binary_authorization = optional(object({
      evaluation_mode = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_aws_clusters : (
        length(v.authorization.admin_users) >= 1
      )
    ])
    error_message = "Each admin_users list must contain at least 1 items"
  }
}


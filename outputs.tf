output "container_aws_clusters_id" {
  description = "Map of id values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no id are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "container_aws_clusters_annotations" {
  description = "Map of annotations values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no annotations are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.annotations if v.annotations != null && length(v.annotations) > 0 }
}
output "container_aws_clusters_authorization" {
  description = "Map of authorization values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no authorization are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => one(v.authorization) if v.authorization != null && length(v.authorization) > 0 }
}
output "container_aws_clusters_aws_region" {
  description = "Map of aws_region values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no aws_region are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.aws_region if v.aws_region != null && length(v.aws_region) > 0 }
}
output "container_aws_clusters_binary_authorization" {
  description = "Map of binary_authorization values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no binary_authorization are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => one(v.binary_authorization) if v.binary_authorization != null && length(v.binary_authorization) > 0 }
}
output "container_aws_clusters_control_plane" {
  description = "Map of control_plane values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no control_plane are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => one(v.control_plane) if v.control_plane != null && length(v.control_plane) > 0 }
}
output "container_aws_clusters_create_time" {
  description = "Map of create_time values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no create_time are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "container_aws_clusters_deletion_policy" {
  description = "Map of deletion_policy values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no deletion_policy are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "container_aws_clusters_description" {
  description = "Map of description values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no description are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.description if v.description != null && length(v.description) > 0 }
}
output "container_aws_clusters_effective_annotations" {
  description = "Map of effective_annotations values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no effective_annotations are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.effective_annotations if v.effective_annotations != null && length(v.effective_annotations) > 0 }
}
output "container_aws_clusters_endpoint" {
  description = "Map of endpoint values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no endpoint are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.endpoint if v.endpoint != null && length(v.endpoint) > 0 }
}
output "container_aws_clusters_etag" {
  description = "Map of etag values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no etag are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "container_aws_clusters_fleet" {
  description = "Map of fleet values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no fleet are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => one(v.fleet) if v.fleet != null && length(v.fleet) > 0 }
}
output "container_aws_clusters_location" {
  description = "Map of location values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no location are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.location if v.location != null && length(v.location) > 0 }
}
output "container_aws_clusters_name" {
  description = "Map of name values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no name are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "container_aws_clusters_networking" {
  description = "Map of networking values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no networking are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => one(v.networking) if v.networking != null && length(v.networking) > 0 }
}
output "container_aws_clusters_project" {
  description = "Map of project values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no project are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.project if v.project != null && length(v.project) > 0 }
}
output "container_aws_clusters_reconciling" {
  description = "Map of reconciling values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no reconciling are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.reconciling if v.reconciling != null }
}
output "container_aws_clusters_state" {
  description = "Map of state values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no state are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.state if v.state != null && length(v.state) > 0 }
}
output "container_aws_clusters_uid" {
  description = "Map of uid values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no uid are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.uid if v.uid != null && length(v.uid) > 0 }
}
output "container_aws_clusters_update_time" {
  description = "Map of update_time values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no update_time are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}
output "container_aws_clusters_workload_identity_config" {
  description = "Map of workload_identity_config values across all container_aws_clusters, keyed the same as var.container_aws_clusters except keys with no workload_identity_config are omitted"
  value       = { for k, v in google_container_aws_cluster.container_aws_clusters : k => v.workload_identity_config if v.workload_identity_config != null && length(v.workload_identity_config) > 0 }
}


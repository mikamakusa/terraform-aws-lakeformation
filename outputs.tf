output "resource_id" {
  value = try(aws_lakeformation_resource.this.*.id)
}

output "resource_arn" {
  value = try(aws_lakeformation_resource.this.*.arn)
}

output "data_cells_filter_id" {
  value = try(aws_lakeformation_data_cells_filter.this.*.id)
}

output "lf_tag_id" {
  value = try(aws_lakeformation_resource_lf_tag.this.*.id)
}

output "data_lake_settings_id" {
  value = try(aws_lakeformation_data_lake_settings.this.*.id)
}

output "data_lake_settings_admins" {
  value = try(aws_lakeformation_data_lake_settings.this.*.admins)
}
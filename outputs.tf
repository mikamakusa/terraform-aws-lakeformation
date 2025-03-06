output "resource_id" {
  value = try(aws_lakeformation_resource.this.*.id)
}

output "resource_arn" {
  value = try(aws_lakeformation_resource.this.*.arn)
}
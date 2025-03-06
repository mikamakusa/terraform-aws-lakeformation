resource "aws_lakeformation_resource" "this" {
  count = length(var.resource)
  arn = try(var.s3_bucket_name ? data.aws_s3_bucket.this.arn : element(module.s3.*.s3_bucket_arn, lookup(var.resource[count.index], "bucket_id")))
  role_arn = try(var.iam_role_name ? data.aws_iam_role.this.arn : element(module.iam.*.role_arn, lookup(var.resource[count.index], "iam_role_id")))
  use_service_linked_role = lookup(var.resource[count.index], "use_service_linked_role")
  hybrid_access_enabled = lookup(var.resource[count.index], "hybrid_access_enabled")
}
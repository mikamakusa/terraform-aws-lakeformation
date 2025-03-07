resource "aws_lakeformation_resource" "this" {
  count = length(var.resource)
  arn = try(var.s3_bucket_name ? data.aws_s3_bucket.this.arn : element(module.s3.*.s3_bucket_arn, lookup(var.resource[count.index], "bucket_id")))
  role_arn = try(var.iam_role_name ? data.aws_iam_role.this.arn : element(module.iam.*.role_arn, lookup(var.resource[count.index], "iam_role_id")))
  use_service_linked_role = lookup(var.resource[count.index], "use_service_linked_role")
  hybrid_access_enabled = lookup(var.resource[count.index], "hybrid_access_enabled")
}

resource "aws_lakeformation_resource_lf_tag" "this" {
  count = length(var.resource_lf_tag)
  catalog_id = ""

  dynamic "lf_tag" {
    for_each = lookup(var.resource_lf_tag[count.index], "lf_tag")
    content {
      key = lookup(lf_tag.value, "key")
      value = lookup(lf_tag.value, "value")
      catalog_id = ""
    }
  }

  dynamic "database" {
    for_each = try(lookup(var.resource_lf_tag[count.index], "database") == null ? [] : ["database"])
    content {
      name = try(element(module.glue.*.catalog_database_name, lookup(database.value, "database_id")))
      catalog_id = lookup(database.value, "catalog_id")
    }
  }

  dynamic "table" {
    for_each = try(lookup(var.resource_lf_tag[count.index], "table") == null ? [] : ["table"])
    content {
      database_name = try(element(module.glue.*.catalog_database_name, lookup(table.value, "database_id")))
      name = lookup(table.value, "name")
      wildcard = lookup(table.value, "wildcard")
      catalog_id = lookup(table.value, "catalog_id")
    }
  }

  dynamic "table_with_columns" {
    for_each = try(lookup(var.resource_lf_tag[count.index], "table_with_columns") == null ? [] : ["table_with_columns"])
    content {
      database_name = try(element(module.glue.*.catalog_database_name, lookup(table_with_columns.value, "database_id")))
      name          = lookup(table_with_columns.value, "name")
      column_names = lookup(table_with_columns.value, "column_names")
      catalog_id = lookup(table_with_columns.value, "catalog_id")

      dynamic "column_wildcard" {
        for_each = try(lookup(table_with_columns.value, "column_wildcard") == null ? [] : ["column_wildcard"])
        content {
          excluded_column_names = lookup(column_wildcard.value, "excluded_column_names")
        }
      }
    }
  }
}
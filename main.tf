resource "aws_lakeformation_data_cells_filter" "this" {
  count = length(var.data_cells_filter)
  dynamic "table_data" {
    for_each = lookup(var.data_cells_filter[count.index], "table_data")
    content {
      database_name    = try(element(module.glue.*.catalog_database_name, lookup(table_data.value, "database_id")))
      name             = lookup(table_data.value, "name")
      table_catalog_id = data.aws_caller_identity.this.account_id
      table_name       = try(element(module.glue.*.catalog_table_name, lookup(table_data.value, "table_id")))
      column_names = lookup(table_data.value, "column_names")
      version_id = lookup(table_data.value, "version_id")

      dynamic "column_wildcard" {
        for_each = try(lookup(table_data.value, "column_wildcard") == null ? [] : ["column_wildcard"])
        content {
          excluded_column_names = lookup(column_wildcard.value, "excluded_column_names")
        }
      }

      dynamic "row_filter" {
        for_each = try(lookup(table_data.value, "row_filter") == null ? [] : ["row_filter"])
        content {
          filter_expression = lookup(row_filter.value, "filter_expression")
        }
      }
    }
  }
}

resource "aws_lakeformation_data_lake_settings" "this" {
  count = length(var.data_lake_settings)
  admins = lookup(var.data_lake_settings[count.index], "admins")
  allow_external_data_filtering = lookup(var.data_lake_settings[count.index], "allow_external_data_filtering")
  allow_full_table_external_data_access = lookup(var.data_lake_settings[count.index], "allow_full_table_external_data_access")
  authorized_session_tag_value_list = lookup(var.data_lake_settings[count.index], "authorized_session_tag_value_list")
  catalog_id = lookup(var.data_lake_settings[count.index], "catalog_id")
  external_data_filtering_allow_list = lookup(var.data_lake_settings[count.index], "external_data_filtering_allow_list")
  trusted_resource_owners = lookup(var.data_lake_settings[count.index], "trusted_resource_owners")
  parameters = lookup(var.data_lake_settings[count.index], "parameters")
  read_only_admins = lookup(var.data_lake_settings[count.index], "read_only_admins")

  dynamic "create_database_default_permissions" {
    for_each = try(lookup(var.data_lake_settings[count.index], "create_database_default_permissions") == null ? [] : ["create_database_default_permissions"])
    iterator = database
    content {
      permissions = lookup(database.value, "permissions")
      principal = lookup(database.value, "principal")
    }
  }

  dynamic "create_table_default_permissions" {
    for_each = try(lookup(var.data_lake_settings[count.index], "create_table_default_permissions") == null ? [] : ["create_table_default_permissions"])
    iterator = table
    content {
      permissions = lookup(table.value, "permissions")
      principal = lookup(table.value, "principal")
    }
  }
}

resource "aws_lakeformation_resource" "this" {
  count = length(var.resource)
  arn = try(var.s3_bucket_name ? data.aws_s3_bucket.this.arn : element(module.s3.*.s3_bucket_arn, lookup(var.resource[count.index], "bucket_id")))
  role_arn = try(var.iam_role_name ? data.aws_iam_role.this.arn : element(module.iam.*.role_arn, lookup(var.resource[count.index], "iam_role_id")))
  use_service_linked_role = lookup(var.resource[count.index], "use_service_linked_role")
  hybrid_access_enabled = lookup(var.resource[count.index], "hybrid_access_enabled")
}

resource "aws_lakeformation_resource_lf_tag" "this" {
  count = length(var.resource_lf_tag)
  catalog_id = lookup(var.resource_lf_tag[count.index], "catalog_id")

  dynamic "lf_tag" {
    for_each = lookup(var.resource_lf_tag[count.index], "lf_tag")
    content {
      key = lookup(lf_tag.value, "key")
      value = lookup(lf_tag.value, "value")
      catalog_id = lookup(lf_tag.value, "catalog_id")
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
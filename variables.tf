variable "data_cells_filter" {
  type = list(object({
    id = any
    table_data = list(object({
      database_id    = any
      name             = string
      table_id       = any
      column_names = optional(list(string))
      version_id = optional(string)
      column_wildcard = optional(list(object({
        excluded_column_names = optional(list(string))
      })), [])
      row_filter = optional(list(object({
        filter_expression = optional(string)
      })), [])
    }))
  }))
  default = []
  description = <<EOT
Terraform resource for managing an AWS Lake Formation Data Cells Filter.
EOT
}

variable "data_lake_settings" {
  type = list(object({
    id = number
    admins = optional(list(string))
    allow_external_data_filtering = optional(bool)
    allow_full_table_external_data_access = optional(bool)
    authorized_session_tag_value_list = optional(list(string))
    catalog_id = optional(string)
    external_data_filtering_allow_list = optional(list(string))
    trusted_resource_owners = optional(list(string))
    parameters = optional(map(string))
    read_only_admins = optional(list(string))
    create_database_default_permissions = optional(list(object({
      permissions = optional(list(string))
      principal = optional(string)
    })), [])
    create_table_default_permissions = optional(list(object({
      permissions = optional(list(string))
      principal = optional(string)
    })), [])
  }))
  default = []
  description = <<EOT
Manages Lake Formation principals designated as data lake administrators and lists of principal permission entries for default create database and default create table permissions.
EOT

  validation {
    condition = length([for a in var.data_lake_settings: true if contains(["ALL", "SELECT", "ALTER", "DROP", "DELETE", "INSERT", "DESCRIBE", "CREATE_TABLE"], a.create_database_default_permissions.permissions)]) == length(var.data_lake_settings)
    error_message = "Valid values are : ALL, SELECT, ALTER, DROP, DELETE, INSERT, DESCRIBE, and CREATE_TABLE."
  }

  validation {
    condition = length([for b in var.data_lake_settings: true if contains(["ALL", "SELECT", "ALTER", "DROP", "DELETE", "INSERT", "DESCRIBE", "CREATE_TABLE"], b.create_table_default_permissions.permissions)]) == length(var.data_lake_settings)
    error_message = "Valid values are : ALL, SELECT, ALTER, DROP, DELETE, INSERT, DESCRIBE, and CREATE_TABLE."
  }
}

variable "resource" {
  type = list(object({
    id = any
    bucket_id = any
    iam_role_id = optional(any)
    use_service_linked_role = optional(bool)
    hybrid_access_enabled = optional(bool)
  }))
  default = []
  description = <<EOT
Registers a Lake Formation resource (e.g., S3 bucket) as managed by the Data Catalog. In other words, the S3 path is added to the data lake.
EOT
}

variable "resource_lf_tag" {
  type = list(object({
    id = any
    catalog_id = optional(any)
    lf_tag = list(object({
      key = string
      value = string
      catalog_id = optional(any)
    }))
    database = optional(list(object({
      database_id = optional(any)
      catalog_id = optional(any)
    })), [])
    table = optional(list(object({
      database_id = optional(any)
      name = optional(string)
      wildcard = optional(bool)
      catalog_id = optional(string)
    })), [])
    table_with_columns = optional(list(object({
      database_id = optional(any)
      name          = optional(any)
      column_names = optional(any)
      catalog_id = optional(any)
      column_wildcard = optional(list(object({
        excluded_column_names = optional(list(string))
      })))
    })), [])
  }))
  default = []
  description = <<EOT
Terraform resource for managing an AWS Lake Formation Resource LF Tag.
EOT
}

variable "s3_bucket_name" {
  type = string
  default = null
}

variable "bucket" {
  type = any
  default = []
}

variable "role" {
  type = any
  default = []
}

variable "catalog_database" {
  type = any
  default = []
}

variable "catalog_table" {
  type = any
  default = []
}

variable "iam_role_name" {
  type = string
  default = null
}
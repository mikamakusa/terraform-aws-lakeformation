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
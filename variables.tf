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

variable "iam_role_name" {
  type = string
  default = null
}
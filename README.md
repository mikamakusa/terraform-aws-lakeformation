## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_glue"></a> [glue](#module\_glue) | modules/terraform-aws-glue | n/a |
| <a name="module_iam"></a> [iam](#module\_iam) | modules/terraform-aws-iam | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | modules/terraform-aws-s3 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_lakeformation_resource.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lakeformation_resource) | resource |
| [aws_lakeformation_resource_lf_tag.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lakeformation_resource_lf_tag) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_role) | data source |
| [aws_iam_session_context.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_session_context) | data source |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | n/a | `any` | `[]` | no |
| <a name="input_catalog_database"></a> [catalog\_database](#input\_catalog\_database) | n/a | `any` | `[]` | no |
| <a name="input_catalog_table"></a> [catalog\_table](#input\_catalog\_table) | n/a | `any` | `[]` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | n/a | `string` | `null` | no |
| <a name="input_resource"></a> [resource](#input\_resource) | Registers a Lake Formation resource (e.g., S3 bucket) as managed by the Data Catalog. In other words, the S3 path is added to the data lake. | <pre>list(object({<br/>    id = any<br/>    bucket_id = any<br/>    iam_role_id = optional(any)<br/>    use_service_linked_role = optional(bool)<br/>    hybrid_access_enabled = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_lf_tag"></a> [resource\_lf\_tag](#input\_resource\_lf\_tag) | Terraform resource for managing an AWS Lake Formation Resource LF Tag. | <pre>list(object({<br/>    id = any<br/>    catalog_id = optional(any)<br/>    lf_tag = list(object({<br/>      key = string<br/>      value = string<br/>      catalog_id = optional(any)<br/>    }))<br/>    database = optional(list(object({<br/>      database_id = optional(any)<br/>      catalog_id = optional(any)<br/>    })), [])<br/>    table = optional(list(object({<br/>      database_id = optional(any)<br/>      name = optional(string)<br/>      wildcard = optional(bool)<br/>      catalog_id = optional(string)<br/>    })), [])<br/>    table_with_columns = optional(list(object({<br/>      database_id = optional(any)<br/>      name          = optional(any)<br/>      column_names = optional(any)<br/>      catalog_id = optional(any)<br/>      column_wildcard = optional(list(object({<br/>        excluded_column_names = optional(list(string))<br/>      })))<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_role"></a> [role](#input\_role) | n/a | `any` | `[]` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_arn"></a> [resource\_arn](#output\_resource\_arn) | n/a |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | n/a |

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
| [aws_lakeformation_data_cells_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lakeformation_data_cells_filter) | resource |
| [aws_lakeformation_data_lake_settings.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lakeformation_data_lake_settings) | resource |
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
| <a name="input_data_cells_filter"></a> [data\_cells\_filter](#input\_data\_cells\_filter) | Terraform resource for managing an AWS Lake Formation Data Cells Filter. | <pre>list(object({<br/>    id = any<br/>    table_data = list(object({<br/>      database_id    = any<br/>      name             = string<br/>      table_id       = any<br/>      column_names = optional(list(string))<br/>      version_id = optional(string)<br/>      column_wildcard = optional(list(object({<br/>        excluded_column_names = optional(list(string))<br/>      })), [])<br/>      row_filter = optional(list(object({<br/>        filter_expression = optional(string)<br/>      })), [])<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_data_lake_settings"></a> [data\_lake\_settings](#input\_data\_lake\_settings) | Manages Lake Formation principals designated as data lake administrators and lists of principal permission entries for default create database and default create table permissions. | <pre>list(object({<br/>    id = number<br/>    admins = optional(list(string))<br/>    allow_external_data_filtering = optional(bool)<br/>    allow_full_table_external_data_access = optional(bool)<br/>    authorized_session_tag_value_list = optional(list(string))<br/>    catalog_id = optional(string)<br/>    external_data_filtering_allow_list = optional(list(string))<br/>    trusted_resource_owners = optional(list(string))<br/>    parameters = optional(map(string))<br/>    read_only_admins = optional(list(string))<br/>    create_database_default_permissions = optional(list(object({<br/>      permissions = optional(list(string))<br/>      principal = optional(string)<br/>    })), [])<br/>    create_table_default_permissions = optional(list(object({<br/>      permissions = optional(list(string))<br/>      principal = optional(string)<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | n/a | `string` | `null` | no |
| <a name="input_resource"></a> [resource](#input\_resource) | Registers a Lake Formation resource (e.g., S3 bucket) as managed by the Data Catalog. In other words, the S3 path is added to the data lake. | <pre>list(object({<br/>    id = any<br/>    bucket_id = any<br/>    iam_role_id = optional(any)<br/>    use_service_linked_role = optional(bool)<br/>    hybrid_access_enabled = optional(bool)<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_lf_tag"></a> [resource\_lf\_tag](#input\_resource\_lf\_tag) | Terraform resource for managing an AWS Lake Formation Resource LF Tag. | <pre>list(object({<br/>    id = any<br/>    catalog_id = optional(any)<br/>    lf_tag = list(object({<br/>      key = string<br/>      value = string<br/>      catalog_id = optional(any)<br/>    }))<br/>    database = optional(list(object({<br/>      database_id = optional(any)<br/>      catalog_id = optional(any)<br/>    })), [])<br/>    table = optional(list(object({<br/>      database_id = optional(any)<br/>      name = optional(string)<br/>      wildcard = optional(bool)<br/>      catalog_id = optional(string)<br/>    })), [])<br/>    table_with_columns = optional(list(object({<br/>      database_id = optional(any)<br/>      name          = optional(any)<br/>      column_names = optional(any)<br/>      catalog_id = optional(any)<br/>      column_wildcard = optional(list(object({<br/>        excluded_column_names = optional(list(string))<br/>      })))<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_role"></a> [role](#input\_role) | n/a | `any` | `[]` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_cells_filter_id"></a> [data\_cells\_filter\_id](#output\_data\_cells\_filter\_id) | n/a |
| <a name="output_data_lake_settings_admins"></a> [data\_lake\_settings\_admins](#output\_data\_lake\_settings\_admins) | n/a |
| <a name="output_data_lake_settings_id"></a> [data\_lake\_settings\_id](#output\_data\_lake\_settings\_id) | n/a |
| <a name="output_lf_tag_id"></a> [lf\_tag\_id](#output\_lf\_tag\_id) | n/a |
| <a name="output_resource_arn"></a> [resource\_arn](#output\_resource\_arn) | n/a |
| <a name="output_resource_id"></a> [resource\_id](#output\_resource\_id) | n/a |

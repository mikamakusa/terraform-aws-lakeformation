module "s3" {
  source = "modules/terraform-aws-s3"
  bucket = var.bucket
}

module "iam" {
  source = "modules/terraform-aws-iam"
  role = var.role
}

module "glue" {
  source = "modules/terraform-aws-glue"
  catalog_database = var.catalog_database
  catalog_table = var.catalog_table
}
module "s3" {
  source = "modules/terraform-aws-s3"
  bucket = var.bucket
}

module "iam" {
  source = "modules/terraform-aws-iam"
  role = var.role
}
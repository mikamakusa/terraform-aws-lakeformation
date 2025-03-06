data "aws_caller_identity" "this" {}

data "aws_iam_session_context" "this" {
  arn = data.aws_caller_identity.this.arn
}

data "aws_s3_bucket" "this" {
  bucket = var.s3_bucket_name
}

data "aws_iam_role" "this" {
  name = var.iam_role_name
}
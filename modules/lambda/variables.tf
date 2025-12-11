variable "service_name" {}
variable "environment" {}
variable "lambda_role_arn" {}
variable "lambda_source_dir" {}
variable "lambda_zip_path" {}
variable "lambda_env_vars" { type = map(string) }
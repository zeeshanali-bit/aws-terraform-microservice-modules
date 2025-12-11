variable "service_name" {}
variable "environment" {}
variable "lambda_invoke_arn" {}
variable "authorizer_arn" { default = "" }
variable "authorizer_id" { default = "" }
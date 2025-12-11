data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = var.lambda_zip_path
}

resource "aws_lambda_function" "service_lambda" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = "$$ {var.service_name}- $${var.environment}"
  role          = var.lambda_role_arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = var.lambda_env_vars
  }
  tags = {
    Environment = var.environment
  }
}
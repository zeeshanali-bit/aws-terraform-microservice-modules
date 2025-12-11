output "lambda_arn" {
  value = aws_lambda_function.service_lambda.arn
}

output "lambda_name" {
  value = aws_lambda_function.service_lambda.function_name
}
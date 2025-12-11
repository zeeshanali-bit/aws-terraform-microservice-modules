resource "aws_api_gateway_rest_api" "service_api" {
  name = "$$ {var.service_name}-api- $${var.environment}"
}

resource "aws_api_gateway_resource" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.service_api.id
  parent_id   = aws_api_gateway_rest_api.service_api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "proxy" {
  rest_api_id   = aws_api_gateway_rest_api.service_api.id
  resource_id   = aws_api_gateway_resource.proxy.id
  http_method   = "ANY"
  authorization = var.authorizer_arn == "" ? "NONE" : "CUSTOM"
  authorizer_id = var.authorizer_arn == "" ? null : var.authorizer_id
}

resource "aws_api_gateway_integration" "proxy" {
  rest_api_id = aws_api_gateway_rest_api.service_api.id
  resource_id = aws_api_gateway_resource.proxy.id
  http_method = aws_api_gateway_method.proxy.http_method
  type        = "AWS_PROXY"
  uri         = var.lambda_invoke_arn
  integration_http_method = "POST"
}

resource "aws_api_gateway_deployment" "dev" {
  depends_on = [aws_api_gateway_integration.proxy]
  rest_api_id = aws_api_gateway_rest_api.service_api.id
  stage_name  = var.environment
}
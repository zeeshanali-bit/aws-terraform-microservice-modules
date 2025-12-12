resource "aws_sns_topic" "service_topic" {
  name = "$$ {var.service_name}- $${var.environment}-topic"
  tags = {
    Environment = var.environment
  }
}
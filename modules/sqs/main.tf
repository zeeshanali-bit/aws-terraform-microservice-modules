resource "aws_sqs_queue" "service_queue" {
  name = "$$ {var.service_name}- $${var.environment}-queue"
  delay_seconds = 0
  message_retention_seconds = 86400  # 1 day – customize in vars
  receive_wait_time_seconds = 10
  tags = {
    Environment = var.environment
  }
}
output "queue_arn" {
  value = aws_sqs_queue.service_queue.arn
}

output "queue_url" {
  value = aws_sqs_queue.service_queue.url
}
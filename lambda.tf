resource "aws_lambda_function" "lambda_binance_trades" {
  function_name = var.lambda_function_name
  filename      = "${path.module}/code.zip"
  role          = aws_iam_role.role_binance_trades_bot.arn
  handler       = "handler.handler"
  runtime       = "python3.10"
  timeout       = 30

  depends_on = [
    aws_iam_role_policy_attachment.lambda_logs,
    aws_cloudwatch_log_group.cwl_binance_trades,
  ]

  environment {
    variables = {
      BINANCE_API_KEY      = var.BINANCE_API_KEY
      BINANCE_SECRET_KEY   = var.BINANCE_SECRET_KEY
      MONGO_CONNECT_STRING = var.MONGO_CONNECT_STRING
    }
  }
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_binance_trades.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_trigger.arn
}

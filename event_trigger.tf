resource "aws_cloudwatch_event_rule" "lambda_trigger" {
  name                = "binance-trade-event"
  schedule_expression = "cron(0/1 * ? * * *)"
}

resource "aws_cloudwatch_event_target" "sns" {
  rule = aws_cloudwatch_event_rule.lambda_trigger.name
  arn  = aws_lambda_function.lambda_function.arn
}

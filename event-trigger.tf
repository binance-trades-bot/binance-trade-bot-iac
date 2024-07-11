# resource "aws_cloudwatch_event_rule" "lambda_trigger" {
#   name                = "binance-trade-event"
#   schedule_expression = "rate(2 hours)"
# }

# resource "aws_cloudwatch_event_target" "lambda" {
#   rule      = aws_cloudwatch_event_rule.lambda_trigger.name
#   target_id = "lambda_function"
#   arn       = aws_lambda_function.lambda_binance_trades.arn
# }

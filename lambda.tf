resource "aws_lambda_function" "lambda_function" {
  function_name = "binance_trades"
  filename      = "${path.module}/code.zip"
  role          = aws_iam_role.role_binance_trades_bot.arn
  handler       = "handler.handler"
  runtime       = "python3.10"

  environment {
    variables = {
      BINANCE_API_KEY      = var.BINANCE_API_KEY
      BINANCE_SECRET_KEY   = var.BINANCE_SECRET_KEY
      MONGO_CONNECT_STRING = var.MONGO_CONNECT_STRING
    }
  }
}

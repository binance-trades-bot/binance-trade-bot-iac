# resource "aws_cloudwatch_log_group" "cwl_binance_trades" {
#   name              = "/aws/lambda/${var.lambda_function_name}"
#   retention_in_days = 1
# }

# data "aws_iam_policy_document" "lambda_logging" {
#   statement {
#     effect = "Allow"

#     actions = [
#       "logs:CreateLogGroup",
#       "logs:CreateLogStream",
#       "logs:PutLogEvents",
#     ]

#     resources = ["arn:aws:logs:*:*:*"]
#   }
# }

# resource "aws_iam_policy" "lambda_logging" {
#   name   = "lambda_logging"
#   path   = "/"
#   policy = data.aws_iam_policy_document.lambda_logging.json
# }

# resource "aws_iam_role_policy_attachment" "lambda_logs" {
#   role       = aws_iam_role.role_binance_trades_bot.name
#   policy_arn = aws_iam_policy.lambda_logging.arn
# }

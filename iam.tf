data "aws_iam_policy_document" "policy_lambda" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role_binance_trades_bot" {
  name               = "role_binance_trades_bot"
  assume_role_policy = data.aws_iam_policy_document.policy_lambda.json
}

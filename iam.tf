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

resource "aws_iam_policy" "policy_kms" {
  name = "binance_trades_access_kms"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:Decrypt",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:kms:*:255310614335:key/*"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_kms" {
  role       = aws_iam_role.role_binance_trades_bot.name
  policy_arn = aws_iam_policy.policy_kms.arn
}

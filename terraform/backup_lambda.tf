resource "aws_iam_role" "lambda_role" {
  name               = "rds-backup-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = { Service = "lambda.amazonaws.com" }
      Effect    = "Allow"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

resource "aws_lambda_function" "snapshot" {
  function_name = "rds-snapshot-creator"
  handler       = "lambda_snapshot.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_role.arn
  filename      = "lambda_snapshot.zip"
}

resource "aws_cloudwatch_event_rule" "daily" {
  name                = "daily-rds-snapshot"
  schedule_expression = "cron(0 1 * * ? *)"
}

resource "aws_cloudwatch_event_target" "invoke" {
  rule      = aws_cloudwatch_event_rule.daily.name
  target_id = "SnapshotLambda"
  arn       = aws_lambda_function.snapshot.arn
}


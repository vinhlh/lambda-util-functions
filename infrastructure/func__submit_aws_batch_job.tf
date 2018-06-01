resource "aws_iam_role_policy" "submit_aws_batch_job" {
  name = "submit_aws_batch_job"
  role = "lambda-util-functions_lambda_function"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "batch:SubmitJob"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_event_rule" "sentry_clean" {
  name                = "sentry-clean"
  schedule_expression = "rate(1 day)"
}

resource "aws_cloudwatch_event_target" "sentry_clean" {
  rule     = "${aws_cloudwatch_event_rule.sentry_clean.name}"
  target_id = "${var.apex_function_names["submit_aws_batch_job"]}"
  arn       = "${var.apex_function_submit_aws_batch_job}"
  input     = "${file("../functions/submit_aws_batch_job/events/sentry.json")}"
}

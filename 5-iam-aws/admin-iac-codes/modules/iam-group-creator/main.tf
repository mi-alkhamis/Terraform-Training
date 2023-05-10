data "aws_iam_policy" "iam_policy" {
  arn = var.iam_policy_arn
}


resource "aws_iam_group" "iam_group" {
  name = var.iam_group_name
}


resource "aws_iam_group_policy_attachment" "name" {
  group      = aws_iam_group.iam_group.name
  policy_arn = data.aws_iam_policy.iam_policy.arn

}

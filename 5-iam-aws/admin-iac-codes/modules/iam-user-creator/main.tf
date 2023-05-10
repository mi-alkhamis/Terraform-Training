resource "aws_iam_user" "iam_user" {
  name = var.iam_user_name
}


resource "aws_iam_user_group_membership" "iam_user_group_membership" {
  user   = aws_iam_user.iam_user.name
  groups = var.iam_user_group

}
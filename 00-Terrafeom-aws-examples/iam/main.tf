# data "aws_iam_access_keys" "iam_access_keys" {
#   user = "test"

# }

resource "aws_iam_user" "iam_user" {
  name = "devope-user2"

}

resource "aws_iam_access_key" "iam_access_key" {
  user = aws_iam_user.iam_user.id

}

output "user_access_key_id" {
  value = aws_iam_access_key.iam_access_key.encrypted_secret

}
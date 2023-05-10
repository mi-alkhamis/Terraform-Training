
module "iam_groups" {
  for_each       = var.iam_group_mapper
  source         = "./modules/iam-group-creator"
  iam_group_name = each.key
  iam_policy_arn = each.value.group_policy_arn
  providers = {
    aws = aws
  }

}


module "iam_users" {
  for_each       = var.iam_user_group_mapper
  source         = "./modules/iam-user-creator"
  iam_user_name  = each.key
  iam_user_group = each.value.groups

}
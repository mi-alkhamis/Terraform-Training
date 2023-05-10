
variable "iam_group_mapper" {
  type = map(any) # map without (type) raise error
  default = {
    "devops-leaders" = {
      "group_policy_arn" = "arn:aws:iam::aws:policy/AdministratorAccess"
    },
    "devops-engineers" = {
      "group_policy_arn" = "arn:aws:iam::aws:policy/AdministratorAccess"

    },
    "devops-interns" = {
      "group_policy_arn" = "arn:aws:iam::aws:policy/AdministratorAccess"

    }
  }
}



variable "iam_user_group_mapper" {
  type = map(any)
  default = {
    "Milad" = {
      "groups" = ["devops-interns"]
    },
    "John" = {
      "groups" = ["Devops-leaders"]
    },
    "Alice" = {
      "groups" = ["devops-engineers"]
    }
  }

}
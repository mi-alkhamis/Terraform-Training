variable "nginx_version" {
  type        = string
  default     = "latest"
  description = "Nginx version"
}

variable "memory_limit" {
  type    = number
  default = 1024

}

variable "deployment_name" {
  type        = string
  default     = "nginx"
  description = "Deployment name"
}

variable "http_port" {
  type    = number
  default = 80

}

variable "https_port" {
  type    = number
  default = 443

}


variable "dns_name" {
  type    = list(string) # List of String
  default = ["localhost"]

}
variable "common_name" {
  type    = string
  default = "localhost"
}

variable "restart_policy" {
  type    = string
  default = "always"

}


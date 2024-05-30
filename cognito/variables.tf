################################################################################
# Cognito
################################################################################
variable "region" {
  description = "environment region"
  type        = string
  default     = "us-east-1"
}

variable "db_config_user_pool" {
  type = map(any)
}

variable "db_config_pool_client" {
  type = map(any)
}

variable "db_config_identity_pools" {
  type = map(any)
}




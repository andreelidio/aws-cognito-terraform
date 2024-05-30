
################################################################################
# Module - Cognito User Pool
################################################################################
resource "aws_cognito_user_pool" "pools" {
  for_each = var.db_config_user_pool

  name                     = each.value.name
  username_attributes      = ["email"]
  auto_verified_attributes = ["email"]
  password_policy {
    minimum_length                   = 8
    require_lowercase                = false
    require_numbers                  = true
    require_symbols                  = true
    require_uppercase                = true
    temporary_password_validity_days = 7
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
    email_subject        = "Account Confirmation"
    email_message        = "Your confirmation code is {####}"
  }

  schema {
    attribute_data_type      = "String"
    developer_only_attribute = false
    mutable                  = true
    name                     = "email"
    required                 = true

    string_attribute_constraints {
      min_length = 1
      max_length = 256
    }
  }
}
################################################################################
# Module - Cognito Pool Client
################################################################################
resource "aws_cognito_user_pool_client" "client" {
  for_each = var.db_config_pool_client

  name         = "${each.value.name}-client"
  user_pool_id = aws_cognito_user_pool.pools[each.key].id
}

# ################################################################################
# # Module - Cognito Identity Pools 
# ################################################################################
resource "aws_cognito_identity_pool" "identity" {
  for_each = var.db_config_identity_pools

  identity_pool_name               = each.value.identity_pool_name
  allow_unauthenticated_identities = false
  allow_classic_flow               = false

  dynamic "cognito_identity_providers" {
    for_each = {
      for key, value in aws_cognito_user_pool_client.client :
      key => value if key == each.key
    }

    content {
      client_id               = replace(cognito_identity_providers.key, "-", "_")
      provider_name           = "cognito-idp.${var.region}.amazonaws.com/${aws_cognito_user_pool.pools[cognito_identity_providers.key].id}"
      server_side_token_check = false
    }
  }
}


region = "us-east-1"

###############################################################################
# Module - Cognito User Pool
###############################################################################
db_config_user_pool = {
   aeos-backoffice-dev = {
      name = "aeos-backoffice-dev",                     
   }

   aeos-developer-portal-dev = {
      name = "aeos-developer-portal-dev",                     
   }

   aeos-plataform-dev = {
      name = "aeos-plataform-dev",     
   } 

   aeos-post-trade-dev = {
      name = "aeos-post-trade-dev",     
   }
}

################################################################################
# Module - Cognito Pool Client
################################################################################
db_config_pool_client = {
   aeos-developer-portal-dev = {
      name = "aeos-developer-portal-dev",                     
   }

   aeos-plataform-dev = {
      name = "aeos-plataform-dev",     
   } 
}

################################################################################
# Module - Identity Pools
################################################################################
db_config_identity_pools = {
  aeos-developer-portal-dev = {
      identity_pool_name = "aeos-developer-portal-dev",
  }  

  aeos-plataform-dev = {
      identity_pool_name = "aeos-plataform-dev",
  }
}
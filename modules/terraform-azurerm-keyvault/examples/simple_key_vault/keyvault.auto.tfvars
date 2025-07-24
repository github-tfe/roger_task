keyvault = {
  keyvault = {
    project_name                  = "kvtest"
    instance_number               = "1"
    env                           = "dev"
    resource_group_name           = "test-rg"
    soft_delete_retention_days    = 7
    purge_protection_enabled      = false
    location                      = "Canada East"
    public_network_access_enabled = false
    network_acls = {
      bypass         = "AzureServices"
      default_action = "Deny"
    }
  }
}
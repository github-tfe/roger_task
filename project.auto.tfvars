//keyvaults = [
//  {
//    env                         = "dev"
//    instance_number             = "01"
//    resource_group_name         = "test-rg"
//    soft_delete_retention_days  = 7
//    purge_protection_enabled    = true
//    location                   = "Canada East"
//    public_network_access_enabled = false
//    network_acls = {
//      bypass         = "AzureServices"
//      default_action = "Deny"
//    }
//  },
//  {
//    env                         = "stg"
//    instance_number             = "02"
//    resource_group_name         = "test-rg"
//    soft_delete_retention_days  = 7
//    purge_protection_enabled    = true
//    location                   = "Canada East"
//    public_network_access_enabled = false
//    network_acls = {
//      bypass         = "None"
//      default_action = "Allow"
//    }
//  }
//]

storage_accounts = [
//  {
//    env                         = "dev"
//    instance_number             = "01"
//    resource_group_name         = "test-rg"
//    location                   = "Canada Central"
//    account_replication_type    = "LRS"
//    public_network_access_enabled = false
//  },
  {
    env                         = "qa"
    instance_number             = "02"
    resource_group_name         = "test-rg"
    location                   = "Canada East"
    account_replication_type    = "RAGRS"
    public_network_access_enabled = true
  }
]
provider "azurerm" {
  features {}
  subscription_id = "4ee5e396-63ee-4ca9-9dd1-50b996131fb1"

}

data "azurerm_client_config" "current" {}


locals {
  keyvaults_map        = { for idx, kv in var.keyvaults : "${kv.env}-${lookup(kv, "instance_number", format("%02d", idx + 1))}" => kv }
  storage_accounts_map = { for idx, sa in var.storage_accounts : "${sa.env}-${lookup(sa, "instance_number", format("%02d", idx + 1))}" => sa }

}


module "keyvault" {
  source                        = "./modules/terraform-azurerm-keyvault"
  for_each                      = local.keyvaults_map
  env                           = each.value.env
  resource_group_name           = each.value.resource_group_name
  soft_delete_retention_days    = lookup(each.value, "soft_delete_retention_days")
  purge_protection_enabled      = lookup(each.value, "purge_protection_enabled")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")
  location                      = lookup(each.value, "location")
}



module "storage_account" {
  source                        = "./modules/terraform-azurerm-storage-account"
  for_each                      = local.storage_accounts_map
  account_replication_type      = lookup(each.value, "account_replication_type")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")
  resource_group_name           = each.value.resource_group_name
  location                      = lookup(each.value, "location")
  containers                    = lookup(each.value, "containers", {})
  gen2fs                        = lookup(each.value, "gen2fs", {})
  shares                        = lookup(each.value, "shares", [])
  tables                        = lookup(each.value, "tables", {})
  disable_keys                  = lookup(each.value, "disable_keys", false)
  bypass                        = lookup(each.value, "bypass", ["None"])
  enable_privatelink            = lookup(each.value, "enable_privatelink", true)
  env                           = lookup(each.value, "env")
  instance_number               = lookup(each.value, "instance_number", "01")

}

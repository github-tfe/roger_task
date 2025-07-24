provider "azurerm" {
  features {}
  subscription_id = "4ee5e396-63ee-4ca9-9dd1-50b996131fb1"

}

data "azurerm_client_config" "current" {}

module "keyvault" {
  source                        = "../../"
  for_each                      = var.keyvault
  env                           = each.value.env
  resource_group_name           = each.value.resource_group_name
  soft_delete_retention_days    = lookup(each.value, "soft_delete_retention_days")
  purge_protection_enabled      = lookup(each.value, "purge_protection_enabled")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")
  location                      = lookup(each.value, "location")
}
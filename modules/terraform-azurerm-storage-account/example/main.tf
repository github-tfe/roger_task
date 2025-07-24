provider "azurerm" {
  features {}
  subscription_id = "4ee5e396-63ee-4ca9-9dd1-50b996131fb1"

}


module "storage_account" {
  source                        = "../"
  for_each                      = var.storage_account
  instance_number               = lookup(each.value, "instance_number")
  account_replication_type      = lookup(each.value, "account_replication_type")
  public_network_access_enabled = lookup(each.value, "public_network_access_enabled")
  resource_group_name           = each.value.resource_group_name
  containers                    = lookup(each.value, "containers", {})
  gen2fs                        = lookup(each.value, "gen2fs", {})
  shares                        = lookup(each.value, "shares", [])
  tables                        = lookup(each.value, "tables", {})
  disable_keys                  = lookup(each.value, "disable_keys", false)
  bypass                        = lookup(each.value, "bypass", ["None"])
  enable_privatelink            = lookup(each.value, "enable_privatelink", true)
  env                           = lookup(each.value, "env")
}

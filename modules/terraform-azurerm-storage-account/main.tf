locals {
  common_tags = {
    env = var.env
  }
  folders_list = { for y, x in var.shares : y => x if lookup(x, "folders", []) != [] }
  folders = local.folders_list != null ? flatten([
  for share_key, share in local.folders_list : [
  for folder_key, folder in share.folders : {
    name       = folder
    share_name = lookup(share, "name")
  }
  ]
  ]) : null
}


resource "azurerm_storage_account" "main" {
  name                     = "parwindersa${var.instance_number}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  is_hns_enabled           = var.gen2fs == {} ? var.is_hns_enabled : true
  public_network_access_enabled = var.public_network_access_enabled
  tags = local.common_tags

  identity {
    type = "SystemAssigned"
  }
  static_website {
    index_document     = var.index_document
    error_404_document = var.error_404_document
  }
}

resource "azurerm_storage_container" "main" {
  for_each              = { for container in var.containers : container.name => container }
  name                  = lower(each.value.name)
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = each.value.container_access_type
  depends_on            = [azurerm_storage_account.main]
}

resource "azurerm_storage_data_lake_gen2_filesystem" "main" {
  for_each           = { for gen in var.gen2fs : gen.name => gen }
  name               = lower(each.value.name)
  storage_account_id = azurerm_storage_account.main.id
  depends_on         = [azurerm_storage_account.main]
}

resource "azurerm_storage_share" "main" {
  for_each             = { for share in var.shares : share.name => share }
  name                 = lower(each.value.name)
  storage_account_name = azurerm_storage_account.main.name
  quota                = lookup(each.value, "quota", 100) # <-- default to 100 GB
  depends_on           = [azurerm_storage_account.main]
}

resource "azurerm_storage_share_directory" "main" {
  for_each             = { for folder in local.folders : folder.name => folder }
  name                 = lower(each.value["name"])
  storage_share_id     = azurerm_storage_share.main[each.value.share_name].id
  depends_on           = [azurerm_storage_account.main, azurerm_storage_share.main]
}

resource "azurerm_storage_table" "main" {
  for_each             = { for table in var.tables : table.name => table }
  name                 = lower(each.value.name)
  storage_account_name = azurerm_storage_account.main.name
  depends_on           = [azurerm_storage_account.main]
}

resource "azurerm_storage_table_entity" "main" {
  for_each             = { for table in var.tables : table.name => table }
  storage_table_id = azurerm_storage_account.main.name

  partition_key = lower(each.value.partition_key)
  row_key       = lower(each.value.row_key)

  entity     = each.value.entity
  depends_on = [azurerm_storage_account.main, azurerm_storage_table.main]
}

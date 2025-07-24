//output "storage_account_name" {
//  value       = azurerm_storage_account.main.name
//  description = "Name of storage account create"
//}
//
//output "storage_account_id" {
//  value       = azurerm_storage_account.main.id
//  description = "ID of storage account create"
//}
//
//output "storage_primary_access_key" {
//  value       = azurerm_storage_account.main.primary_access_key
//  description = "The primary access key for the storage account."
//}
//
//output "primary_blob_endpoint" {
//  value       = azurerm_storage_account.main.primary_blob_endpoint
//  description = "The endpoint URL for blob storage in the primary location."
//}
//
//output "secondary_blob_endpoint" {
//  value       = azurerm_storage_account.main.secondary_blob_endpoint
//  description = "The endpoint URL for blob storage in the secondary location"
//}
//
//output "storage_secondary_access_key" {
//  value       = azurerm_storage_account.main.secondary_access_key
//  description = "The secondary access key for the storage account."
//}
//
//output "storage_primary_connection_string" {
//  value       = azurerm_storage_account.main.primary_connection_string
//  description = "The connection string associated with the primary location."
//}
//
//output "storage_secondary_connection_string" {
//  value       = azurerm_storage_account.main.secondary_connection_string
//  description = "The connection string associated with the secondary location."
//}
//
//output "storage_primary_blob_connection_string" {
//  value       = azurerm_storage_account.main.primary_blob_connection_string
//  description = "The connection string associated with the primary blob location."
//}
//
//output "storage_secondary_blob_connection_string" {
//  value       = azurerm_storage_account.main.secondary_blob_connection_string
//  description = "The connection string associated with the secondary blob location."
//}
//
//output "storage_container_name" {
//  value       = { for k, v in azurerm_storage_container.main : k => v.name }
//  description = "Name of the containers"
//}
//
//output "storage_container_id" {
//  value       = { for k, v in azurerm_storage_container.main : k => v.id }
//  description = "ID of the containers"
//}
//
//output "storage_share_name" {
//  value       = { for k, v in azurerm_storage_share.main : k => v.name }
//  description = "Names of the shares getting created"
//}
//
//output "storage_share_id" {
//  value       = { for k, v in azurerm_storage_share.main : k => v.id }
//  description = "ID of the shares getting created"
//}
//
//output "storage_share_directory" {
//  value       = { for k, v in azurerm_storage_share_directory.main : k => v.name }
//  description = "List of the share directories created"
//}
//
//output "storage_dfs_name" {
//  value       = { for k, v in azurerm_storage_data_lake_gen2_filesystem.main : k => v.name }
//  description = "Name of the datalake shares created"
//}
//
//output "storage_dfs_id" {
//  value       = { for k, v in azurerm_storage_data_lake_gen2_filesystem.main : k => v.id }
//  description = "ID of the datalake shares created"
//}
//
//output "storage_table_id" {
//  value       = { for k, v in azurerm_storage_table.main : k => v.id }
//  description = "The ID of the Table within the Storage Account."
//}
//
//output "storage_table_entity_id" {
//  value       = { for k, v in azurerm_storage_table_entity.main : k => v.id }
//  description = "The ID of the Entity within the Table in the Storage Account."
//}

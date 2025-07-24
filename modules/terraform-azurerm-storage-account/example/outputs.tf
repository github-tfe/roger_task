//output "storage_account_name" {
//  value       = { for k, v in module.storage_account : k => v.storage_account_name }
//  description = "Name of storage account create"
//}
//
//output "storage_account_id" {
//  value       = { for k, v in module.storage_account : k => v.storage_account_id }
//  description = "ID of storage account create"
//}
//
//output "storage_primary_access_key" {
//  value       = { for k, v in module.storage_account : k => v.storage_primary_access_key }
//  description = "The primary access key for the storage account."
//}
//
//output "storage_secondary_access_key" {
//  value       = { for k, v in module.storage_account : k => v.storage_secondary_access_key }
//  description = "The secondary access key for the storage account."
//}
//
//output "storage_primary_connection_string" {
//  value       = { for k, v in module.storage_account : k => v.storage_primary_connection_string }
//  description = "The connection string associated with the primary location."
//}
//
//output "storage_secondary_connection_string" {
//  value       = { for k, v in module.storage_account : k => v.storage_secondary_connection_string }
//  description = "The connection string associated with the secondary location."
//}
//
//output "storage_primary_blob_connection_string" {
//  value       = { for k, v in module.storage_account : k => v.storage_primary_blob_connection_string }
//  description = "The connection string associated with the primary blob location."
//}
//
//output "storage_secondary_blob_connection_string" {
//  value       = { for k, v in module.storage_account : k => v.storage_secondary_blob_connection_string }
//  description = "The connection string associated with the secondary blob location."
//}
//
//output "storage_container_name" {
//  value       = { for k, v in module.storage_account : k => v.storage_container_name }
//  description = "Name of the containers"
//}
//
//output "storage_container_id" {
//  value       = { for k, v in module.storage_account : k => v.storage_container_id }
//  description = "ID of the containers"
//}
//
//output "storage_share_name" {
//  value       = { for k, v in module.storage_account : k => v.storage_share_name }
//  description = "Names of the shares getting created"
//}
//
//output "storage_share_id" {
//  value       = { for k, v in module.storage_account : k => v.storage_share_id }
//  description = "ID of the shares getting created"
//}
//
//output "storage_share_directory" {
//  value       = { for k, v in module.storage_account : k => v.storage_share_directory }
//  description = "List of the share directories created"
//}
//
//output "storage_dfs_name" {
//  value       = { for k, v in module.storage_account : k => v.storage_dfs_name }
//  description = "Name of the datalake shares created"
//}
//
//output "storage_table_id" {
//  value       = { for k, v in module.storage_account : k => v.storage_table_id }
//  description = " The ID of the Table within the Storage Account."
//}
//
//output "storage_table_entity_id" {
//  value       = { for k, v in module.storage_account : k => v.storage_table_entity_id }
//  description = "The ID of the Entity within the Table in the Storage Account."
//}
//
//output "primary_blob_endpoint" {
//  value       = { for k, v in module.storage_account : k => v.primary_blob_endpoint }
//  description = "The endpoint URL for blob storage in the primary location."
//}
output "vault_id" {
  value       = azurerm_key_vault.main.id
  description = "The ID of the Key Vault."
}

output "vault_uri" {
  value       = azurerm_key_vault.main.vault_uri
  description = "The URI of the Key Vault, used for performing operations on keys and secrets."
}

output "vault_name" {
  value       = azurerm_key_vault.main.name
  description = "The Name of the Key Vault."
}

output "vault_certificate_import_id" {
  value       = { for k, v in azurerm_key_vault_certificate.importing : k => v.id }
  description = "The Key Vault Certificate ID."
}

output "vault_certificate_generate_id" {
  value       = { for k, v in azurerm_key_vault_certificate.generating : k => v.id }
  description = "The Key Vault Certificate ID."
}

output "vault_certificate_import_secret_id" {
  value       = { for k, v in azurerm_key_vault_certificate.importing : k => v.secret_id }
  description = "The ID of the associated Key Vault Secret."
}

output "vault_certificate_generate_secret_id" {
  value       = { for k, v in azurerm_key_vault_certificate.generating : k => v.secret_id }
  description = "The ID of the associated Key Vault Secret"
}

output "vault_certificate_import_version" {
  value       = { for k, v in azurerm_key_vault_certificate.importing : k => v.version }
  description = "The current version of the Key Vault Certificate."
}

output "vault_certificate_generate_version" {
  value       = { for k, v in azurerm_key_vault_certificate.generating : k => v.version }
  description = "The current version of the Key Vault Certificate."
}

output "vault_certificate_import_certificate_data" {
  value       = { for k, v in azurerm_key_vault_certificate.importing : k => v.certificate_data }
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
}

output "vault_certificate_generate_certificate_data" {
  value       = { for k, v in azurerm_key_vault_certificate.generating : k => v.certificate_data }
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
}

output "vault_certificate_import_thumbprint" {
  value       = { for k, v in azurerm_key_vault_certificate.importing : k => v.thumbprint }
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
}

output "vault_certificate_generate_thumbprint" {
  value       = { for k, v in azurerm_key_vault_certificate.generating : k => v.thumbprint }
  description = "The raw Key Vault Certificate data represented as a hexadecimal string."
}


locals {
  common_tags = {
    env = var.env
  }
}

data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "main" {
  name                            = "kv-parwinder-${var.env}-${var.instance_number}"
  location                        = var.location
  resource_group_name             = var.resource_group_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  sku_name                        = var.sku_name
  public_network_access_enabled   = var.public_network_access_enabled

  network_acls {
    bypass                     = var.bypass
    default_action             = var.default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
  tags = local.common_tags
}


resource "azurerm_key_vault_access_policy" "terraform_default_policies" {
  count                   = var.create_default_access_policy ? 1 : 0
  key_vault_id            = azurerm_key_vault.main.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = data.azurerm_client_config.current.object_id
  certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers", "Purge"]
  key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "Purge"]
  secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  storage_permissions = [
    "Backup",
    "Delete",
    "DeleteSAS",
    "Get",
    "GetSAS",
    "List",
    "ListSAS",
    "Purge",
    "Recover",
    "RegenerateKey",
    "Restore",
    "Set",
    "SetSAS",
    "Update"
  ]
}

resource "azurerm_key_vault_access_policy" "custom_policies" {
  for_each = var.create_custom_policies ? { for x in var.custom_policy : x.policy_name => x } : {}
  key_vault_id            = azurerm_key_vault.main.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = each.value.object_id
  certificate_permissions = lookup(each.value, "certificate_permissions", null)
  key_permissions         = lookup(each.value, "key_permissions", null)
  secret_permissions      = lookup(each.value, "secret_permissions", null)
  storage_permissions     = lookup(each.value, "storage_permissions", null)
}

resource "azurerm_key_vault_certificate" "importing" {
  for_each = var.create_import_certificates ? { for x in var.import_certificates : x.certificate_name => x } : {}
  name         = lower(format("%s-cert", each.value.certificate_name))
  key_vault_id = azurerm_key_vault.main.id

  certificate {
    contents = each.value.contents
    password = lookup(each.value, "password", null)
  }

  certificate_policy {
    issuer_parameters {
      name = lookup(each.value, "issuer_parameters", "Self")
    }

    key_properties {
      exportable = each.value.exportable
      key_size   = each.value.key_size
      key_type   = each.value.key_type
      reuse_key  = each.value.reuse_key
    }

    secret_properties {
      content_type = each.value.content_type
    }
  }
  depends_on = [azurerm_key_vault_access_policy.terraform_default_policies, azurerm_key_vault_access_policy.custom_policies, azurerm_key_vault.main]
}


resource "azurerm_key_vault_certificate" "generating" {
  for_each = var.create_generate_certificates ? { for x in var.generate_certificates : x.certificate_name => x } : {}
  name         = lower(format("%s-cert", each.value.certificate_name))
  key_vault_id = azurerm_key_vault.main.id

  certificate_policy {
    issuer_parameters {
      name = lookup(each.value, "issuer_parameters", "Self")
    }

    key_properties {
      exportable = each.value.exportable
      key_size   = each.value.key_size
      key_type   = each.value.key_type
      reuse_key  = each.value.reuse_key
    }

    lifetime_action {
      action {
        action_type = each.value.action_type
      }

      trigger {
        days_before_expiry  = try(each.value.lifetime_percentage, null) == null ? each.value.days_before_expiry : null
        lifetime_percentage = try(each.value.days_before_expiry, null) == null ? each.value.days_before_expiry : null
      }
    }

    secret_properties {
      content_type = each.value.content_type
    }

    x509_certificate_properties {
      extended_key_usage = lookup(each.value, "extended_key_usage", null)
      key_usage          = each.value.key_usage
      subject            = each.value.subject
      validity_in_months = each.value.validity_in_months
      subject_alternative_names {
        dns_names = lookup(each.value, "dns_names", null)
        emails    = lookup(each.value, "emails", null)
        upns      = lookup(each.value, "upns", null)
      }


    }
  }
  depends_on = [azurerm_key_vault_access_policy.terraform_default_policies, azurerm_key_vault_access_policy.custom_policies, azurerm_key_vault.main]
}

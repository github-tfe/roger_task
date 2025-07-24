variable "env" {
  description = "Environment tag"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "stg"], var.env)
    error_message = "Environment must be one of: dev, qa, or stg"
  }
}

variable "create_default_access_policy" {
  description = "Whether to create the default access policy"
  type        = bool
  default     = false
}


variable "create_import_certificates" {
  description = "Whether to import certificates"
  type        = bool
  default     = false
}


variable "create_generate_certificates" {
  description = "Whether to generate certificates"
  type        = bool
  default     = false
}


variable "create_custom_policies" {
  description = "Whether to create custom access policies"
  type        = bool
  default     = false
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "Canada East"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "enabled_for_deployment" {
  description = "Allow Azure VMs to retrieve certs as secrets from the Key Vault."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for this Key Vault"
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false."
  type        = bool
  default     = false
}

variable "soft_delete_retention_days" {
  description = "The number of days that items should be retained for once soft-deleted. This value can be between 7 and 90 (the default) days.."
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Is Purge Protection enabled for this Key Vault? Defaults to true."
  type        = bool
  default     = true
}

variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault."
  type        = string
  default     = "standard"
  validation {
    condition = (
      var.sku_name == "standard" || var.sku_name == "premium"
    )
    error_message = "Possible values are standard and premium."
  }
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None."
  type        = string
  default     = "None"
  validation {
    condition = (
      var.bypass == "None" || var.bypass == "AzureServices"
    )
    error_message = "Possible values are AzureServices and None."
  }
}

variable "default_action" {
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids."
  type        = string
  default     = "Deny"
  validation {
    condition = (
      var.default_action == "Allow" || var.default_action == "Deny"
    )
    error_message = "Possible values are Allow and Deny."
  }
}

variable "ip_rules" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
  type        = list
  default     = []
}

variable "virtual_network_subnet_ids" {
  description = "One or more Subnet ID's which should be able to access this Key Vault."
  type        = list
  default     = []
}

variable "name_override" {
  description = "Setting this will override the default keyvault naming convention but will still append -kv to the end of the name"
  type        = string
  default     = null
}

variable "custom_policy" {
  type = list(object({
    policy_name             = string
    object_id               = string
    certificate_permissions = list(string)
    key_permissions         = list(string)
    secret_permissions      = list(string)
    storage_permissions     = list(string)
  }))
  description = "A list containing a map of custom policy rules, all permissions need to be defined even if not being used"
  default     = []
}

variable "import_certificates" {
  description = <<EOVS
This block supports the following list(map(string)) to generate certificates
`certificate_name` - (Required) Specifies the name of the Key Vault Certificate.
`contents` - (Required) The base64-encoded certificate contents
`password` - (Optional) The password associated with the certificate
`issuer_parameters` - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown
`exportable` - (Required) Is this Certificate Exportable?
`key_size` - (Required) The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096
`key_type` - (Required) Specifies the Type of Key, such as RSA
`reuse_key` -  (Required) Is the key reusable? 
`content_type` - (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM
EOVS
  default     = []
  type        = list
}

variable "generate_certificates" {
  description = <<EOVS
This block supports the following list(map(string)) to generate certificates
`certificate_name` - (Required) Specifies the name of the Key Vault Certificate.
`issuer_parameters` - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown
`exportable` - (Required) Is this Certificate Exportable?
`key_size` - (Required) The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096
`key_type` - (Required) Specifies the Type of Key, such as RSA
`reuse_key` - (Required) Is the key reusable?
`action_type` - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts
`days_before_expiry` - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. Conflicts with lifetime_percentage
`lifetime_percentage` - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. Conflicts with days_before_expiry
`content_type` - (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM
`extended_key_usage` - (Optional) A list of Extended/Enhanced Key Usages. 
`key_usage` - (Required) A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive
`subject` - (Required) The Certificate's Subject
`validity_in_months` - (Required) The Certificates Validity Period in Months
`dns_names` - (Optional) A list of alternative DNS names (FQDNs) identified by the Certificate
`emails` - (Optional) A list of email addresses identified by this Certificate. 
`upns` - (Optional) A list of User Principal Names identified by the Certificate
EOVS
  default     = []
  type        = list
}

variable "instance_number" {
  default     = "01"
  description = "instance number of azure keyvault"
}

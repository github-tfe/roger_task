variable "env" {
  description = "Environment tag value"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "stg"], var.env)
    error_message = "The env variable must be one of: dev, qa, stg."
  }
}


variable "instance_number" {
  description = "Number to be added in the name of your Storage Account"
  type        = string
}


variable "location" {
  description = "Azure location"
  type        = string
  default     = "Canada Central"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "account_kind" {
  description = "Defines the Kind of account."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts."
  type        = string
  default     = "Hot"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account"
  type        = string
  default     = "Standard"
}

variable "is_hns_enabled" {
  description = "This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created."
  type        = string
  default     = "true"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "index_document" {
  description = "The webpage that Azure Storage serves for requests to the root of a website or any subfolder."
  type        = string
  default     = null
}

variable "error_404_document" {
  description = "The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file"
  type        = string
  default     = null
}

variable "default_action" {
  description = "Specifies the default action of allow or deny when no other rules match."
  type        = string
  default     = "Deny"
}

variable "ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed."
  default     = []
}

variable "enable_service_endpoint" {
  description = "Enable or disable service endpoint"
  default     = false
}

variable "containers" {
  description = "Map to create a Container within an Azure Storage Account."
  type        = any
  default     = {}
}

variable "gen2fs" {
  description = "Map to create a Data Lake Gen2 File System within an Azure Storage Account."
  type        = any
  default     = {}
}

variable "shares" {
  description = "Map to create a File Share within Azure Storage."
  type = list(object({
    name = string
  }))
  default = []
}

variable "tables" {
  description = "Map to create a Table within an Azure Storage Account."
  type        = any
  default     = {}
}

variable "queues" {
  description = "Map to create a Queue within an Azure Storage Account."
  type        = any
  default     = {}
}

variable "enable_privatelink" {
  description = "Variable to turn on Privatelink for the Module Resources."
  type        = bool
  default     = true
}

variable "vault_enabled" {
  description = "Turns on or off hashicorp vault option to save tokens and keys to vault. Default is enabled, true."
  type        = bool
  default     = true
}


variable "disable_keys" {
  description = "Set this to true if you want to test without customer managaged keys"
  type        = bool
  default     = false
}

variable "name_override" {
  description = "This variable will override the default naming convention when required"
  default     = null
}

variable "vault_override" {
  description = "Changes the vault name tied to the storage account typically only used in testing because of the soft delete problems"
  default     = null
}

variable "bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  default     = ["None"]
}


variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled"
  type        = bool
  default     = false
}
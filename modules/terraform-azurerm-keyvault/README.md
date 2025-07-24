## Requirements
``````
| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| azurerm | >= 2.28.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.28.0 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bypass | Specifies which traffic can bypass the network rules. Possible values are AzureServices and None. | `string` | `"None"` | no |
| custom\_policy | A list containing a map of custom policy rules, all permissions need to be defined even if not being used | <pre>list(object({<br>    policy_name             = string<br>    object_id               = string<br>    certificate_permissions = list(string)<br>    key_permissions         = list(string)<br>    secret_permissions      = list(string)<br>    storage_permissions     = list(string)<br>  }))</pre> | `[]` | no |
| default\_action | The Default Action to use when no rules match from ip\_rules / virtual\_network\_subnet\_ids. | `string` | `"Deny"` | no |
| disable\_private\_endpoint | Disable private endpoint integration for specific use cases. | `string` | `false` | no |
| enabled\_for\_deployment | Boolean flag to specify whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault. Defaults to false. | `string` | `false` | no |
| enabled\_for\_disk\_encryption | Boolean flag to specify whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys. Defaults to false. | `string` | `false` | no |
| enabled\_for\_template\_deployment | Boolean flag to specify whether Azure Resource Manager is permitted to retrieve secrets from the key vault. Defaults to false. | `string` | `false` | no |
| environment | Which enviroment, sandbox, nonprod or prod | `string` | n/a | yes |
| generate\_certificates | This block supports the following list(map(string)) to generate certificates<br>`certificate_name` - (Required) Specifies the name of the Key Vault Certificate.<br>`issuer_parameters` - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown<br>`exportable` - (Required) Is this Certificate Exportable?<br>`key_size` - (Required) The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096<br>`key_type` - (Required) Specifies the Type of Key, such as RSA<br>`reuse_key` - (Required) Is the key reusable?<br>`action_type` - (Required) The Type of action to be performed when the lifetime trigger is triggerec. Possible values include AutoRenew and EmailContacts<br>`days_before_expiry` - (Optional) The number of days before the Certificate expires that the action associated with this Trigger should run. Conflicts with lifetime\_percentage<br>`lifetime_percentage` - (Optional) The percentage at which during the Certificates Lifetime the action associated with this Trigger should run. Conflicts with days\_before\_expiry<br>`content_type` - (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM<br>`extended_key_usage` - (Optional) A list of Extended/Enhanced Key Usages. <br>`key_usage` - (Required) A list of uses associated with this Key. Possible values include cRLSign, dataEncipherment, decipherOnly, digitalSignature, encipherOnly, keyAgreement, keyCertSign, keyEncipherment and nonRepudiation and are case-sensitive<br>`subject` - (Required) The Certificate's Subject<br>`validity_in_months` - (Required) The Certificates Validity Period in Months<br>`dns_names` - (Optional) A list of alternative DNS names (FQDNs) identified by the Certificate<br>`emails` - (Optional) A list of email addresses identified by this Certificate. <br>`upns` - (Optional) A list of User Principal Names identified by the Certificate | `list` | `[]` | no |
| import\_certificates | This block supports the following list(map(string)) to generate certificates<br>`certificate_name` - (Required) Specifies the name of the Key Vault Certificate.<br>`contents` - (Required) The base64-encoded certificate contents<br>`password` - (Optional) The password associated with the certificate<br>`issuer_parameters` - (Required) The name of the Certificate Issuer. Possible values include Self (for self-signed certificate), or Unknown<br>`exportable` - (Required) Is this Certificate Exportable?<br>`key_size` - (Required) The size of the Key used in the Certificate. Possible values include 2048, 3072, and 4096<br>`key_type` - (Required) Specifies the Type of Key, such as RSA<br>`reuse_key` -  (Required) Is the key reusable? <br>`content_type` - (Required) The Content-Type of the Certificate, such as application/x-pkcs12 for a PFX or application/x-pem-file for a PEM | `list` | `[]` | no |
| instance\_number | instance number of azure keyvault | `string` | `"01"` | no |
| ip\_rules | One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault. | `list` | `[]` | no |
| location | Azure location | `string` | `"Canada East"` | no |
| purge\_protection\_enabled | Is Purge Protection enabled for this Key Vault? Defaults to false. | `string` | `true` | no |
| resource\_group\_name | The name of the resource group. | `string` | n/a | yes |
| sku\_name | The Name of the SKU used for this Key Vault. | `string` | `"standard"` | no |
| soft\_delete\_enabled | Should Soft Delete be enabled for this Key Vault? Defaults to false. | `string` | `true` | no |
| subnet\_name | Specifies the name of the Subnet for Private Endpoint | `string` | `null` | no |
| tenant\_id | Tenant id | `string` | `"bd6704ff-1437-477c-9ac9-c30d6f5133c5"` | no |
| virtual\_network\_subnet\_ids | One or more Subnet ID's which should be able to access this Key Vault. | `list` | `[]` | no |
| vnet\_name | Specifies the name of the Virtual Network this Subnet is located within for Private Endpoint | `string` | `null` | no |
| vnet\_rg | Specifies the name of the resource group the Virtual Network is located in for Private Endpoint | `string` | `null` | no |


## Outputs

| Name | Description |
|------|-------------|
| vault\_certificate\_generate\_certificate\_data | The raw Key Vault Certificate data represented as a hexadecimal string. |
| vault\_certificate\_generate\_id | The Key Vault Certificate ID. |
| vault\_certificate\_generate\_secret\_id | The ID of the associated Key Vault Secret |
| vault\_certificate\_generate\_thumbprint | The raw Key Vault Certificate data represented as a hexadecimal string. |
| vault\_certificate\_generate\_version | The current version of the Key Vault Certificate. |
| vault\_certificate\_import\_certificate\_data | The raw Key Vault Certificate data represented as a hexadecimal string. |
| vault\_certificate\_import\_id | The Key Vault Certificate ID. |
| vault\_certificate\_import\_secret\_id | The ID of the associated Key Vault Secret. |
| vault\_certificate\_import\_thumbprint | The raw Key Vault Certificate data represented as a hexadecimal string. |
| vault\_certificate\_import\_version | The current version of the Key Vault Certificate. |
| vault\_id | The ID of the Key Vault. |
| vault\_name | The Name of the Key Vault. |
| vault\_uri | The URI of the Key Vault, used for performing operations on keys and secrets. |

## Requirements

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
| access\_tier | Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. | `string` | `"Hot"` | no |
| account\_kind | Defines the Kind of account. | `string` | `"StorageV2"` | no |
| account\_replication\_type | Defines the type of replication to use for this storage account. | `string` | `"LRS"` | no |
| account\_tier | Defines the Tier to use for this storage account | `string` | `"Standard"` | no |
| bypass | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None. | `list` | <pre>[<br>  "None"<br>]</pre> | no |
| containers | Map to create a Container within an Azure Storage Account. | `any` | `{}` | no |
| default\_action | Specifies the default action of allow or deny when no other rules match. | `string` | `"Deny"` | no |
| disable\_keys | Set this to true if you want to test without customer managaged keys | `bool` | `false` | no |
| enable\_privatelink | Variable to turn on Privatelink for the Module Resources. | `bool` | `true` | no |
| enable\_service\_endpoint | Enable or disable service endpoint | `bool` | `false` | no |
| error\_404\_document | The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file | `string` | `null` | no |
| gen2fs | Map to create a Data Lake Gen2 File System within an Azure Storage Account. | `any` | `{}` | no |
| index\_document | The webpage that Azure Storage serves for requests to the root of a website or any subfolder. | `string` | `null` | no |
| instance\_number | Number to be added in the name of your Storage Account | `string` | `"1"` | no |
| ip\_rules | List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. | `list` | `[]` | no |
| is\_hns\_enabled | This can be used with Azure Data Lake Storage Gen 2. Changing this forces a new resource to be created. | `string` | `"true"` | no |
| location | Azure location | `string` | `"Canada Central"` | no |
| queues | Map to create a Queue within an Azure Storage Account. | `any` | `{}` | no |
| resource\_group\_name | The name of the resource group. | `string` | n/a | yes |
| shares | Map to create a File Share within Azure Storage. | <pre>list(object({<br>    name = string<br>  }))</pre> | `[]` | no |
| tables | Map to create a Table within an Azure Storage Account. | `any` | `{}` | no |
| tags | A map of tags | `map` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_id | ID of storage account create |
| storage\_account\_name | Name of storage account create |
| storage\_container\_id | ID of the containers |
| storage\_container\_name | Name of the containers |
| storage\_dfs\_id | ID of the datalake shares created |
| storage\_dfs\_name | Name of the datalake shares created |
| storage\_primary\_access\_key | The primary access key for the storage account. |
| storage\_primary\_blob\_connection\_string | The connection string associated with the primary blob location. |
| storage\_primary\_connection\_string | The connection string associated with the primary location. |
| storage\_secondary\_access\_key | The secondary access key for the storage account. |
| storage\_secondary\_blob\_connection\_string | The connection string associated with the secondary blob location. |
| storage\_secondary\_connection\_string | The connection string associated with the secondary location. |
| storage\_share\_directory | List of the share directories created |
| storage\_share\_id | ID of the shares getting created |
| storage\_share\_name | Names of the shares getting created |
| storage\_table\_entity\_id | The ID of the Entity within the Table in the Storage Account. |
| storage\_table\_id | The ID of the Table within the Storage Account. |

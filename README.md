# Terraform Root Module: Azure Key Vaults and Storage Accounts

This Terraform configuration allows you to manage multiple Azure Key Vaults and Storage Accounts across different environments using a single reusable module. The infrastructure is controlled via input variables, enabling full customization per workspace without modifying the module.

## 📦 Features

- Create one or more **Key Vaults** with:
  - Region-specific deployment (`Canada East`)
  - Optional network ACLs
  - Public access control
  - Soft delete and purge protection settings

- Create one or more **Storage Accounts** with:
  - Region-specific deployment (`Canada Central`, `Canada East`)
  - Replication options: `LRS`, `RAGRS`
  - Public access control

## 📁 Folder Structure
```
roger_mission/
├── main.tf
├── variables.tf
├── outputs.tf
├── project.auto.tfvars
├── README.md
├── modules/
│   ├── keyvault/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── storage_account/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
```


## 🔧 Input Variables

All configuration is driven via the `project.auto.tfvars` file


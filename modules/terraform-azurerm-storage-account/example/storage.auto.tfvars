storage_account = {
  storage1 = {
    env = "dev"
    instance_number = "1"
    resource_group_name = "test-rg"
    location = "Canada Central"
    account_replication_type = "LRS"
    public_network_access_enabled = false
  }
  storage2 = {
    env = "dev"
    instance_number = "2"
    resource_group_name = "test-rg"
    location = "Canada east"
    account_replication_type = "RAGRS"
    public_network_access_enabled = true
  }
}
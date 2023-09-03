resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

data "azurerm_storage_account" "existing" {
  name                = "abijithjithu"
  resource_group_name = "myResourceGroup"
}

# Use the retrieved information in another resource
resource "azurerm_storage_container" "example" {
  name                  = "tfstate"
  storage_account_name  = data.azurerm_storage_account.existing.name
  container_access_type = "private"
}

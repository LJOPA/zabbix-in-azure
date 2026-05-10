resource "azurerm_virtual_network" "virtual_network" {
  name                = module.naming.virtual_network.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = ["10.0.0.0/16"]
}


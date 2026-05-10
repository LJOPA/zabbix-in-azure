module "naming" {
  source = "Azure/naming/azurerm"
  suffix = ["zabbix"]
}

resource "random_password" "mysql_admin_password" {
  length  = var.mysql_admin_password_length
  special = true
}

resource "azurerm_resource_group" "resource_group" {
  name     = module.naming.resource_group_name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "mysql_flexible_server" {
  name                   = module.naming.mysql_server.name
  resource_group_name    = azurerm_resource_group.resource_group.name
  location               = azurerm_resource_group.resource_group.location
  administrator_login    = var.mysql_admin_username
  administrator_password = random_password.mysql_admin_password.result
  version                = "8.4"
}


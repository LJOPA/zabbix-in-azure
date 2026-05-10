module "naming" {
  source = "Azure/naming/azurerm"
  suffix = ["zabbix"]
}

resource "random_password" "mysql_admin_password" {
  length  = var.mysql_admin_password_length
  special = true
}

resource "azurerm_resource_group" "resource_group" {
  name     = module.naming.resource_group.name
  location = var.location
}

resource "azurerm_mysql_flexible_server" "mysql_flexible_server" {
  name                   = module.naming.mysql_server.name_unique
  resource_group_name    = azurerm_resource_group.resource_group.name
  location               = azurerm_resource_group.resource_group.location
  administrator_login    = var.mysql_admin_username
  administrator_password = random_password.mysql_admin_password.result
  backup_retention_days  = var.mysql_backup_retention_days
  version                = "8.4"
  sku_name               = "B_Standard_B1ms"
  
  high_availability {
    mode = "SameZone"
  }
}


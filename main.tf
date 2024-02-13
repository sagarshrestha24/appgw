

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "East US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.azurerm_virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.azurerm_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.1.0/24"]
}

resource "azurerm_application_gateway" "gateway" {
  name                = var.application_gateway_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration_name
    subnet_id = azurerm_subnet.subnet.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = null
    private_ip_address   = "10.0.1.10"
    subnet_id            = azurerm_subnet.subnet.id
  }

  http_listener {
    name                           = "listener"
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  backend_address_pool {
    name = var.application_gateway_name
  }

  backend_http_settings {
    name                  = var.application_gateway_name
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
  }

   request_routing_rule {
    name                       = local.request_routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
  
}

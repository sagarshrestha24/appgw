locals {
  backend_address_pool_name      = "${var.azurerm_virtual_network_name}-beap"
  frontend_port_name             = "${var.azurerm_virtual_network_name}-feport"
  frontend_ip_configuration_name = "${var.azurerm_virtual_network_name}-feip"
  http_setting_name              = "${var.azurerm_virtual_network_name}-be-htst"
  listener_name                  = "${var.azurerm_virtual_network_name}-httplstn"
  request_routing_rule_name      = "${var.azurerm_virtual_network_name}-rqrt"
  redirect_configuration_name    = "${var.azurerm_virtual_network_name}-rdrcfg"
}
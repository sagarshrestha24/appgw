variable "arm_tenant_id" {
  type        = string
  description = "The tenant Id of azure provider"
}

variable "arm_subscription_id" {
  type        = string
  description = "The subscription Id of azure provider"
}

variable "arm_client_id" {
  type        = string
  description = "The client Id of azure provider spn"
}

variable "arm_client_secret" {
  type        = string
  sensitive   = true
  description = "The client secret of azure provider spn"
}

variable "resource_group_name" {
  type = string
}

variable "azurerm_virtual_network_name" {
  type = string
}


variable "application_gateway_name" {
  type = string
}

variable "azurerm_subnet_name" {
  type = string
}

variable "gateway_ip_configuration_name" {
  type = string
}




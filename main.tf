resource "azurerm_resource_group" "rg-example-legacy" {
  name     = "rg-pkrtech-network-hub-testvm"
  location = "West Europe"
}

resource "azurerm_public_ip" "example-legacy-pip" {
  name                = "vm-hub-t-ip"
  resource_group_name = azurerm_resource_group.rg-example-legacy.name
  location            = azurerm_resource_group.rg-example-legacy.location
  allocation_method   = "Static"

} 


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

resource "azurerm_network_interface" "example-legacy-nic" {
  name                = "vm-hub-t333"
  location            = azurerm_resource_group.rg-example-legacy.location
  resource_group_name = azurerm_resource_group.rg-example-legacy.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.pkrtech-sn-hub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example-legacy-pip
  }
}



provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "myrg" {
  name     = "${var.prefix}-k8s-resources"
  location = var.location
}

resource "azurerm_kubernetes_cluster" "myaks" {
  name                = "${var.prefix}-k8sup"
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  dns_prefix          = "${var.prefix}-k8sup"
  kubernetes_version  = "1.26.0"

  default_node_pool {
    name       = "default"
    node_count = 3
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}


    
    
  


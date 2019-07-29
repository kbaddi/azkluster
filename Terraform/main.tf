# Azure Provider config (Subscription Details)

provider "azurerm" {
    version = "~>1.5"
    subscription_id = "${var.subscription_id}"

}

# Create a resource group for the eks cluster

resource "azurerm_resource_group" "k8s" {
  name     = "${var.prefix}-RG"
  location = "${var.location}"
  tags     = "${var.tags}"
}

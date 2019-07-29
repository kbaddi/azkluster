resource "azurerm_kubernetes_cluster" "k8s" {
    name                = "${var.prefix}-cluster"
    location            = "${azurerm_resource_group.k8s.location}"
    resource_group_name = "${azurerm_resource_group.k8s.name}"
    dns_prefix          = "${var.dns_prefix}"

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = "${file("${var.ssh_public_key}")}"
        }
    }

    agent_pool_profile {
        name            = "agentpool"
        count           = "${var.node_count}"
        vm_size         = "Standard_DS1_v2"
        os_type         = "Linux"
        os_disk_size_gb = 30
    }

    service_principal {
        client_id     = "${var.client_id}"
        client_secret = "${var.client_secret}"
    }

    tags = {
        Environment = "Development"
    }
}


output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.k8s.kube_config_raw}"
}

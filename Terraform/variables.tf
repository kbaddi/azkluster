
variable "prefix" {
  description = "Prefix for the resources in this deployment"
}

// variable "susbcription_id" {
//   description = "The Subsription ID of the Subscription where the resources are deplyed"
// }

variable "location" {
  description = "Location where the RG and cluster are created"
}

variable "subscription_id" {}

variable "client_id" {}

variable "client_secret" {}

variable "node_count" {
  description = "No. of Nodes/minions to be created for the eks cluster"
  default  = 2
}

variable "node_size" {
  description = "VM Size of the Node ex; D2v1, Dv1 etc"
}

variable "tags" {
  description = "Any tags which should be assigned to the resources in this example"
  type = "map"
  default = {
    name = "k8s"
 }
}

variable "ssh_public_key" {
  description = "Path of the SSH key on the host machine"
  default = "~/.ssh/id_rsa.pub"

}

variable "dns_prefix" {
  description = "A prefix for the cluster dns"
  default = "baks"
}

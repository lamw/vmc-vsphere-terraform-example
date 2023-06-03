variable "vsphere_server" {
  description = "vCenter Server hostname/IP"
}

variable "vsphere_user" {
  description = "vCenter username"
}

variable "vsphere_password" {
  description = "vCenter password"
}

variable "vsphere_datacenter" {
  description= "vSphere Datacenter used to deploy virtual machine"
  default = "SDDC-Datacenter"
}

variable "vsphere_resource_pool" {
  description = "vSphere Resource Pool used to deploy virtual machine"
  default = "Compute-ResourcePool"
}

variable "vsphere_datastore" {
  description = "vSphere Datastore used to deploy virtual machine"
  default = "WorkloadDatastore"
}

variable "vsphere_network" {
  description = "Network Segment used to deploy virtual machine"
  default     = "sddc-cgw-network-1"
}

variable "vsphere_vm_folder" {
  description = "vSphere Folder used to deploy virtual machine"
  default = "Workloads"
}
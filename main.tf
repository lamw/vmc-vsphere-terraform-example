terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 1.26.0"
    }
  }
}

provider "vsphere" {
  vsphere_server       = "${var.vsphere_server}"
  user                 = "${var.vsphere_user}"
  password             = "${var.vsphere_password}"

  allow_unverified_ssl = false
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name     = "tf-vm-with-cloudlimitedadmin-role"
  guest_id = "ubuntu64guest"

  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"
  folder           = "${var.vsphere_vm_folder}"

  num_cpus = 1
  memory   = 4

  wait_for_guest_net_timeout = 0
  wait_for_guest_net_routable = false
  shutdown_wait_timeout = 1

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 1
  }

}
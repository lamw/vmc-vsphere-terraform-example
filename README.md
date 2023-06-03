# vSphere Terraform Provider with VMware Cloud on AWS Example

Basic example for provisioning Ubuntu VM using the [vSphere Terraform Provider](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs) in [VMware Cloud on AWS](https://www.vmware.com/products/vmc-on-aws.html) (VMC-A)

## Setup

* [Install Terraform Client](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for your OS
* Update [terraform.tfvars](terraform.tfvars) with the values in your

> Note: [vars.tf](vars.tf) has pre-defined values for `vsphere_datacenter`, `vsphere_resource_pool`, `vsphere_datastore` & `vsphere_vm_folder` for a VMC-A environment. If you wish to change these values, simply re-define these in [terraform.tfvars](terraform.tfvars).

## Usage

Run init
```console
terraform init
```

Verify VM deployment
```console
terraform plan
```

Deploy VM
```console
terraform apply
```

Delete VM
```console
terraform destroy
```
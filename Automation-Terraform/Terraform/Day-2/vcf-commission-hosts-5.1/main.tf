#main.tf for VCF 5.1 host commission - last updated on 12-4-2023

terraform {
  required_providers {
    vcf = {
      source = "vmware/vcf"
	  version = "0.6.0"
    }
  }
}
provider "vcf" {
  sddc_manager_host = var.sddc_manager_host
  sddc_manager_username = var.sddc_manager_username
  sddc_manager_password = var.sddc_manager_password
  allow_unverified_tls = true
}

# Note: as of provider 0.6.0 there is no bulk host import.
# Each hoat is added as an individual operation, which are 
# executed in parallel. I believe this means that there is
# a limit of 10 hosts at a time, but have not tested. If 
# this is the case we need to add a concurrent operations
# loop here. https://github.com/vmware/terraform-provider-vcf/issues/65

resource "vcf_host" "host" {
  for_each = var.esxi_host_list
  fqdn = each.value.esxi_host_name
  username = "root"
  password = each.value.esxi_host_password
  network_pool_id = var.wld_network_pool_name
  storage_type = var.wld_storage_type
}
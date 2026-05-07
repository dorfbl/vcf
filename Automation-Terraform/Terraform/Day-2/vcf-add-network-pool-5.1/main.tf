#main.tf for VCF 5.1 add_network_pool - last updated on 12-11-2023

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

resource "vcf_network_pool" "wld_np" {
  name = var.wld_network_pool_name
  network {
    gateway = var.wld_network_pool_gw1
    mask = var.wld_network_pool_subnetmask1
    mtu = var.wld_network_pool_mtu1
    subnet = var.wld_network_pool_subnet1
    type = var.wld_network_pool_type1
    vlan_id = var.wld_network_pool_vlan1
    ip_pools {
      start = var.wld_network_pool_ip_start1
      end = var.wld_network_pool_ip_end1
    }
  }
  network {
    gateway = var.wld_network_pool_gw2
    mask = var.wld_network_pool_subnetmask2
    mtu = var.wld_network_pool_mtu2
    subnet = var.wld_network_pool_subnet2
    type = var.wld_network_pool_type2
    vlan_id = var.wld_network_pool_vlan2
    ip_pools {
      start = var.wld_network_pool_ip_start2
      end = var.wld_network_pool_ip_end2
    }
  }
}
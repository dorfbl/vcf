#main.tf for VCF 5.1 create cluster - last updated on 12-11-2023

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

resource "vcf_host" "host4" {
 fqdn = var.esxi_host_list.host4.esxi_host_name
  username = "root"
  password = var.esxi_host_list.host4.esxi_host_password
  network_pool_id = var.wld_network_pool_id
  storage_type = "VSAN"
 }
resource "vcf_host" "host5" {
  fqdn = var.esxi_host_list.host5.esxi_host_name
  username = "root"
  password = var.esxi_host_list.host5.esxi_host_password
  network_pool_id = var.wld_network_pool_id
  storage_type = "VSAN"
 }
resource "vcf_host" "host6" {
  fqdn = var.esxi_host_list.host6.esxi_host_name
  username  = "root"
  password  = var.esxi_host_list.host6.esxi_host_password
  network_pool_id = var.wld_network_pool_id
  storage_type = "VSAN"
 }

resource "vcf_cluster" "cluster2" {
 
  domain_id = var.wld_id
  name = var.wld_cl_name
  host {
    id = vcf_host.host4.id
    license_key = var.esx_license_key
    vmnic {
      id = var.esxi_host_list.host4.esxi_host_vmnic0
      vds_name = var.wld_cl_dvs_name
    }
    vmnic {
      id = var.esxi_host_list.host4.esxi_host_vmnic1
      vds_name = var.wld_cl_dvs_name
    }
  }
  host {
    id = vcf_host.host5.id
    license_key = var.esx_license_key
    vmnic {
      id = var.esxi_host_list.host5.esxi_host_vmnic0
      vds_name = var.wld_cl_dvs_name
    }
    vmnic {
      id = var.esxi_host_list.host5.esxi_host_vmnic1
      vds_name = var.wld_cl_dvs_name
    }
  }
  host {
    id = vcf_host.host6.id
    license_key = var.esx_license_key
    vmnic {
      id = var.esxi_host_list.host6.esxi_host_vmnic0
      vds_name = var.wld_cl_dvs_name
    }
    vmnic {
      id = var.esxi_host_list.host6.esxi_host_vmnic1
      vds_name = var.wld_cl_dvs_name
    }
  }
  vds {
    name = var.wld_cl_dvs_name
    portgroup {
      name = var.wld_cl_dvs_pg_mgmt
      transport_type = "MANAGEMENT"
    }
    portgroup {
      name = var.wld_cl_dvs_pg_vsan
      transport_type = "VSAN"
    }
    portgroup {
      name = var.wld_cl_dvs_pg_vmotion
      transport_type = "VMOTION"
    }
  }
  vsan_datastore {
    datastore_name = var.wld_cl_vsan_datastore_name
    failures_to_tolerate = var.wld_cl_vsan_ftt
    license_key = var.vsan_license_key
  }
  geneve_vlan_id = var.wld_nsx_geneve_vlan
}
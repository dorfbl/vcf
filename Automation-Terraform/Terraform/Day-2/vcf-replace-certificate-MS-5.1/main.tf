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

resource "vcf_certificate_authority" "CA" {
  microsoft {
	server_url = var.microsoft_ca_server
	username = var.microsoft_ca_user
	secret = var.microsoft_ca_password
	template_name = var.microsoft_ca_template
  }

}
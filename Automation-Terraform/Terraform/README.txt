This content has been created specifically for the Pro Cloud Services for Private Cloud Infrastructure Solutions as developed by Portfolio Services Engineering. It uses Terraform as the primary deployment mechanism, as per the charter of the program. 

For terraform, download the executable from https://github.com/vmware/terraform-provider-vcf/ and add it to the path, and then run the code.

To be able to initialize and run the code follow these steps:

1. terraform init - this will initialize the provider.
2. terraform plan -out=<filename> - this will build the plan and check it for errors to a file you specify.
3. terraform apply <filename> - this will apply the plan that was created.

Once it is executing any errors that occur during the process you can see and fix it.  Typically errors will show both in the console, or in the case of cloud builder, if you login to the interface you can get further details and watch the deployment process.

The content is currently as follows:
- vcf-cb-deploy-5.x - is the terraform code to deploy a cloud builder appliance from a local source. 
- vcf-bringup-5.0 - is the terraform code to be able to instantiate a VCF 5.0 deployment on a pre-existing cloud builder which has been deployed.
- vcf-bringup-5.1 -  is the terraform code to be able to instantiate a VCF 5.0 deployment on a pre-existing cloud builder which has been deployed.
- vcf-create-wld-5.1 - is the terraform code to instantate a workload domain, including hosts and network pool.
- Day-2 - Folder with individual operational tasks
-- vcf-add-cluster-5.1 - code to add a cluster to an existing workload domain using an existing network pool
-- vcf-add-network-pool-5.1 - Code to add a network pool outside of other workflows
-- vcf-commission-hosts-5.1 - Code to commission a host outside of other workflows
-- vcf-replace-certificate-MS-5.1 - Code to add a MS CA to SDDC Manager - WIP to actually generate and replace the certificates, which is not available in 0.6.0 version of the provider.

The templates have been variablized properly, so that all that should be required is to edit the variables.tf file.  There should be no changes required to main.tf to be able to execute the code.

There is no implied warranty or support for the scripting contained in this folder.
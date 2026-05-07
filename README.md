


# VMware Pro Cloud Service: Build a Private Cloud (VCF Version 9.0)

## Description

This VMware Pro Cloud Service can help your Customer build a private cloud infrastructure and create a well-architected foundation for their current and future needs. The service provides a standardized, repeatable, and prescriptive approach, grounded in extensive customer experience and best practices. These assets support the delivery of the *Build a Private Cloud* service, which includes support for five different architectures, referred to as design blueprints.

These assets serve as a starting point for designing and deploying a *Build a Private Cloud* customer engagement. They are organized by functional areas, starting with the foundational instantiation of a standardized VCF platform deployment and continuing with the design and deployment of additional VCF components.  

**Now offering design diagrams via LucidCharts. See the EDM Bill-of-Material section for more details.**

## Supported Services

The assets in this folder support the delivery of the following packages:

* *Build a Private Cloud*
* *Build a U.S. Federal Cloud*

## Special Considerations

The delivery assets in this folder support multiple packaged services. Special instructions appear below.

### Design Blueprints

To assist in choosing an architecture that meets a Customer's specific business and technology requirements, the Design Blueprints section provides predefined architecture topologies based on design profiles. To deliver a ready-to-consume solution that provides the complete set of capabilities (end-to-end design) offered by the VMware Cloud Foundation platform, each Design Blueprint prescribes the deployment models for each VMware Cloud Foundation component. Additional details are available here: https://techdocs.broadcom.com/us/en/vmware-cis/vcf/vcf-9-0-and-later/9-0/design/blueprints.html

The *Build a Private Cloud* delivery assets support five (5) unique architectures. These variations provide unique starting points that can be used as needed to support a Customer's specific architecture needs. The delivery technical team should determine which architecture most closely aligns with the Customer's needs. Once selected, the delivery team can use the Design Library document guidance to add additional design guidance to the chosen template. The Design Library is located in the *VCF-High-Level-Design* folder.

1. Single Site with Minimal Footprint - Small deployments, edge locations
2. Single Site - Standard single datacenter deployment
3. Multiple Sites in a Single Region - Regional high availability
4. Multiple Sites in a Single Region + Additional Regions - Multi-region with primary region focus
5. Multiple Sites Across Multiple Regions - Global deployment with distributed architecture

> **Note:** The assets and guidance included in the Build a Private Cloud EDM bundle are aligned to a standard design and deployment of a Build a Private Cloud environment. The assets, including prerequisite, design, and deployment documentation, are written to support a standard Build a Private Cloud environment. Specifically, they do not include deviations of scope, LOE, or team structure made by the pre-sales team or between Broadcom and the partner professional services team.

### *Build a Private Cloud Specific*

None.

### *Build a U.S. Federal Cloud Specific*

The Build a U.S. Federal Cloud Design and build VCF delivery kit and automation content is the same across Private, Federal, Department of Defense (DoD), and Intel Community (IC) sectors. Specific instructions for hardening Federal/DoD/IC environments can be found in the readme file of the **VCF NIST Hardening** directory as well as in the Build a **U.S. Federal Cloud** section below.

## Prerequisite for Delivery

The *Prerequisite Checklists* for this service are located in the *Internal-VCF-Instantiation* folder. The following prerequisite documents are available:

* Engagement Checklist
* VCF Design Prerequisites
* VCF Deployment Prerequisites
* VCF SDN Prerequisites
* VCF NSX Federation Prerequisites

> **Important:** The deployment of the Build a Private Cloud package assumes that the server environment (racks, servers, power, network hardware deployment and configuration, etc.) has been completed and validated before initiating the deployment of the VCF software. Additionally, these steps may require a significant amount of time for purchasing, setup, and configuration. The delivery team, project management, and team should validate that this work is complete before arriving on-site. The Customer may request Broadcom's guidance for some of these steps.*

## Service Delivery Resources and Flow

### *Build a Private Cloud*

The following is a summary of the recommended engagement delivery flow for a *Build a Private Cloud* service engagement. An expanded list of tasks and LOE per delivery team role is available in the work breakdown structure (WBS), which is located in the *VCF Environment Instantiation* folder; corresponding resources are also listed.

#### Virtual Infrastructure/General Design of VCF Components

##### Resources

This component leverages assets in the following folders: VCF Requirements Traceability Matrix, VCF High-Level Design, VCF Environment Instantiation, VCF vSphere Kubernetes Service Add-on, VCF Automation, and VCF Operations Orchestrator.

##### Flow

1. Prerequisites: Validate prerequisites have been met

2. Requirements: Conduct initial requirements gathering workshops. The delivery team should use the VCF Requirements Traceability Matrix template, located in the *VCF Requirements Traceability Matrix* folder, to capture requirements.

3. Design: Begin the design process of the proposed VCF environment based on VMware best practices and Customer requirements. The design process should include PS practice internal reviews and design refinement based upon feedback, iterate as needed.

4. Workshops: Present the proposed design to the Customer, seek approval of the design, iterate as needed.

5. Deployment: Conduct the deployment of the VCF environment based on the Customer-approved design.

#### Automated Operation Component

##### Resources

This component leverages assets in the following folders: VCF Operations for Logs, VCF Operations for Networks, and VCF Operations (Consumption).

##### Flow

1. Design: Begin the design process of the proposed VCF environment based on VMware best practices and Customer requirements. The design process should include PS practice internal reviews and design refinement based upon feedback, iterate as needed.

4. Workshops: Present the proposed design to the Customer, seek approval of the design, iterate as needed.

5. Deployment: Conduct the deployment of the VCF environment based on the Customer-approved design.

#### Security Governance and Compliance Component

##### Resources

This component leverages assets in the following folders: VCF NIST Hardening.

##### Flow

1. Design: Begin the design process of the proposed VCF environment based on VMware best practices and Customer requirements. The design process should include PS practice internal reviews and design refinement based upon feedback, iterate as needed.

2. Workshops: Present the proposed design to the Customer, seek approval of the design, iterate as needed.

3. Deployment: Conduct the deployment of the VCF environment based on the Customer-approved design.

#### Transformation Consulting Component

##### Resources

This component leverages assets available in the Jumpstart Workshop and Transformation Consulting service offering. These assets can be accessed from the EDM Index (https://sites.google.com/broadcom.com/edmindex). Note: These assets are not yet available via the Insight Portal.

##### Flow

Please follow the guidance provided with these assets as listed in the Resources section above.


#### Operate and Scale Component

##### Resources

The Operate and Scale portion of this service is provided as additional LOE for tailored work required by the Customer; it is open-ended work. As such, there are no predetermined assets.

##### Flow

As with the resources, the Operate and Scale portion of this service is provided as additional LOE for tailored work required by the Customer; it is open-ended work. As such, there is no predetermined delivery flow..

### *Build a U.S. Federal Cloud*

For delivery into Federal/DoD/IC environments, follow the service delivery flow for *Build a Private Cloud* above, then follow the guidance provided in the [VMware Cloud Foundation 9.x DOD STIG Compliance and Automation](https://github.com/vmware/dod-compliance-and-automation/tree/master/vcf/9.x) repo for STIG application/appliance compliance and automation.

Additional supporting materials:

* [STIG Guidance](https://github.com/vmware/dod-compliance-and-automation)
* [STIG Appliance](https://ent.box.com/s/rpqmf74h6fdablrbougawdd9afd4lglc)
* [STIG Automation Documentation](https://techdocs.broadcom.com/us/en/vmware-cis/vcf/stig/9-0/vcf-stig-documentation/docs-overview-overview.html)

## Installation

Installation is performed in one of three ways for a VMware Pro Cloud Service for Private Cloud:

* **VCF Installer** - This requires manual installation and configuration of all pieces of the infrastructure.

* **PowerShell** - all of the documentation lists PowerShell commands that can be run to automate configurations. Note that for VMware Validated Solutions, One-Click installations can be performed, automating much of the step-by-step PowerShell configurations. PowerShell support is available for VCF 5.2, although it may also work for some aspects of VCF 9.0.

* **Terraform** - Is available for many of the components, which further automates the installation where Terraform modules are available.

## Engagement Delivery Material Usage

The Engagement Delivery Materials (EDM) documents support the delivery of this offering. These represent a standard set of templates provided to drive and support the technical definition and delivery of this offering. Leveraging these assets helps drive:

* Consistency and Cohesion
* Branding and Identity
* Scalability
* Efficiency and Time-Saving
* Training and Onboarding Consistency
* Error Reduction

### EDM Folder Structure

The following is a list of EDM assets available to support this service. Specifically, these assets support the deployment of a *Build a Private Cloud* with respective Management components.  

The *Build a Private Cloud* EDM assets utilize several folders to facilitate the use of assets across the various components of the VCF solution. The folders are presented below in the order in which they should be used:

* **1. VCF Requirements Traceability Matrix** - This folder contains an Excel workbook that can be used to capture customer requirements.

* **2. VCF High-Level Design** - This folder contains assets specific to the design of the VCF solution. This folder includes the VCF Design Library and the Planning and Prep Workbook.

* **3. VCF Environment Instantiation** - This folder contains assets specific to both the initial setup of the VCF solution and supporting assets used throughout the engagement. This folder includes the Work Breakdown Structure document.

* **4. VCF NIST Hardening** - This folder contains assets specific to security hardening aspects of the VCF solution.

* **5. VCF vSphere Kubernetes Service Add-on** - This folder contains assets specific to designing and deploying vSphere Kubernetes Service to a VCF deployment.

* **6. VCF Operations for Logs** - This folder contains assets specific to the design and deployment of VCF Operations for Logs.

* **7. VCF Operations for Networks** - This folder contains assets specific to the design and deployment of VCF Operations for Networks.

* **8. VCF Automation** - This folder contains assets specific to the design and deployment of VCF Automation.

* **9. VCF Operations Orchestrator** - This folder contains assets specific to the design and deployment of Orchestrator.

* **10. VCF Operations (Consumption)** - This folder contains assets specific to the configuration and consumption of VCF Operations, FOLLOWING the initial deployment of VCF Operations, which is a required component of VCF 9.0.

* **Automation-Terraform** - This folder contains assets specifically intended to be used for Terraform-based automated deployment; this is optional.

* **Broadcom** - This folder, if present, may contain additional assets specific to the design and deployment of a Build a Private Cloud Instance, which are considered proprietary to Broadcom.

### EDM Bill-of-Material

This standardized high-level design is created in the VCF *High-Level Design* directory, which includes the following:

* **High Level Design (MS Word)** - This is the high-level design document used to document the customer-specific requirements, the conceptual design, and the logical design.

* **Design Workshop (MS PowerPoint)** - This is the design workshop associated with the high-level design construct.

* **NEW Design Diagrams (LucidChart, MS Visio/PowerPoint)** - These files contain the design diagrams associated with the high-level design. See the LucidChart diagram file for a link to applicable diagrams. Note: Every Time you click a LucidChart link, a copy of this LucidChart will be created; you can access it via your Home area in Lucid. High-level design diagrams for the VCF stack are available. These are located in "VCF Environment Instantiation" and "VCF-High-Level-Design" folders.

* **Design Library (MS Word)** - This is the Design Library of additional design decisions that are available for VCF 9.0.

* **Requirements Traceability Matrix (MS Excel)** workbook - This is the standard RTM document, which is a part of the standard architecture delivery kit.

* **VCF Planning and Preparation Workbook (MS Excel)** - a copy of the current planning and preparation workbook as downloaded from the documentation.

Each of the folders in this repository follows the standard bill of materials, which includes the following documents:

* **Prerequisite Checklist (MS Excel)** - This document type provides a listing of different prerequisites that apply to the part of the engagement being performed.

* **Low-Level Design (MS Word)** - This document type provides a detailed design doc, which is typically used as a deliverable for customer engagement.

* **NEW Low-Level Design Diagrams (LucidChart, MS Visio/PowerPoint)** - This document type provides source files for the design diagrams used for the documentation. See the LucidChart diagram file for a link to applicable diagrams. Note: Every Time you click a LucidChart link, a copy of this LucidChart will be created; you can access it via your Home area in Lucid. Low-Level design diagrams are available for components of the VCF stack. These are located in component folders.

* **Design Decisions Workbook (MS Excel)** - This document type provides a list of all of the design decisions used in this phase of the design.

* **Engagement WBS (MS Excel)** - This document type provides a work breakdown structure for the engagement, which lists detailed tasks that were used to develop the Level of Effort.

* **Knowledge Transfer Workshop (MS PowerPoint)** - This document type provides content that can be used during the knowledge transfer portion of the engagement.
 
* **Installation and Configuration Procedures (MS Word)** - This lists the detailed steps to perform the installation and configuration of the component. Note: If automation is used, this document will be used solely for reference purposes.

* **Professional Services Runbook (MS Excel)** - This document type provides a list of the different post-installation tasks that are required to standardize Pro Cloud Services Engagements.

* **Standard Operating Procedures (MS Word)** - This document type provides day two tasks, which may be helpful to post-deployment of the solution.

* **Verification Workbook (MS Excel)** - This document type provides a list of verification checks to validate the functionality of the environment post-deployment

## Support & Feedback

We welcome your feedback to improve these materials continually.

The Broadcom VCF Central PS team welcomes your feedback regarding this content. Feedback is welcome and appreciated. Field contributions benefit all users of this content. Please feel free to submit feedback using this link:

**Submit Feedback:** [VCF PS Portfolio Feedback Form](https://feedback.esp.vmware.com/feedback/inproduct?client_id=esp-prod-768-utpab&form_name=esp-prod-768-utpab-vcf-ps-portfolio-feedback-intake-request-form&standalone=true)

>**Note:** When submitting feedback or documents, please refrain from including customer-specific details. That said, if removing such data would negate the feedback, please feel free to leave it in or make substitutions. For example, if you submit a document with a company name, feel free to replace it with "Rainpole" throughout the document.

**Questions or Issues:**

* Post to [VCF PS Portfolio Assistance](https://chat.google.com/room/AAAAy45cLcQ?cls=7) Google Space (For Internal Resources)
* Post to [VCF PS Portfolio Partner Assistance & Feedback](https://chat.google.com/room/AAQAzhG29Sw?cls=7) Google Space (For Partner Resources)

## Additional Resources

* **VMware Cloud Foundation Documentation:** [techdocs.broadcom.com](https://techdocs.broadcom.com/)
* **VMware Validated Solutions:** Pre-validated reference architectures
* **PowerVCF PowerShell Module:** Automation cmdlets for VCF
* **Terraform Provider for VCF:** Infrastructure as Code modules
 
## License

Copyright (c) VMware by Broadcom, Inc. 2026. All Rights Reserved.

## Project status

This is a released project.

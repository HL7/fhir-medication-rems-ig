# Medication Risk Evaluation and Mitigation Strategy (REMS) Implementation Guide Home Page

### Overview
A Risk Evaluation and Mitigation Strategy (REMS) is a drug safety program that the U.S. Food and Drug Administration (FDA) can require for certain medications with serious safety concerns to help ensure the benefits of the medication outweigh its risks. REMS are designed to reinforce medication use behaviors and actions that support the safe use of that medication. While all medications have labeling that informs health care stakeholders about medication risks, only a few medications require REMS programs.

This implementation guide focuses on provider workflows during the ordering of REMS medications and associated patient encounters—and the supporting information exchanges between the provider and the REMS Administrator that manages the associated program.

### Content and organization
The implementation guide is organized into the following sections:
* [Use Cases](use-cases.html) describes the context process scope of the implementation guide--identifying the participants, specific scenarios and variations addressed in the guide, and how the associated systems interact to support the process goal
* [Triggering During Patient Care](cds-triggers.html) provides guidance for initiating interactions between the EHR and REMS Administrator at appropriate points in patient care
* [Sharing EHR Data in CDS Hook Events](cds-data-sharing.html) discusses information that needs to be shared during EHR / REMS Administrator interactions to enable the Administrator to identify information needs, notifications and next process steps
* [SMART App Launch and Security](smart-launch-and-security.html) gives guidance related to the SMART on FHIR app launch process and associated security considerations
* [Use of Questionnaires Within SMART Apps](questionnaires.html) discusses the use of FHIR Questionnaires in the REMS process for gathering information from EHR users and system records
* [Technical Background](technical-background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Technical Background](technical-background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Formal Specification](specification.html) covers the detailed implementation requirements and conformance expectations
* [Artifacts](artifacts.html) introduces and provides links to the FHIR R4 profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide
### Dependencies 
This implementation guide relies on the following other specifications: 

* [FHIR R4](http://hl7.org/fhir/R4/) - The ‘current’ official version of FHIR as of the time this implementation guide was published. 
* [US Core STU3](http://hl7.org/fhir/us/core) - The published version of US Core based on FHIR R4.
* [Da Vinci CRD](https://build.fhir.org/ig/HL7/davinci-crd/)
* [Da Vinci DTR](https://build.fhir.org/ig/HL7/davinci-dtr/)
* [CDS Hooks CI Build](https://cds-hooks.org/specification/current/) - The community release that defines the hooks used by this implementation guide
* [CDS Hooks 1.0](https://cds-hooks.hl7.org/1.0/) - The official standard for trial use publication of CDS Hooks that defines the CDS Hooks protocol and interfaces used by this implementation guide
* [NCPDP Script](https://www.ncpdp.org/) - The SCRIPT Standard supports transactions for new prescriptions, prescription changes, refill requests, prescription fill status notification, prescription cancellation, medication history, transactions for long term care environments, and prior authorization exchanges. 
* [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) - The specification provides a reliable, secure authorization protocol for SMART apps launched from a clinical system to support coverage requirements discovery (e.g. what-if scenarios).
* [Structured Product Labling IG](https://build.fhir.org/ig/HL7/fhir-spl/branches/main/index.html)
* [Specialty Medication Enrollment IG](https://build.fhir.org/ig/HL7/fhir-specialty-rx/artifacts.html)
### Sponsoring HL7 Workgroup  
[Pharmacy](http://www.hl7.org/Special/committees/medication/index.cfm)

### Authors

<table class="grid">
    <tbody>
	  <tr>
		<td colspan="2">HL7 Pharmacy Workgroup</td>
  	  </tr>
	  <tr>
		<td>Frank McKinney</td>
		<td><a href="mailto:frank.mckinney@pocp.com">frank.mckinney@pocp.com</a></td>
	  </tr>
	</tbody>
  </table>


### Dependencies
{% include dependency-table.xhtml %}

### Cross Version Analysis
{% include cross-version-analysis.xhtml %}

### Global Profiles
{% include globals-table.xhtml %}

### IP Statements
{% include ip-statements.xhtml %}

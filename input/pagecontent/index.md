# Medication Risk Evaluation and Mitigation Strategy (REMS) Implementation Guide Home Page

### Overview
A Risk Evaluation and Mitigation Strategy (REMS) is a drug safety program that the United States Food and Drug Administration (FDA) requires for medications with serious safety concerns. REMS are designed to reinforce medication use behaviors and actions that support the safe use of the medication. While all medications have labeling that informs health care stakeholders about medication risks, only a small number of medications require REMS programs.

This implementation guide focuses on provider workflows during the ordering of REMS medications and associated patient encounters—and the supporting information exchanges between... 
- the provider and the REMS Administrator that manages the associated program
- the provider and the pharmacy to which the prescription is sent for dispensing
- the pharmacist or other involved party and the REMS Administrator, to learn the status of REMS steps associated with a patient prescription and/or additional REMS requirements for which they are responsible (discuss)

The guide describes the use of FHIR features including CDS Hooks and SMART App Launch to exchange REMS-related information between providers and REMS Administrators during patient care, and it provides guidance for including REMS-related information in the resulting prescription sent to the pharmacy in an NCPDP SCRIPT transaction.

The goal of this guide is to establish information exchange conventions that support...
- notifying providers and patients of REMS requirements early in the ordering process
- satisfying REMS information needs using data from the patient's electronic record where possible--minimizing manual data entry
- capturing REMS case information--including case identifiers or other information assigned by the REMS Administrator--in the provider system
- reducing prescription fulfillment delays by completing up-front REMS steps before the order is sent to the pharmacy and including relevant case information in the prescription
- enabling those involved in fulfilling the prescription to learn of their responsibilities and the status of other REMS requirements.

... with the aim of ensuring safe use in a way that gets the medication to the patient quicker.

<p></p>

### Content and organization
The implementation guide is organized into the following sections:
* [Participants and Roles](roles.html) identifies the REMS program participants and the systems they use
* [Use Cases](use-cases.html) introduces the REMS workflows, identifies the participants and scenarios covered by the guide, and describes how the associated systems interact to support the process goals
* [Triggering During Patient Care](cds-triggers.html) provides guidance for initiating interactions between the EHR and REMS Administrator at appropriate points in the patient's care
* [Sharing Care Data in CDS Hook Events](cds-data-sharing.html) discusses information provided during the EHR-to-REMS Administrator CDS Hooks interaction that enables the Administrator to identify program information needs, notifications and next process steps
* [SMART App Launch and Security](smart-launch-and-security.html) gives guidance related to the SMART on FHIR app launch process and associated security considerations
* [Use of Questionnaires Within SMART Apps](questionnaires.html) discusses the option of using FHIR Questionnaires in the REMS process for gathering information from EHR users and system records
* [Technical Background](technical-background.html) describes the specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Formal Specification](specification.html) provides detailed implementation requirements and conformance expectations
* [Artifacts](artifacts.html) introduces and provides links to the FHIR resource profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide

<p></p>

### Dependencies 
This implementation guide relies on the following other specifications: 

* [CDS Hooks 2.0](https://cds-hooks.hl7.org/2.0/) - The official standard for trial use publication of CDS Hooks that defines the CDS Hooks protocol and interfaces used by this implementation guide
* [CDS Hooks CI Build](https://cds-hooks.org/specification/current/) - The most recent draft release that defines additional event hooks beyond those in CDS Hooks 2.0
* [SMART on FHIR](http://hl7.org/fhir/smart-app-launch) - The specification provides a reliable, secure authorization protocol for SMART apps launched from a clinical system or standalone application to support REMS information capture and data exchange
* [FHIR R4](http://hl7.org/fhir/R4/) - The current official version of FHIR as of the time this implementation guide was published
* [US Core](http://hl7.org/fhir/us/core) - The current published version of US Core profiles based on FHIR R4
* _Use of the following specifications within this IG is to be determined:_
  * [Da Vinci CRD](https://build.fhir.org/ig/HL7/davinci-crd/)
  * [Da Vinci DTR](https://build.fhir.org/ig/HL7/davinci-dtr/)
  * [Structured Product Labling IG](https://build.fhir.org/ig/HL7/fhir-spl/branches/main/index.html)
  * [Specialty Medication Enrollment IG](https://build.fhir.org/ig/HL7/fhir-specialty-rx/artifacts.html)

<p></p>

### Sponsoring HL7 Workgroup  
[Pharmacy](https://confluence.hl7.org/display/PHAR)

<p></p>

### Co-Sponsors 
[Clinical Decision Support](https://confluence.hl7.org/display/CDS)
[Biomedical Research & Regulation](https://confluence.hl7.org/display/BRR)

<p></p>

### Authors

<table class="grid">
    <tbody>
	  <tr>
		<td colspan="2">HL7 Pharmacy Workgroup</td>
  	  </tr>
	  <tr>
		<td>Frank McKinney</td>
		<td><a href="mailto:fm@frankmckinney.com">fm@frankmckinney.com</a></td>
	  </tr>
	</tbody>
  </table>

<p></p>


### Dependencies
{% include dependency-table.xhtml %}

### Cross Version Analysis
{% include cross-version-analysis.xhtml %}

### Global Profiles
{% include globals-table.xhtml %}

### IP Statements
{% include ip-statements.xhtml %}

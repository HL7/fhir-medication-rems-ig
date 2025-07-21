### Overview
A Risk Evaluation and Mitigation Strategy (REMS) is a drug safety program that the United States Food and Drug Administration (FDA) requires for medications with serious safety concerns. REMS are designed to reinforce medication use behaviors and actions that support the safe use of the medication. While all medications have labeling that informs health care stakeholders about medication risks, only [a small number of medications require REMS programs](https://www.accessdata.fda.gov/scripts/cder/rems/index.cfm).

This implementation guide focuses on provider workflows during the ordering of REMS medications and associated patient encounters. It defines information exchanges to support those events, including interactions between... 
- the provider and the REMS Administrator that manages the associated program
- the provider and the pharmacy to which the prescription is sent for dispensing
- the pharmacist or other involved party and the REMS Administrator, to learn the status of REMS steps associated with a patient prescription and/or additional REMS requirements for which they are responsible (discuss)
- new or existing intermediaries in place to facilitate easier communication between the various parties including the provider, REMS Administrator, and pharmacist

The guide describes the use of FHIR features including CDS Hooks and SMART App Launch to exchange REMS-related information between providers and REMS Administrators during patient care, and it provides guidance for including REMS-related information in the resulting prescription sent to the pharmacy in an NCPDP SCRIPT transaction.

The goal of this guide is to establish information exchange conventions that support...
- notifying providers and patients of REMS requirements early in the ordering process
- satisfying REMS information needs using data from the patient's electronic record where possible--minimizing manual data entry
- capturing information about a specific patient's participation in a REMS program--including identifiers or other information assigned by the REMS Administrator--in the Provider System
- reducing prescription fulfillment delays by completing up-front REMS steps before the order is sent to the pharmacy and including relevant REMS information in the prescription
- enabling those involved in fulfilling the prescription to learn of their responsibilities and the status of other REMS requirements
- enabling an approach that is congruent with the Da Vinci prior authorization (PA) related IGs, CRD and DTR, mitigating implementation burden as often both PA and REMS are applicable

... with the aim of ensuring safe use in a way that gets the medication to the patient quicker.

<p></p>

### Content and organization
The implementation guide is organized into the following sections:
* [REMS Steps and Terminology](process.html) provides the high-level set of steps and timeframes the IG uses as the context for its guidance. It also describes how REMS steps fit within e-prescribing workflows and provides guidance for integrating related FHIR and NCPDP SCRIPT exchanges
* [Participant Roles and Needs](roles.html) identifies the REMS program participants, the systems they use, and their needs addressed by this implementation guide
* [Use Cases](use-cases.html) introduces the REMS workflows, identifies the participants and scenarios covered by the guide, and describes how the associated systems interact to support the process goals
* [REMS Interaction Events and Triggers](event-triggers.html) provides guidance for initiating interactions between the Provider System (e.g., an EHR) and REMS Administrator System at appropriate points in the patient's care
* [Future Directions](future-directions.html) discusses REMS flows and features that are not covered in this version of the IG, but are the focus of continued efforts
* [Technical Background](technical-background.html) describes the specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification, including US Core profiles used in this IG.. It also provides background and rationale for key aspects of the IG's approach, and describes how approaches used in this guide relate to those employed in the Da Vinci "Burden Reduction" guides
* [Formal Specification](specification.html) provides detailed implementation requirements and conformance expectations related to:
  *  this IG's use of CDS Hooks conventions for triggering exchanges and exchanging information in different scenarios
  *  guidance related to the SMART on FHIR app launch process and associated workflows
  *  REMS-specific and general FHIR requirements related to security and patient privacy
* [CDS Hooks Card Profiles](cds-cards.html) formally defines content for CDS Hooks cards and system actions returned in REMS flows
* [Artifacts](artifacts.html) introduces and provides links to the FHIR resource profiles and other FHIR artifacts defined in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [Credits](credits.html) identifies the individuals and organizations involved in developing this implementation guide

<p></p>

### Dependencies 
This implementation guide relies on the following other specifications: 

* [CDS Hooks 2.0](https://cds-hooks.hl7.org/2.0/) - The official standard for trial use publication of CDS Hooks that defines the CDS Hooks protocol and interfaces used by this implementation guide
* [SMART on FHIR 2.1](https://hl7.org/fhir/smart-app-launch/STU2.1) - The specification provides a reliable, secure authorization protocol for SMART apps launched from a clinical system or standalone application to support REMS information capture and data exchange
* [FHIR R4](http://hl7.org/fhir/R4/) - The current official version of FHIR as of the time this implementation guide was published
* [US Core](http://hl7.org/fhir/us/core) - The current published version of US Core profiles based on FHIR R4

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
		<td colspan="2">HL7 Pharmacy Work Group</td>
  	  </tr>
	  <tr>
		<td>Frank McKinney</td>
		<td><a href="mailto:fm@frankmckinney.com">fm@frankmckinney.com</a></td>
	  </tr>
	  <tr>
		<td>Robert Dingwell</td>
		<td><a href="mailto:bobd@mitre.com">bobd@mitre.com</a></td>
	  </tr>
	  <tr>
		<td>Patrick LaRocque</td>
		<td><a href="mailto:plarocque@mitre.com">plarocque@mitre.com</a></td>
	  </tr>
	  <tr>
		<td>Lauren DiCristofaro</td>
		<td><a href="mailto:laurend@mitre.org">laurend@mitre.org</a></td>
	  </tr>
	</tbody>
  </table>

<p></p>

### Dependencies
{% include dependency-table-short.xhtml %}

### Cross Version Analysis
{% include cross-version-analysis.xhtml %}

### Global Profiles
{% include globals-table.xhtml %}

### IP Statements
{% include ip-statements.xhtml %}

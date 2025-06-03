### Future Directions
This guide reflects initial efforts to establish guidance for using FHIR to automate data exchange and facilitate system interactions between providers and REMS Administrators. The REMS community intends to continue work toward system integration to improve the process for patients, providers and others involved in the treatment of patients with a REMS drugs. 

Support for additional scenarios and stakeholders such as those described below may be covered in future versions of this guide.

<p></p>

### Possible Additional Scenarios

#### Patient enrollment using a patient-directed application
A provider prescribes a medication that has a REMS for a patient and fills out the required patient enrollment forms. The patient receives a notification to attest that they have received any required education/documentation required by the REMS as well as the accuracy of the information contained on the forms. 

The patient logs into their provider's patient portal and launches an application to fill out the required information and submits the results back to the REMS Administration system.

<p></p>

#### Validation that a pharmacy enrolled in a REMS program
A provider prescribes a medication that has a REMS for a patient. The provider asks the patient what their preferred pharmacy is.  Before sending the prescription to the pharmacy, the EMR queries the REMS Administration systems to determine if the pharmacy is enrolled in the REMS if required and can dispense the medication.  The REMS Administration system sends back a notification stating if the pharmacy can dispense the medication.  An alert is displayed in the user interface of the EMR if the pharmacy is incapable of dispensing the medication. 

<p></p>

#### Additional support for ongoing patient care
Once the patient has started on the REMS drug, REMS activities may include monitoring programs and additional authorization steps, and many participants may be involved during this period. New scenarios related to ongoing care may be identified and addressed in future versions of this guide, potentially providing additional visibility of pertinent information or improved communication between stakeholders through use of FHIR.

<p></p>

#### Incorporate CDS Hooks or SMART App Launch features that become available in the future
As the CDS Hooks and SMART App Launch standards continue to evolve and respond to implementers' experience, new features such as additional CDS "hook" events or additional SMART App Launch options might become available. Future releases of this guide may utilize new features in those standards to support REMS workflows.

<p></p>

### Greater data and process integration

Further data and process integration between REMS stakeholders may be pursued in future versions of this guide, potentially including: 
- capturing discrete REMS data elements in the Provider System in a way that enables them to be systematically populated into the e-prescription
- establish standard mappings between NCPDP and FHIR prescription information models
- further integrating CDS Hooks / SMART app data exchange with medication prescribing workflows in the Provider System
- leveraging well-supported, existing pharmacy-to-provider exchange patterns such as the NCPDP RxChangeRequest to enable questions and other requests related to REMS.

<p></p>

### Other Challenges to REMS Automation
In addition to supporting additional workflow scenarios, work is needed to address technical challenges that cause setup and maintenance work for stakeholders and may hinder broad implementation of the FHIR approaches described here.

<p></p>

#### Provider System configuration for many drugs and REMS programs
**Easing Health System Configuration.** Future versions of this guide may include approaches for reducing the burden on health systems to configure their Provider Systems to support REMS workflows. Future approaches may support:
- maintaining CDS Hooks configuration to direct requests to different REMS Administrator Systems for different drugs
- maintaining SMART app configuration for many REMS Administrators' apps
- maintaining changes to configuration when:
  - REMS programs move from one Administrator to another
  - REMS drug identifiers (used to configure CDS Hooks triggers) change or are added due to new product variations, discontinuation or other reasons

### Handling Errors from Pharmacy Systems
Future versions of this guide may include further interactions between the Provider EHR system and Pharmacy systems beyond sending the Prescription. These could include:
- REMS Prescriber Intermediary to REMS Pharmacy Intermediary
  - sending reject codes when there are still requirements for the REMS program to be completed by the Patient or Provider
  - information about what Pharmacies may be available for dispensing a given REMS drug
- REMS Prescriber Intermediary to EHR
  - develop a mechanism for sending messages to the EHR when not requested by the EHR
  - forward messages from the Pharmacy system to the EHR alerting of needed forms or other information

<p></p>
<p></p>
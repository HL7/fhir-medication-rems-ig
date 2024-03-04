_Placeholder material. To be expanded..._

<p></p>

### Scenarios not covered in this guide
Support for the following scenarios is not included in this version of the implementation guide. They may be covered in future versions.

_Note: Below are placeholders that haven't been reviewed yet_

<p></p>

#### Check REMS status systematically
A provider, pharmacy or other REMS stakeholder checks the status of REMS requirements associated with a patient's prescription.

Information is returned in structured form that the requesting system can use to trigger next steps, etc.
 
<p></p>

#### Patient enrollment using a patient-directed application
A provider prescribes a medication that has a REMS for a patient and fills out the required patient enrollment forms. The patient receives a notification to attest that they have received any required education/documentation required by the REMS as well as the accuracy of the information contained on the forms. 

The patient logs into their providers patient portal and launches an application to fill out the required information and submits the results back to the REMS Administration system.

<p></p>

#### Validate pharmacy is enrolled 
A provider prescribes a medication that has a REMS to a patient. The provider asks the patient what their preferred pharmacy is.  Before sending the prescription to the pharmacy, the ERM queries the REMS Administration systems to determine if the pharmacy is enrolled on the REMS if required and can dispense the medication.  The REMS Administration system sends back a notification stating if the pharmacy can dispense the medication.  An alert is displayed in the uI of the EMR if the pharmacy is incapable of dispensing the medication. 

<p></p>

### Other challenges to be pursued in future versions of the IG

_Placeholders to be discussed and fleshed out..._

#### Easing Provider System configuration for many drugs and REMS Administrator Systems

_Discuss:_

**Easing Health System Configuration.** Future versions of this guide may include approaches for reducing the burden on health systems to configure their Provider Systems to support REMS workflows. Future approaches may support:
- maintaining CDS Hooks configuration to direct requests to different REMS Administrator Systems for different drugs
- maintaining SMART app configuration for many REMS Administrators' apps
- maintaining changes to configuration when:
  - new REMS programs are established
  - REMS programs move from one Administrator to another
  - REMS drug identifiers (used to configure CDS Hooks triggers) change or are added due to new new product variations, discontinuation or other reasons

**Intermediary Role.** Approaches may include support for intermediary roles that can provide a single endpoint for multiple drugs and associated REMS programs--potentially addressing configuration challenges noted above.


<p></p>
<p></p>
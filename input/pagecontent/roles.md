### REMS Participants and Roles
Risk Evaluation and Mitigation Strategies (REMS) programs require providers, patients and others to perform certain actions to ensure the safe use of certain high-risk medications. Each of these medications has a REMS Administrator that makes sure these steps are being taken and reports back to the US Food and Drug Administration (FDA). 

#### Human Roles
Below is an outline of those who play a role in the parts of the REMS process currently covered by this guide:
- The **REMS Administrator** is an organization that establishes a program for maintaining safe use of a particular drug with the FDA, and then ensures that patients, prescribers, and others involved in fulfilling the prescription follow REMS program steps. The Administrator:
  - trains and certifies providers to prescribe or dispense the medication
  - shares educational material that providers must share with the patient
  - enrolls the patient into the program, with their agreement to follow safe use guidelines
  - obtains status information and clinical evidence demonstrating that participants are meeting program requirements
  - reports program participation and outcomes to the FDA.
- The **prescriber** or another provider that acts as their agent (e.g., an authorized nurse): 
  - typically receives information about risks associated with the medication from its manufacturer
  - may need to complete training and certification steps with the REMS Administrator to be authorized to prescribe the drug
  - may also need to send the Administrator patient clinical information or assessments at the time of ordering or at later points in the patient's treatment.

  _Note: The guide uses "prescriber" throughout to represent the ordering provider or other authorized party acting on their behalf._
- The **patient:** 
  - receives information or counseling about the risks associated with the medication, actions they need to take to mitigate those risks, symptoms to watch for and report to their provider, etc. The patient may need to formally acknowledge the risks before starting on the medication.

After the prescription is ordered, others participate in REMS steps to fulfill the medication safely. These participants and steps are not addressed in this version of the guide.
- The pharmacist will confirm that enrollment and prescribing steps were completed, and may need to provide education or counseling to the patient, before dispensing the medication.
- A drug distributor may need to follow REMS guidelines when providing the medication to the dispensing pharmacy.
- The patient's insurance company will confirm that REMS steps have been completed before paying for the treatment.

#### System Roles
- The **REMS Administrator** system: 
  - transmits program guidance and requirements to provider systems
  - obtains patient and provider statements and other patient information from prescriber EHRs and using SMART on FHIR apps
  - interacts with other REMS participant systems at pharmacies, drug distributors and payers during activities not currently covered by this guide
- The prescriber's **EHR**:
  - systematically notifies the REMS Administrator and supplies REMS-related information during treatment...
    - prior to the initial medication order
    - after the initial order. Depending on the program, this can include information at the time of re-ordering the drug or periodic treatment information.
- A data exchange **intermediary** may participate in the process on behalf of one or more REMS Administrators. The intermediary may:
  - act as a CDS Server fielding CDS requests related to one or more medications
  - host a SMART app supporting one or more medications
  - perform additional services outside the scope of this guide.

### Participant Needs
This guide supports a set of scenarios involving interaction between prescribers, patients and REMS Administrators. The list below outlines participants' needs, and the [use cases section](use-cases.html) further details the related process scenarios.

* **Prescribers** need to:
  * Register to prescribe a medication covered by a REMS program
  * Enroll a patient in a REMS program so that they can be given the medication
  * Attest to REMS education requirements 
  * Provide periodic patient updates to the REMS administrator 

* **Patients** need to: 
  * Provide or confirm enrollment information
  * Receive relevant documentation 
  * _Provide updates on their experience taking the drug (including reactions or adverse events) or changes to conditions that affect their eligibility to take the drug (such as pregnancy status) [discuss]_ 

* **REMS Administrators** need to: 
  * Supply program certification, education and enrollment materials to prescribers and patients
  * Obtain information and statements from the prescriber and patient during patient enrollment--prior to starting use of the medication
  * Obtain treatment information and assessments from the prescriber _[and patient (discuss)]_ while the patient is taking the medication
  * _Alert prescribers about patient treatment, risks or missed REMS requirements while the patient is taking the medication (discuss)_  

* For certain medications, **Prescribers and REMS Administrators** need to coordinate steps leading to the patient receiving the medication according to the provisions of the REMS program. This may include:
  * the REMS Administrator sharing information about pharmacies that are enrolled in the REMS program and able to dispense the medication
  * scheduling medication fulfillment and administration activities
  * _To be discussed further_

This implementation guide defines FHIR-based approaches that participants in the REMS based workflows described above can use to interact with each other to streamline REMS process.  

_Note regarding existing prescription processes and standards:_ This IG does not redefine the means for transmitting a medication request from the provider to a pharmacy. This activity is currently handled by existing standards and functionality. This guide is focused on the areas that are not handled by or have had inadequate adoption of existing standards. 

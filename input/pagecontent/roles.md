### REMS Participant Roles
Risk Evaluation and Mitigation Strategies (REMS) require providers, patients and others to perform certain actions to ensure the safe use of certain high-risk medications. Each REMS has a REMS administrator that ensures these required actions are being taken. 

#### Human Roles
Below is an outline of those who play a role in the parts of the REMS process currently covered by this guide:
- The **REMS Administrator** is an organization that establishes a REMS program for safe use of a particular drug, and then ensures that patients, prescribers, pharmacists, and others involved in the medication use process follow REMS requirements. The REMS Administrator may be the manufacturer or a third-party vendor working on behalf of the manufacturer, and may perform a variety of functions such the following: 
  - build and operate a centralized database or repository for patient enrollment, prescriber and pharmacy certifications, and wholesaler enrollments 
  - host a website or web portal that participants, such as patients, prescribers, pharmacies, and wholesalers, use to enroll and certify in the program
  - provide the technological means for pharmacies and other dispensers to perform the necessary verifications at the point of dispensing 
  - perform critical functions in the daily operations of a REMS which directly impact patient access to the drug (e.g., REMS contact center)
  - implement training and certification of health care providers to prescribe or dispense the medication
  - ensure that educational material and patient agreements that providers provide and use to counsel patients are available
  - enroll the patient into the REMS, with their agreement to follow safe use conditions
  - obtain patient status information and other clinical information demonstrating that participants are meeting REMS requirements
  - report REMS participation and outcomes to the FDA.

- The **prescriber** (including another provider or staff that acts as the prescriber's agent) may perform a variety of functions at the start of therapy or at later points in the patient's treatment, such the following: 
  - receive information about the REMS drug risks and the REMS requirements from the manufacturer or REMS administrator
  - complete training and other certification steps with the REMS Administrator to be authorized to prescribe the REMS drug
  - counsel patients and facilitate enrollment of the patient into the REMS prior to the start of therapy (such as staff completing a patient enrollment form)
  - provide information to the REMS Administrator on the patient status and other clinical information 
  - perform specified clinical assessments at the start of therapy or at later points in the patient’s treatment.
  
  _Note: The guide uses “prescriber" throughout to represent the health care provider that orders the REMS drug , their staff, or another authorized party acting on their behalf to perform REMS-related activities._
  
- The **patient's** participation in the REMS program may include:  
  - receiving information or counseling about the risks associated with the REMS drug, actions they need to take to use the REMS drug safely (e.g., obtain lab tests),  symptoms to watch for and report to their provider and actions they need to take to mitigate those risks (e.g., decrease dose or stop medication)
  - acknowledging their understanding that their prescriber will enroll them into the REMS prior to the start of therapy
  - providing certain information to their prescriber or the REMS administrator during their treatment.

- The **pharmacist** or another dispensing provider in a certified pharmacy or certified health care setting may perform a variety of functions, such the following:
  - receive information about the REMS drug risks and the REMS requirements from the manufacturer or REMS administrator
  - determine any REMS-related actions that must be taken prior to dispensing it to the patient. This may include verifying the steps that the prescriber or other “upstream" participant has yet to complete (e.g., confirming that patient enrollment and prescribing steps were completed)
  - complete training and other certification steps with the REMS Administrator to be authorized to dispense the REMS (as an individual pharmacist or on behalf of the pharmacy organization) 
  - provide education to the patient or perform other steps required by the applicable REMS 
  - send the REMS Administrator patient prescription or clinical information or assessments at the time of dispensing.
  
  _Note: The guide uses “pharmacist" throughout to represent the dispensing pharmacist, other authorized pharmacy staff, the associated certified pharmacy or health care facility or operating organization._
  
- **Other fulfilling parties** such as a drug distributor or wholesaler may also have responsibilities related to their role in getting a REMS drug to the patient. For example: 
  - a drug distributor may need to ensure that pharmacies and healthcare settings are certified prior to shipping the REMS drug. 
  - the patient’s insurance company will confirm that REMS steps have been completed before paying for the treatment.

  _Note: While the workflows and needs of these parties have not been considered and addressed fully in this implementation guide, their roles may benefit from some of its features, such as the method for checking the status of REMS drug prescriptions that they are helping fulfill._

<p></p>

#### System Roles
- The **REMS Administrator System** may: 
  - transmit program guidance and requirements to Provider Systems
  - obtain patient and provider statements and other patient information from a Provider System (e.g., the prescriber's EHR) and using SMART on FHIR apps
  - interact with REMS participants in ways not currently covered by this guide, including through portals used by REMS participants to access information or enroll in a REMS
- The prescriber's **Provider System,** e.g., an EHR (electronic health record) may:
  - systematically notify the REMS Administrator and supply REMS-related information... 
    - when determining whether to start the patient on the REMS drug
    - at the start of therapy--during ordering
    - during ongoing therapy. Depending on the program, this can include information at the time of re-ordering the drug or periodically providing treatment information to the REMS Administrator
  - enables a standalone, provider-facing REMS Administrator application to access a patient's information with the provider's authorization
  - _[to be discussed]_ enables a non-provider support staff-focused REMS Administrator application to access patient information through predefined system-level authorization in order to assist the patient during enrollment or later in their care journey
  - may periodically check for status of the REMS requirements including those to be performed by the pharmacist or other fulfilling parties.
- The pharmacy information management system (PIMS) other fulfilling party's **fulfiller's system**:
  - may systematically notify the REMS Administrator to check for status of the patient's REMS requirements or supply REMS-related information during fulfillment upon...
    - receiving a REMS drug prescription for an initial dispense or refill
    - receiving a request for some other fulfillment-related action.

<p></p>

#### Intermediary Role
A data exchange intermediary may participate in the process on behalf of one or more REMS Administrators...
  - acting as a CDS Server fielding CDS requests related to one or more REMS drugs
  - hosting SMART apps supporting one or more REMS drugs.

An intermediary that provides a single connecting point for multiple REMS drugs will simplify setup work for the Provider System--reducing the number of different CDS Hooks endpoints and SMART apps that need to be configured to support that set of REMS drugs.

<p></p>

### REMS Participant Needs
This guide supports a set of scenarios involving interaction between prescribers, patients, pharmacists, and REMS Administrators. The list below outlines participants' needs, and the [Use Cases section](use-cases.html) further details the related process scenarios.

* **REMS Administrators** need to: 
  * Supply program certification, education and enrollment materials to prescribers and patients
  * Obtain information and statements from the prescriber and patient during patient enrollment--prior to starting use of the drug
  * Obtain treatment information and assessments from the prescriber _[and patient (discuss)]_ while the patient is taking the drug
  * _Alert prescribers about patient treatment, risks or missed REMS requirements while the patient is taking the drug (* discuss *)_  

* **Prescribers** need to:
  * Enroll to prescribe a drug covered by a REMS
  * Facilitate enrollment of a patient in a REMS program so that they can be given the drug
  * Attest that patient REMS education or other requirements have been completed _[discuss...]_
  * Provide periodic patient updates to the REMS Administrator 
  * Periodically check the status of a patient's REMS requirements including those performed by other parties

* For certain drugs, **Prescribers and REMS Administrators** need to coordinate steps leading to the patient receiving the drug according to the provisions of the REMS. This may include:
  * the REMS Administrator sharing information about pharmacies that are enrolled in the REMS program and able to dispense the drug
  * scheduling drug fulfillment and administration activities
  * _[To be discussed further]_

* **Patients** need to: 
  * Provide or confirm enrollment information
  * Receive relevant documentation or information
  * _Provide updates on their experience taking the drug (including reactions or adverse events) or changes to conditions that affect their eligibility to take the drug (such as pregnancy status) [discuss]_ 

* **Pharmacists and other fulfilling parties** need to:
  * Enroll to participate in a REMS program
  * Attest that patient REMS education or other requirements have been completed _[discuss...]_
  * Periodically check the status of a patient's REMS program requirements including those performed by other parties

This implementation guide defines FHIR-based approaches that participants in the REMS based workflows described above can use to interact with each other to streamline REMS process.  

<p></p>

#### Prescriber focus versus other roles and systems

This initial release of the guide primarily serves the responsibilities of the prescriber of a REMS drug, or another provider acting as an agent of the prescriber. Because of that, the Provider System in the guide's workflows will typically be an EHR, and interactions will most frequently occur in patient encounters when the prescriber is determining whether to treat the patient with the REMS drug, ordering a prescription, or later monitoring the patient's treatment. 

Many EHRs support a subset of CDS Hooks and SMART launch features today, which supports this guide's aim to adopt FHIR features that stakeholders can begin using immediately.

While the prescriber may participate directly in the system flows described in this guide, others may be authorized to perform aspects of the prescriber role on their behalf. A prescriber's agent typically will use the same Provider System as the prescriber, though potentially might interact in the guide's workflows using a different system.

While the IG's initial focus is on the prescriber role, its contributors believe that its guidance may be adaptable to the needs of other REMS stakeholders involved in fulfilling or administering the REMS prescription or otherwise supporting the patient's treatment.

Nothing stated in this guide is intended to preclude other REMS stakeholders from implementing its guidance, and the term, Provider System, used throughout the guide is not limited to representing a prescriber's EHR.

<p></p>

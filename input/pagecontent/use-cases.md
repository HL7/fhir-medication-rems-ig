_See [Participants and Roles](roles.html) for descriptions of the actors and systems referenced in the use cases below_

<p></p>

#### Note Regarding REMS Program and Scenario Variations
REMS programs impose differing requirements on providers and patients. In some cases, patients must enroll in the program and assert their understanding of the potential medication risks and commit to certain behaviors before starting treatment. Other REMS programs are limited to providing educational information to the patient. Others require prescriber training and certification.

Likewise, the needs of a particular treatment situation may differ from others. For example, the applicable REMS program may require providers to train and certify before prescribing the medication, but the particular prescriber previously completed those steps through an offline process.

The scenario descriptions in this section include aspects that won't apply to all REMS programs or treatment situations. The corresponding FHIR approaches are intended to be applied if and when they fit a particular medication's program.

#### System Contexts
The scenarios below may be encountered in two different system contexts, where the provider is either:
- performing a patient care activity using their EHR, during which the EHR connects with the REMS Administrator system to notify it of the care event, provide patient information and/or request program information
- visiting the REMS Administrator's external web application directly--outside of their EHR--and the application retrieves information from the EHR to support its workflow.

This guide recommends initiating exchanges with the REMS Administrator from within the EHR workflow wherever possible--to enable interactions to be triggered based on relevant treatment actions and to avoid the need for the provider to manually navigate to external applications, maintain separate login credentials, etc. 

However, ther

### Prescriber and Patient-Focused System Scenarios
As introduced in [Participants and Roles](roles.html), prescribers and patients need a way to more easily interact with the REMS Administrator during treatment. The following scenarios illustrate how those needs fit into patient care events.


#### Scenario: Prescriber EHR initiates patient enrollment during patient care
During the course of evaluating a patient, the prescriber decides to prescribe a medication that has a REMS program. At an appropriate point in the process (e.g., when the prescriber starts creating the medication request within their EHR, at the start of a related encounter, etc.), it contacts the REMS Administration system using CDS Hooks to supply patient treatment information and learn of any unmet program requirements, for example provider certification or patient enrollment.

The REMS Administrator responds in one or more of the following ways:
- No further program information or requirements need to be shared
- The prescriber must complete REMS program certification before prescribing the medication
- The patient must enroll in a REMS program before starting on the medication
- Additional program information is available
- No REMS program applies to the event

#### Alternative Follow-On Flows
##### Prescriber Certification Required
If the REMS Administrator determines that the prescriber is not currently registered for the REMS program, its CDS Hooks response contains a notification and links to training material and a SMART on FHIR application or other means by which certification can be completed. 

The EHR presents the alert notifying the provider that they will need to certify in the REMS program before the order can be dispensed, along with the supplied information and app links.

If a SMART app link is returned, the prescriber or staff launches returned app from the notification, with data pre-filled from the EHR where available in the prescriber's record. The prescriber reviews the pre-filled data, makes any adjustments required as well as filling in any gaps in the forms and submits the certification information to the REMS Administrator.


##### Patient Enrollment
If the REMS Administrator determines that the patient must enroll in the REMS program, its CDS Hooks response contains a notification and links to patient material and a SMART on FHIR application or other means by which enrollment can be completed. 

The EHR presents the alert notifying the provider that the patient must enroll in the REMS program before they can start the medication, along with the supplied information and app links.

If a SMART app link is returned, the prescriber or staff launches returned app from the notification, with data pre-filled from the EHR where available in the patient's record. The patient reviews the pre-filled data, makes any adjustments required as well as filling in any gaps in the forms and submits the data back to the REMS Administrator to enroll on the REMS program.

##### Additional Program Information Is Available
The REMS Administrator includes links to any additional prescriber or patient-focused materials in its CDS Hooks response, which the EHR presents to the prescriber.

##### REMS Doesn't Apply or No Information Needed
If the REMS Administrator determines that the medication being considered does not have a REMS program, or if all program requirements have been satisfied by the prescriber and patient, it returns a CDS Hooks response indicating that. 

In response, the EHR does not present any alerts or information to the prescriber.

<br/><br/>

#### Scenario Two: Share Information During Patient Treatment  
Upon care events in the patient's treatment, for example when scheduling a follow-up appointment, at the start of an encounter, or at a periodic monitoring interval, the EHR notes that the patient is on a REMS medication and calls the REMS administration system.

The REMS Administrator evaluates the particular event or timing for periodic patient updates and determines whether there is a need for the patient's data to be re-evaluated and responds in one or more of the following ways:
 
- Additional or updated patient clinical information is required, or the prescriber must provide a clinical assessment or status statement
- No additional information is needed

##### Additional Clinical or Status Information is Required
If the REMS Administrator requires patient clinical information or other assessments from the provider, the EHR presents the alert notifying the provider of the needed information.

If a SMART app link is returned, the prescriber or staff launches returned app from the notification, with data pre-filled from the EHR where available in the patient's record. The prescriber reviews, adds any additional information and submits the data back to the REMS Administrator.


##### REMS Doesn't Apply or No Information Needed
If the REMS Administrator determines that the medication being considered does not have a REMS program, or if all program requirements have been satisfied by the prescriber and patient, it returns a CDS Hooks response indicating that. 

In response, the EHR does not present any alerts or information to the prescriber.

<br/><br/>

#### Other Patient-Focused Scenarios
###### Patient Enrollment Via EHR Portal
A provider prescribes a medication that has a REMS for a patient and fills out the required patient enrollment forms. The patient receives a notification to attest that they have received any required education/documentation required by the REMS as well as the accuracy of the information contained on the forms. 

The patient logs into their providers patient portal and launches an application to fill out the required information and submits the results back to the REMS Administration system.

<br/><br/> 

#### HCS/Healthcare institutions
##### Validate Pharmacy is Registered 
A provider prescribes a medication that has a REMS to a patient. The provider asks the patient what their preferred pharmacy is.  Before sending the prescription to the pharmacy, the ERM queries the REMS Administration systems to determine if the pharmacy is enrolled on the REMS if required and can dispense the medication.  The REMS Administration system sends back a notification stating if the pharmacy can dispense the medication.  An alert is displayed in the uI of the EMR if the pharmacy is incapable of dispensing the medication. 

<br/><br/>

_[Frank left off here on Aug 11]_

<br/><br/>

#### Provider/Patient Workflow
The high-level workflow for CRD is envisioned to work as follows:

{::options parse_block_html="false" /}
<figure>
  <img height="300px" src="overview.png" alt="CRD Workflow diagram"/>
  <figcaption><b>    Figure 1: CRD Workflow</b></figcaption>
  <p></p>
</figure>
{::options parse_block_html="true" /}


**1. Clinical action (potentially) needed**<br/>
A healthcare provider decides that a clinical action is needed or wants to explore the coverage ramifications of taking a clinical action.  Possible clinical actions include:
* Admitting a patient or starting a patient visit
* Ordering a drug, device, procedure, etc.
* Choosing when or where an existing order will be performed
* Making a referral or scheduling a future appointment
* Discharging a patient

Based on whether the provider has decided to perform the action or just wishes to explore, they will proceed to 2a or 2b.

**2a. Provider performs EMR action**<br/>
The provider uses an EMR to initiate the clinical action from step #1, entering required information (e.g. a drug, a type of referral or appointment, etc.) into forms provided by the EMR.

**2b. Provider starts 'CRD what-if'**<br/>
The provider uses an EMR to launch a 'What if?' CRD SMART app to explore payer coverage requirements.  The provider indicates the type of action they're considering into the CRD SMART app which prompts for additional information relevant to coverage determination, such as the proposed drug, type of referral or appointment, etc.

**3. Provider checks Payer CRD needs**<br/>
The EMR or CRD SMART app contacts a CRD Server used by their patient's payer to find out what information is required to perform Coverage Requirements Discovery (CRD) - particularly whether the CRD Server requires protected health information (PHI) to evaluate the patient's coverage requirements, or whether the patient's coverage type and the proposed clinical action is enough.  Optionally, the CRD service might provide the EMR with information about configuration options, such as the option to control the types of coverage requirements returned to the user or the number of requirements returned.

Note:
* Different patients will have coverage from different payers and different payers may use different CRD Servers.
* Payer server requirements are expected to be static. The EMR or CRD SMART app may choose to cache information received.
* Modular EMR systems may need to retrieve the coverage type or other information required by the CRD Server from other systems within the provider's environment.

**4. System starts CRD query**<br/>
The EMR (in the background as the provider is typing) or the CRD SMART app (once enough information has been provided) initiates a query to the CRD Server providing the patient's coverage type and/or identity along with information about the proposed clinical action.  The EMR might also provide the CRD Server with one or more of the following:
* a 'token' to allow the CRD Server to temporarily and securely request additional patient information from the EMR in step #5.
* configuration information that indicates the type of information the EMR user is interested in receiving (e.g. whether prior authorization or clinical documentation is required, or products covered or recommended by the plan.

Note:
* Configuration options - received in step #3 - might be managed by the EMR and information provided could be specific to the context of the request, a user role, or an individual user.

**5. (Optional) Payer service gets additional data**<br/>
If additional information is needed to process the query, the CRD Server may use the EMR's secure API, with the temporary access token provided in step #4, to request additional information from the patient's record.  Examples include requests for information needed to assess whether the action is needed (e.g. an allergy to a first line medication, lab result), whether recommended next steps are in place (e.g. follow-up visits scheduled, lab tests ordered to monitor effectiveness/safety), etc.  The CRD Server might submit multiple queries for different types of data to determine coverage requirements.

Note:
* By requesting additional information directly from the EMR, a CRD Server can determine what documentation already exists and what requirements already exist, using that information to make the most accurate assessment possible before providing cards to the user that suggest additional documentation is necessary or prior authorization needs to be requested.  CRD Servers should always attempt to gather what information they can automatically before providing responses that might require human action, such as completing a Questionnaire or launching DTR.

**6. Payer service returns CRD results**<br/>
Based on the information provided/retrieved, the payer system returns guidance to the provider.  The guidance can be in several forms:
* A simple message indicating that service is covered without additional requirements
* A message describing what coverage requirements exist
* A link to external documentation describing coverage requirements to help inform/educate providers (not as a substitute for electronic prior authorization)
* Links to specific forms or templates that need to be completed
* A link to open a SMART application that allows the provider to provide needed information or additional detail to help guide coverage requirements discovery
* Links with recommendations to substitute the planned action with a different action and/or to add additional actions (e.g. proposals to replace a proposed drug to a required first-line treatment or a drug covered by the patient's plan, to add a concurrent medication, additional diagnostic tests, etc.)

Payer requirements might include the need for prior authorization, forms that must be completed, medical documentation that must exist or be provided, recommendations on alternative therapies, etc.

**7. Provider invokes links**<br/>
If the response includes links to additional information or apps, the provider can direct the EMR to interact further with the payer system by retrieving the linked-to information or launching the provided application.
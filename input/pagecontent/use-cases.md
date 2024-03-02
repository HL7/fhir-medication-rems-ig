_See [Participant Roles and Needs](roles.html) for descriptions of the actors and systems referenced in the use cases below_

<p></p>

### Use Case Context
The use case scenarios described in this section reflect a range of REMS program requirements and treatment situations and two different system contexts, as described below.

#### REMS Program Requirements and Variations
REMS requirements for providers, patients and other participants differ by drug:
- In some cases, patients must enroll in the program and assert their understanding of the potential medication risks and commit to certain behaviors before starting treatment. 
- Other REMS programs are limited to providing educational information to the patient. 
- Some, but not all, REMS programs require prescribers or pharmacists to complete training and enrollment steps before treating a patient with the drug.
- Some REMS programs require labs or other diagnostics to be performed prior to or during treatment.
- REMS programs require varying levels of coordination with the REMS Administrator on treatment activities.

In addition, real world treatment situations can differ due to other factors. For example: 
- One prescriber may complete their training and enrollment for a REMS program through an offline process in advance of treating patients with the drug, versus another prescriber that learns of the enrollment requirement while prescribing the drug the first time
- REMS requirements that apply when starting the patient's initial therapy may or may not be required during subsequent rounds of therapy.

As a result, the scenario descriptions in this section will include aspects that don't apply to all REMS programs or treatment situations. The guide's FHIR approaches are intended to be applied if and when they fit a particular medication's program and applicable workflow conditions.

#### Provider System Contexts - Within the Provider System Workflow vs Standalone REMS Administrator App
The scenarios below may be encountered in two different system contexts, where the provider is either:
- performing a patient care activity using their Provider System (e.g., their EHR), during which the Provider System connects with the REMS Administrator System to notify it of the care event, provide patient information and/or request program information
- visiting the REMS Administrator's external web application directly--outside of their Provider System--and the application retrieves information from the Provider System to support its workflow.

#### Recommendation: Interaction Within the Provider System Workflow
This guide recommends initiating exchanges with the REMS Administrator System from within the Provider System workflow wherever possible--to enable interactions to be triggered based on relevant treatment actions and to avoid the need for the provider to manually navigate to external applications, maintain separate login credentials, etc. 

However, there are situations where starting therapy with a REMS drug may involve steps prior to the provider entering the Provider System's order flow or where it may otherwise not be possible to initiate exchange with the REMS Administrator System based on Provider System activities. In these cases, the interaction may be initiated from an external REMS Administrator App using standalone SMART app launch.

<p></p>

### Scenario One: Prescriber and REMS Administrator interact from within the provider system workflow
When seeing a patient, the prescriber decides to prescribe a medication that has a REMS program. At an appropriate point in the workflow (e.g., when the prescriber starts creating the medication order, at the start of a related encounter, etc.), the provider system connects with the REMS Administrator system and enables the prescriber to interact with it. 

At the start of this interaction, the provider system supplies patient, provider and medication information to the REMS Administrator. 
- This step is accomplished using a CDS Hooks call triggered by an appropriate "hook" event in the provider workflow such as "order-select". 
- "Prefetch" data containing Practitioner, Patient and MedicationRequest FHIR resources is included in the request.

<p></p>

Depending on the drug and other variables described in the previous section, the REMS Administrator system may respond in a variety of ways, including but not limited to the following (using CDS response "cards" or "system actions").

<p></p>

Following the REMS Administrator's response, the provider system presents returned alerts to the prescriber and enables them to follow links to external information or to launch a returned SMART app to complete a step such as patient enrollment.

If a SMART app link is returned, the prescriber or staff launches returned app from the notification, with data pre-filled from the Provider System where available in the patient's or prescriber's records as applicable. The prescriber reviews the pre-filled data, makes any adjustments required as well as filling in any additional required information and completes the app's steps.

Below are possible response variations. 

<p></p>

#### Notify the prescriber they must complete REMS program training or enrollment before prescribing the medication
And optionally...

  - provide a URL to an external enrollment portal or training material
  - provide a SMART app in which the prescriber enrolls (presented within their provider system's workflow)
    
#### Indicate that the patient is not eligible for the proposed therapy
In addition, the response may include a URL link to additional related information

####  Alert the provider of patient requirements, which may include education or enrollment into the REMS program
Optionally include...
  - a URL where education or other info can be found
  - a SMART app in which to complete the patient's enrollment

#### Request additional information to satisfy a REMS requirement, such as a lab result
Optionally:
  - Request a lab or diagnostic order using a "recommendation" card
  - Request additional info using a SMART app

#### Supply patient REMS program information
The REMS Administrator may return information about the patient's participation in the REMS program to be saved to the patient's record in the provider system. This can be accomplished using a CDS "system action" that saves a note containing the information in the form of a FHIR DocumentReference.

#### Return a "silent" response
If the REMS Administrator does not wish to present any information or requests to the prescriber, it may return an empty response. In this scenario, the provider system will not interrupt the provider's workflow with REMS-related information.

#### Return other alerts or information as needed
This implementation guide does not constrain information or requests that a REMS Administrator may return in its CDS Hooks response. Other alerts, resources or information gathering steps may be implemented, as needed.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow - Examples</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>

### Scenario Two: Provider using an external REMS Administrator application
In this variation, the provider accesses an external REMS Administrator application from outside the Provider System. In a process facilitated by the provider, the external application retrieves patient, provider and medication information from the Provider System using [standalone SMART launch](https://hl7.org/fhir/smart-app-launch/STU2.1/app-launch.html#launch-app-standalone-launch).

During that application's workflow: 
- The provider selects the Provider System used in the facility where the provider sees the patient
- The external REMS Administrator system initiates the "standalone SMART app launch" process with the selected provider system
- The provider interacts with the provider system during launch, signing in and optionally, locating the patient 
- The provider system grants the external system access to appropriate patient data
- The external system retrieves patient, provider, medication and other clinical information as needed to support the associated REMS program.
 - Using the retrieved information, the external REMS Administrator system may:
   - determine the patient's eligibility for treatment using the drug
   - update its existing patient enrollment or initiate a new enrollment
   - determine if additional REMS steps or information is needed from the provider
   - share current patient REMS IDs, authorizations, status or other information with the provider system.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow - Examples</strong></figcaption>
  <p>
  <img src="standalone-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>


### Scenarios not covered in this guide
Support for the following scenarios is not included in this version of the implementation guide. They may be covered in future versions.

##### Patient Enrollment Via Patient-Directed Portal
A provider prescribes a medication that has a REMS for a patient and fills out the required patient enrollment forms. The patient receives a notification to attest that they have received any required education/documentation required by the REMS as well as the accuracy of the information contained on the forms. 

The patient logs into their providers patient portal and launches an application to fill out the required information and submits the results back to the REMS Administration system.

<p></p>

#### HCS/Healthcare institutions
##### Validate Pharmacy is Registered 
A provider prescribes a medication that has a REMS to a patient. The provider asks the patient what their preferred pharmacy is.  Before sending the prescription to the pharmacy, the ERM queries the REMS Administration systems to determine if the pharmacy is enrolled on the REMS if required and can dispense the medication.  The REMS Administration system sends back a notification stating if the pharmacy can dispense the medication.  An alert is displayed in the uI of the EMR if the pharmacy is incapable of dispensing the medication. 

<p></p>
<p></p>

<hr>

### Additional content to be incorporated
_The material below is yet to be incorporated into this page._


#### Provider/Patient Workflow

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
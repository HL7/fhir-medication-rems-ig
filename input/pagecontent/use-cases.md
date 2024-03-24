### Use Case Background

REMS programs vary widely with respect to the steps and requirements they impose on the patient and providers, as described below. Because different drugs' programs impact patient care activities in different ways and at different steps, this guide doesn't attempt to describe a fixed set of use case scenarios that cover all variations. Instead, it defines basic patterns for interaction between a Provider System and REMS Administrator System that can be applied at multiple points in treating a patient with a REMS drug.

Before reading this section, it will be helpful to review [Participant Roles and Needs](roles.html) for descriptions of the actors and systems referenced below, and [REMS Steps and Terminology](process.html) for an overview of how REMS steps might fit into a given patient's care.

<p></p>

### Variations Across REMS Programs
REMS requirements for providers, patients and other participants vary considerably between drugs, based on the nature of the risk each drug presents and other aspects of its use. For example:
- Some REMS programs include an enrollment step where the patient confirms their understanding of the risks associated with the drug and commits to certain behaviors before starting treatment. 
- Other REMS programs are limited to providing educational information to the patient. 
- Some, but not all, REMS programs require prescribers or pharmacists to complete training and enrollment steps before treating a patient with or dispensing the drug.
- Some REMS programs require labs or other diagnostics to be performed prior to or during treatment.
- REMS programs require varying levels of coordination with the REMS Administrator on treatment activities.

In addition, real world treatment situations for individual patients will differ due to other factors. For example: 
- One prescriber may complete their training and enrollment for a REMS program through an offline process in advance of treating patients with the drug, versus another prescriber that learns of the enrollment requirement while writing their first prescription for the drug.
- REMS requirements that apply when starting the patient's initial therapy may or may not be required during subsequent rounds of therapy.

As a result, the scenario descriptions in this section will include aspects that don't apply to all REMS programs or treatment situations. The guide's FHIR approaches are intended to be applied if they fit a particular drug's program and applicable workflow conditions.

<p></p>

### Provider System Contexts
This guide supports scenarios encountered in two different system contexts, where the provider is either:
- **within the Provider System workflow,** performing a patient care activity using their Provider System (e.g., their EHR), during which the Provider System connects with the REMS Administrator System to notify it of the care event, provide patient information and/or request program information
- **visiting an external REMS Administrator web application** outside of the workflow of their Provider System--and the application retrieves information from the Provider System to support its workflow.

The interaction options differ between these contexts, and each can be useful.

<p></p>

#### Interaction Within the Provider System Workflow
This guide recommends initiating exchanges with the REMS Administrator System from within the Provider System workflow wherever possible--to enable interactions to be triggered based on relevant treatment actions and to avoid the need for the provider to manually navigate to external applications, maintain separate login credentials, etc. 

However, there are situations where starting therapy with a REMS drug may involve steps prior to the provider entering the Provider System's order flow or where it may otherwise not be possible to initiate exchange with the REMS Administrator System based on Provider System activities. In these cases, the interaction may be initiated from an external REMS Administrator App using standalone SMART app launch.

<p></p>

### Use Case One: Prescriber and REMS Administrator Interact from Within the Provider System Workflow
When seeing a patient, the prescriber decides to prescribe a drug, and is alerted by the Provider System that the drug has a REMS program. At an appropriate point in the workflow (e.g., when the prescriber starts creating the medication order, at the start of a related encounter, etc.), the Provider System connects with the REMS Administrator System and enables the prescriber to interact with it. 

At the start of this interaction, the Provider System supplies patient, provider and medication information to the REMS Administrator. 
- This step is accomplished using a CDS Hooks call triggered by an appropriate "hook" event in the provider workflow such as "order-select". 
- "Prefetch" data containing Practitioner, Patient and MedicationRequest FHIR resources is included in the request.

Depending on the drug and other variables described in the previous section, the REMS Administrator System responds to the CDS Hooks request with information about the REMS program, a [SMART app](https://www.hl7.org/fhir/smart-app-launch) to gather needed information, alerts about steps the prescriber must take before ordering the drug, etc. 

The Provider System then presents the returned information, gives the prescriber the option to open the REMS Administrator's SMART app (if one was returned) or to place the app into their work queue to launch later. When the provider launches the SMART app, it first retrieves information that it needs from the patient record in the Provider System--reducing manual data entry for the provider. The prescriber reviews the pre-filled data, makes adjustments as needed, and then completes any other app steps.

Note that in some situations, the REMS Administrator will have no information or requests to return. For example, the REMS Administrator may determine that there are no unmet REMS requirements to be addressed at the time of the interaction. In this case, the Provider System will receive an empty response and allow the prescriber's workflow to continue without interruption. 

<p></p>

**Use Case One Scenarios**

Below are possible response scenarios (which are detailed further in [this section of the IG](specification.html#interaction-initiated-by-the-provider-system-during-the-providers-workflow)). Note that at a given point in a patient's care, more than one of these might apply.

<p></p>

#### The prescriber must complete REMS program training or enrollment before prescribing the drug

In this scenario, the REMS Administrator notifies the provider of the need and may...

  - provide a URL to an external enrollment portal or training material
  - provide a SMART app in which the prescriber enrolls (presented within their Provider System's workflow)
    
#### The patient is not eligible for the proposed therapy

If the patient's information indicate that treatment with the proposed drug is not appropriate, the REMS Administrator alerts the provider and optionally provides a URL link to additional related information.

####  The patient must complete REMS enrollment or other requirements

The REMS Administrator alerts the provider to patient requirements that must be met before proceeding with treatment, such as education or enrollment. The Administrator may optionally include...
  - a URL where education or other info can be found
  - a SMART app in which to complete the patient's enrollment

#### Information is required to satisfy a REMS requirement

The REMS Administrator may request information required to meet REMS program requirements, such as a lab result or patient status information.

Along with notifying the provider of the need, the REMS Administrator may optionally:

  - Search for the needed information in the patient record within the Provider System, using permissions given in the CDS request
  - Propose a lab or diagnostic order to meet the requirement (using a CDS Hooks "suggestion" card)
  - Request additional info using a SMART app

#### The REMS Administrator has information that can be stored in the Provider System

The REMS Administrator may return information about the patient's participation in the REMS program to be saved to the patient's record in the Provider System. 

- This can be accomplished using a CDS `systemAction` that saves a note containing the information in the form of a FHIR DocumentReference.

#### The REMS Administrator has no information to return
If the REMS Administrator does not wish to present any information or requests to the prescriber, it may return an empty response. In this scenario, the Provider System will not interrupt the provider's workflow with REMS-related information.

#### The REMS Administrator has other alerts, information or steps

The REMS Administrator may recognize the opportunity to share other information or request other actions beyond those described above.

This implementation guide does not constrain information or requests that a REMS Administrator may return in its CDS Hooks response. Other alerts, resources or information gathering steps may be implemented, as needed.

<p></p>

### Use Case Two: Provider Using an External REMS Administrator Application

In this variation, the provider accesses an external REMS Administrator application from outside the Provider System workflow. In a process facilitated by the provider, the external application retrieves patient, provider and drug information from the Provider System using [standalone SMART launch](https://hl7.org/fhir/smart-app-launch/STU2.1/app-launch.html#launch-app-standalone-launch).

During that application's workflow:
- The provider opens a web browser that is not part of the Provider System and navigates to the REMS Administrator's web site 
- On a web page on the REMS Administrator's site, the provider indicates the Provider System used in the facility where the provider treats the patient
- The external REMS Administrator System initiates the "standalone SMART app launch" process with the selected Provider System
- The provider interacts with the Provider System during launch, signing in and optionally, locating the patient 
- The Provider System grants the external system access to appropriate patient data
- The external system retrieves patient, provider, drug and other clinical information as needed to support the associated REMS program.
 - Using the retrieved information, the external REMS Administrator System may:
   - determine the patient's eligibility for treatment using the drug
   - update its existing patient enrollment or initiate a new enrollment
   - determine if additional REMS steps or information is needed from the provider
   - share current patient REMS IDs, authorizations, status or other information with the Provider System.

<p></p>
<p></p>

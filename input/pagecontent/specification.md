### Pre-reading
Before reading this formal specification, implementers are encouraged to first familiarize themselves with other key portions of this implementation guide:

* The [Participant Roles and Needs](roles.html) section overviews the real world people and organizations who participate in REMS programs and defines the system roles referenced in the specification below.

* The [REMS Steps and Terminology](process.html) and [Use Cases](use-cases.html) sections describe the process context and goals behind the interactions defined below

* The [Technical Background](technical-background.html) page identifies related specifications that this guide depends on. 


### Conformance Conventions
This implementation guide uses the following terms to set expectations for implementers to conform to specific behaviors and information content it defines:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which could result in interoperability issues or sub-optimal behavior if not adhered to), but which are not strictly required for an implementation to be considered conformant to this version of the guide.

* **MAY** describes optional behaviors that implementers are free to consider but where there is no recommendation for or against adoption.

<p></p>

### Provider System and REMS Administrator System Interactions

This implementation guide establishes two basic interaction patterns between a Provider System and REMS Administrator System that can be applied at multiple points in treating a patient with a REMS drug:
- interaction initiated by the Provider System during the provider's workflow
- a provider using an external REMS Administrator application that accesses patient data in the Provider System using standalone SMART app launch--to provide a transitional bridge for REMS provider portals that exist today, and for circumstances where interaction with the REMS Administrator may more naturally occur within its external system.

#### Interaction initiated by the Provider System during the provider's workflow
This interaction is initiated by the Provider System during the provider's workflow, using CDS Hooks and, optionally, EHR-based SMART App Launch. 

- Provider Systems **SHALL** support this interaction approach because it offers the greatest opportunity to raise and address REMS requirements when related care activities occur. 
- REMS Administrators **SHOULD** implement this interaction approach.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>

#### Interaction between an external REMS Administrator application and the Provider System
In this interaction, a provider uses an external REMS Administrator application that accesses patient data in a Provider System using standalone SMART app launch. 

- Provider Systems **SHALL** support this interaction approach to provide a transitional bridge from REMS Administrator portals that exist today or for circumstances where interaction with the REMS Administrator may more naturally occur within its external system. 
- REMS Administrators **MAY** support this interaction approach.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Interactions with a Standalone SMART App - Examples</strong></figcaption>
  <p>
  <img src="standalone-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>

#### CDS Hooks and SMART App Launch patterns may be applied at multiple points in a patient's care

The guide does not strictly require that either of these patterns be implemented at particular workflow events. Implementers are free to choose when and how they apply these interactions. However, implementers **SHOULD** support these interactions whenever possible to:

- notify the provider that a REMS program exists for a drug being considered or ordered
- alert the provider of unmet REMS requirements 
- provide information to educate the provider or patient, or assist with their REMS responsibilities 
- enroll the patient into the REMS program at the earliest opportunity
- make the provider aware of REMS requirements or information needs during the course of treatment
- supply the REMS Administrator with needed patient, provider or treatment information electronically from the Provider System--without human intervention--where possible, to reduce the burden on participants and prevent care delays
- and save REMS Administrator-supplied information about the patient's participation in the REMS program to the patient's record in the provider system.

In particular, this guide strongly recommends leveraging the CDS Hooks and SMART app launch workflow at the start of the patient's therapy to raise patient enrollment requirements and enable them to be completed quickly--minimizing manual data entry and preventing a possible delay in treatment. 

<p></p>

#### Support for immediate provider actions in response to a REMS Interaction

Many EHRs support a subset of CDS Hooks and SMART launch features today to bring alerts and information into the prescriber's workflow at appropriate times--to be acted upon immediately. 

The guide makes use of these features to notify the prescriber of pertinent REMS information, for example that there's a REMS program for a drug being considered or that the prescriber's REMS enrollment has lapsed. The provider's response in these situations may be to simply acknowledge the information before continuing with their workflow.

A provider may also take the opportunity to complete a REMS requirement returned in a CDS Hooks response immediately through use of a SMART app. Use of the guide's patterns can minimize the time needed from the provider in such a circumstance--to complete a patient enrollment form, for example--by the REMS Administrator prefilling or hiding questions that were satisfied by data provided in the preceding CDS Hooks interaction. 

Provider Systems **SHALL** support immediate provider responses to Cards returned .

<p></p>

#### Support for deferred SMART app launch

In other cases, a provider action may not be able to be completed immediately upon receiving it in a CDS Hooks response, and instead may need to be deferred until a later time. The guide leverages an approach where the REMS Administrator's CDS Hooks response includes a `recommendation` Card containing a Task resource enabling the provider to launch the indicated SMART app later, as described in the [CDS Hooks Card Profiles section](cds-cards.html#deferred-smart-application-launch).

Provider Systems **SHOULD** support `recommendation` cards with associated `actions` to defer the launch of SMART application.

<p></p>

#### Enabling the provider system user to manually launch the SMART app

In some situations, it may be helpful for the prescriber or other provider assisting in the care of a REMS patient to manually launch the associated REMS Administrator SMART app, independent of a CDS Hooks interaction. 

Provider Systems and REMS Administrators **MAY** support manual launch of the REMS Administrator SMART application.

When a Provider System provides this support, it **SHALL** provide patient context during launch.

<p></p>

#### Support for saving REMS information to the patient's record

The REMS Administrator **MAY** save information about the patient's REMS participation to the Provider System's patient record. 

Provider Systems can enable the REMS Administrator to save patient-related REMS information to the patient's record as a FHIR DocumentReference using two approaches included in the patterns described in this guide:
- the REMS Administrator writes the information to the patient's record during the provider's use of its SMART app
- The REMS Administrator's CDS Service returns a card and system action which saves the information in response to a CDS Hooks call.

In either approach, the REMS Administrators **SHOULD** follow [US Core DocumentReference guidance](https://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) when creating this resource. 

In addition to the US Core requirements, this guide recommends populating DocumentReference.type with the LOINC value `51851-4` (Administrative note).

See an [example DocumentReference](DocumentReference-example-rems-docref-1.html) that illustrates this guidance.

<p></p>

**REMS Administrator's SMART app saving information to the patient's record** 

Saving of REMS information is typically most effective during the provider’s interaction with a SMART app because it can be timed to occur after activities that might change the patient's status or information--for example by completing patient enrollment. 

To enable this to occur, the Provider System **SHOULD** authorize a REMS Administrator's SMART app with sufficient OAuth scopes to enable the app to create a DocumentReference resource associated to the patient. [This guidance in the SMART App Launch IG](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html) provides details for assigning scopes during app launch.

<p></p>

**Saving patient status using CDS Hooks.** Information could also potentially be saved to the provider system during a CDS Hooks interaction, with the REMS Administrator returning a CDS Hooks Card containing a `systemAction` of the type, `create`, with the information in the form of a FHIR DocumentReference. The DocumentReference would, in turn, be created within the Provider System.

However, it may be premature to save information at this point in the workflow if the provider's subsequent actions in a SMART app could change the status of REMS activities, for example if the provider is able to enroll the patient or satisfy another REMS requirement using the app .

Provider Systems **MAY** support this use of a CDS Hooks `systemAction`.

<p></p>

### Data Exchange During CDS Hooks Interactions
<p></p>

The REMS Administrator will typically need information about the patient, provider and medication to support a REMS interaction, regardless of the REMS program or point in the patient's care.

But individual programs may require sharing additional patient clinicals or other info with the REMS Administrator as part of the Hooks interaction so that it can determine how best to respond.

<p></p>

#### Prefetch

Supplying a consistent set of FHIR resources in the CDS Hooks request is needed to provide sufficient context to enable the REMS Administrator to respond--regardless of the medication or situation.

Provider Systems and REMS Administrators **SHALL** support exchange of the following FHIR resources in CDS Hooks requests:
  - **Practitioner**, to identify the provider participating in the triggering event
  - **Patient** 
  - **MedicationRequest** (draft or completed) for the REMS drug being considered or ordered

_To do: Add prefetch definition JSON_

<p></p>

### Query During CDS Hooks
- In addition, the provider system is expected to provide sufficient authorization during the CDS Hooks exchange to enable the REMS Administrator to retrieve related patient information including...
  - lab results
  - vital signs
  - conditions
  - concurrent and past medications
  - procedures
  - etc. 

Provider Systems **SHALL** enable the REMS Administrator to query for additional patient clinical or other information during the CDS exchange, for example to retrieve lab results or other diagnostics specific to a REMS drug program

<p></p>
  
### Security and Privacy

#### FHIR Privacy and Security Guidance
Implementers are expected to...
- follow core [FHIR security principles](https://www.hl7.org/fhir/security.html).
 
- protect patient privacy as described in [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html).

<p></p>
  
### REMS Workflow-Related Privacy and Security

Provider Systems and REMS Administrators **SHALL** follow guidance defined in...
- the CDS Hooks [Security and Safety](https://cds-hooks.hl7.org/2.0/#security-and-safety) section
- SMART App Launch authentication using either [asymmetric (public key)](https://hl7.org/fhir/smart-app-launch/client-confidential-asymmetric.html) or [symmetric (shared secret)](https://hl7.org/fhir/smart-app-launch/client-confidential-symmetric.html) methods.
- 
<p></p>
<p></p>



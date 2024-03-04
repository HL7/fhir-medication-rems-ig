### General Implementer Guidance
#### CDS Hooks and SMART App Launch patterns may be applied at multiple points in a patient's care

This implementation guide focuses on two basic interaction patterns between a Provider System and REMS Administrator System that can be applied at multiple points in treating a patient with a REMS drug:
- interaction initiated by the Provider System during the provider's workflow, using CDS Hooks and EHR-based SMART App Launch

and

- a provider using an external REMS Administrator application that accesses patient data in the Provider System using standalone SMART app launch--to provide a transitional bridge for REMS provider portals that exist today, and for circumstances where interaction with the REMS Administrator may more naturally occur within its external system.

The guide does not strictly require that either of these patterns be implemented at particular workflow events. Implementers are free to choose when and how they apply these interactions. However, the guide recommends using these approaches to:

- notify the provider that a REMS program exists for a drug being considered or ordered
- alert the provider of unmet REMS requirements 
- provide information to educate the provider or patient, or assist with their REMS responsibilities 
- enroll the patient into the REMS program at the earliest opportunity
- make the provider aware of REMS requirements or information needs during the course of treatment
- supply the REMS Administrator with needed patient, provider or treatment information electronically from the Provider System--without human intervention--where possible, to reduce the burden on participants and prevent care delays
- and save REMS Administrator-supplied information about the patient's participation in the REMS program to the patient's record in the provider system.

In particular, this guide strongly recommends leveraging the CDS Hooks and SMART app launch workflow at the start of the patient's therapy to raise patient enrollment requirements and enable them to be completed quickly--minimizing manual data entry and preventing a possible delay in treatment. 

<p></p>

#### Prescriber Focus and Other Roles and Systems

This initial release of the guide primarily serves the responsibilities of the prescriber of a REMS drug, or another provider acting as an agent of the prescriber. Because of that, the Provider System in the guide's workflows will typically be an EHR, and interactions will most frequently occur in patient encounters when the prescriber is determining whether to treat the patient with the REMS drug, ordering a prescription, or later monitoring the patient's treatment. 

Many EHRs support a subset of CDS Hooks and SMART launch features today, which supports this guide's aim to adopt FHIR features that stakeholders can begin using immediately.

While the prescriber may participate directly in the system flows described in this guide, others may be authorized to perform aspects of the prescriber role on their behalf. A prescriber's agent typically will use the same Provider System as the prescriber, though potentially might interact in the guide's workflows using a different system.

While the IG's initial focus is on the prescriber role, its contributors believe that its guidance may be adaptable to the needs of other REMS stakeholders involved in fulfilling or administering the REMS prescription or otherwise supporting the patient's treatment.

Nothing stated in this guide is intended to preclude other REMS stakeholders from implementing its guidance, and the term, Provider System, used throughout the guide is not limited to representing a prescriber's EHR.

<p></p>

#### Support for Immediate Provider Actions in Response to REMS Interactions  

Many EHRs support a subset of CDS Hooks and SMART launch features today to bring alerts and information into the prescriber's workflow at appropriate times--to be acted upon immediately. 

The guide makes use of these features to notify the prescriber of pertinent REMS information, for example that there's a REMS program for a drug being considered or that the prescriber's REMS enrollment has lapsed. The provider's response in these situations may be to simply acknowledge the information before continuing with their workflow.

A provider may also take the opportunity to complete a REMS requirement returned in a CDS response immediately through use of a SMART app. Use of the guide's patterns can minimize the time needed from the provider in such a circumstance--to complete a patient enrollment form, for example--by the REMS Administrator prefilling or hiding questions that were satisfied by data provided in the preceding CDS Hooks interaction. 

<p></p>

#### Support for Deferred Provider Responses

In other cases, the provider response to a REMS interaction may not be able to be completed immediately upon receiving it in a CDS Hooks response, and instead may need to be deferred until a later time. The guide leverages an approach defined in the [SMART App Launch specification](https://hl7.org/fhir/smart-app-launch/task-launch.html) where the REMS Administrator's CDS Hooks response includes a Task resource and system action enabling the provider to launch the indicated SMART app later.

<p></p>

### Relationship to Da Vinci Burden Reduction IGs
Certain interactions between participants in the REMS process are similar to the provider / payer interactions described in the Da Vinci "Burden Reduction" IGs:

- [Coverage Requirements Discovery \(CRD\)](https://hl7.org/fhir/us/davinci-crd)
- [Documentation Templates and Rules \(DTR\)](https://hl7.org/fhir/us/davinci-dtr/)

This guide aims to be consistent where possible with FHIR conventions set in related implementation guides, and this section describes how approaches used in this guide relate to those employed in the Burden Reduction guides.


#### Use of CDS Hooks

The Da Vinci CRD Implementation Guide was used as the basis for this guide's [guidance on using CDS Hooks response Cards](cds-cards.html), with the goal of being as consistent as possible with the CRD IG's direction while providing direction that is tailored specifically to REMS workflows. The Card examples were minimally adjusted from examples in the CRD IG, only to the extent needed to illustrate REMS-related alerts, documentation and actions rather than the coverage-related information returned in CRD's scenarios. 

Note that the Da Vinci CRD specification outlines additional return types that are related to filling out forms using FHIR Questionnaires.  While there are no examples provided here, there is nothing within this specification that precludes the use of that return type for a REMS workflow.


#### Documentation Templates and Rules (DTR)
...

<p></p>


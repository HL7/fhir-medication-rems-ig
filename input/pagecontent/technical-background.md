### CDS Hooks

This guide makes use of the CDS Hooks standard, which enables interactions between the Provider System and REMS Administrator System to be initiated based on events within the provider's workflow.

Implementers are to refer to the [CDS Hooks specification](https://cds-hooks.hl7.org/2.0) for general guidance. This guide provides additional REMS-specific usage direction to be applied in addition to the base CDS Hooks standard. 

<p></p>

### SMART on FHIR Application Launch

This guide bases its approach for integrating REMS Administrator applications into the provider workflow on the [SMART App Launch specification](https://hl7.org/fhir/smart-app-launch).

Implementers are to refer to that implementation guide for general guidance related to [EHR-based app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch), [standalone app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-standalone-launch) and [deferred launch of a SMART app provided in a CDS Hooks response](https://hl7.org/fhir/smart-app-launch/task-launch.html). 

This guide provides additional REMS-specific usage direction to be applied in addition to the base SMART App Launch specification. 

<p></p>

### US Core Profiles

Resources not profiled in this implementation guide that are exchanged as part of a REMS Interaction **SHOULD** conform to [US Core profiles](https://www.hl7.org/fhir/us/core/profiles-and-extensions.html) where applicable profiles exist. 

These include, but are not limited to, the FHIR resources included in the prefetch content submitted with a CDS Hooks request:

- [Patient](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-patient.html)
- [Practitioner](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-practitioner.html)
- [MedicationRequest](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-medicationrequest.html)
- [Medication](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-medication.html)

... as well as the [DocumentReference](https://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) containing patient REMS information returned by the REMS Administrator in a CDS Hooks response.

<p></p>

### Consistency with the Da Vinci Burden Reduction IGs

This guide aims to be consistent in its guidance with other FHIR implementation guides likely to be implemented by REMS stakeholders. 

Certain interactions described in this guide are similar to the provider / payer interactions defined in the [Da Vinci Coverage Requirements Discovery \(CRD\) IG](https://hl7.org/fhir/us/davinci-crd).

In particular, the Da Vinci CRD Implementation Guide was used as the basis for this guide's [guidance on using CDS Hooks response Cards](cds-cards.html), with the aim of being as consistent as possible with the CRD IG's direction while providing guidance tailored specifically to REMS workflows. 

The Card examples were minimally adjusted from examples in the CRD IG, only to the extent needed to illustrate REMS-related alerts, documentation, and actions rather than the coverage-related information returned in CRD's scenarios. 

Note that the Da Vinci CRD specification outlines additional return types beyond those called out in this IG related to use of FHIR Questionnaires and for other payer-related purposes. While this guide does not identify analogous REMS uses for these response types, there is nothing within this specification that precludes their use within a REMS workflow.

<p></p>
<p></p>




<p></p>
<p></p>

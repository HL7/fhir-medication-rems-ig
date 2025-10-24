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
- [QuestionnaireResponse](https://www.hl7.org/fhir/us/core/StructureDefinition-us-core-questionnaireresponse.html)

... as well as the [DocumentReference](https://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) containing patient REMS information returned by the REMS Administrator in a CDS Hooks response.

Other resources not included in the US Core profiles:

- [HealthcareService](https://hl7.org/fhir/R4/healthcareservice.html) used to identify information about the Pharmacy when sending a CDS Hook to the REMS Administrator.
- [Questionnaire](https://hl7.org/fhir/R4/questionnaire.html)

<p></p>

### FHIR Operations

Several of the interactions that this guide defines make use of FHIR Operations. FHIR Operations extend the capability of a FHIR server beyond the simple [RESTful API](https://www.hl7.org/fhir/http.html) operations of Create, Read, Update, Delete acting on single FHIR Resources. Operations allow the user to complete actions with more complex logic and with more complicated inputs and outputs.

Implementers are to refer to the [Extended Operations](https://www.hl7.org/fhir/operations.html) section of the FHIR documentation. This outlines the capabilities and how they are defined.

<p></p>

### Consistency with the Da Vinci Burden Reduction IGs

This guide aims to be consistent in its guidance with other FHIR implementation guides likely to be implemented by REMS stakeholders. 

#### CRD - Coverage Requirements Discovery

Certain interactions described in this guide are similar to the provider / payer interactions defined in the [Da Vinci Coverage Requirements Discovery \(CRD\) IG](https://hl7.org/fhir/us/davinci-crd).

In particular, the Da Vinci CRD Implementation Guide was used as the basis for this guide's [guidance on using CDS Hooks response Cards](cds-cards.html), with the aim of being as consistent as possible with the CRD IG's direction while providing guidance tailored specifically to REMS workflows. 

The Card examples were minimally adjusted from examples in the CRD IG, only to the extent needed to illustrate REMS-related alerts, documentation, and actions rather than the coverage-related information returned in CRD's scenarios. 

Note that the Da Vinci CRD specification outlines additional return types beyond those called out in this IG related to use of FHIR Questionnaires and for other payer-related purposes. While this guide does not identify analogous REMS uses for these response types, there is nothing within this specification that precludes their use within a REMS workflow.

#### DTR - Documentation Templates and Rules

Interactions with SMART Applications and form completion described in this guide are similar to the provider / payer interactions defined in the [Da Vinci Documentation Templates and Rules \(DTR\) IG](https://hl7.org/fhir/us/davinci-dtr/). This was done with the aim to maintain compatibility where possible with only changes that were necessary to support the differing requirements of REMS workflows.

Note that the Da Vinci DTR specification outlines different methods to achieve their goals with shared SMART on FHIR applications and native EHR support. These capabilities are optional within this guide as the REMS Administrators can implement their own applications with or without the use of FHIR Questionnaires and CQL (Clinical Quality Language).

The Prescriber Intermediaries **SHOULD** implement a Shared SMART on FHIR application that can be used with any REMS Administrator. This will reduce the burden on REMS Administrators to register their own applications with every EHR. The Shared SMART App uses the same methods as DTR to retrieve Questionnaires and CQL using the `$questionnaire-package` FHIR Operation. The REMS Administrators **SHOULD** likewise implement the operation and make any forms or documents available to be completed by the clients, including Provider and Patient, using this shared method.

<p></p>

### CQL - Clinical Quality Language

This guide makes use of the Clinical Quality Language (CQL) for querying and pre-populating Patient and Provider data within the [shared SMART on FHIR application hosted by Prescriber Intermediaries](specification.html#support-for-shared-smart-on-fhir-application).

Implementers are to refer to the [CQL Specification](https://cql.hl7.org/) for general guidance. Please refer to the DTR IG for more specific implementation examples.

<p></p>

### SPL - Structured Product Labeling

The FDA makes use of the SPL (Structured Product Labeling) as a document markup standard for exchanging product information. This guide uses information found in the REMS SPL submissions. Information about SPL can be found within the [FDA SPL Resources pages](https://www.fda.gov/industry/fda-data-standards-advisory-board/structured-product-labeling-resources).

<p></p>

### FDA OpenAPI

Information about medications can be found within the [FDA OpenAPI](https://open.fda.gov/apis/). Much of this information including the NDC and Labeling information comes from the SPL resources submitted to the FDA. This information could benefit from including CDS Hooks and FHIR server information for REMS programs in the future. This Guide makes use of similar interfaces based upon these APIs (Application Programming Interface).

<p></p>

### NCPDP SCRIPT

Prescription drug electronic prescribing and electronic prior authorization is completed using the NCPDP (National Council for Prescription Drug Programs) [SCRIPT standards](https://standards.ncpdp.org/Access-to-Standards.aspx). These standards are also used for completing the pharmacy workflow within the REMS programs. This guide describes sending NCPDP SCRIPT messages including NewRx for electronic prescribing. For more details, please reference the NCPDP SCRIPT standards.

<p></p>

<p></p>

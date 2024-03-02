### ** Reorganization of this page in process **

_Placeholder content_

### Pre-reading
Before reading this formal specification, implementers are encouraged to first familiarize themselves with two other key portions of this implementation guide:

* The [Use Cases & Overview](use-cases.html) page, which provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](technical-background.html) page, which provides information about the underlying specifications and recommends portions that must be read and understood to have necessary foundation to understand the constraints and usage guidance described here.


### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which could result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that implementers are free to consider but where there is no recommendation for or against adoption.

<p></p>

### CDS-related
<p></p>

The REMS Administrator will typically need some common information--regardless of the particular REMS program--at the time of a CDS Hooks request, such as patient demographics and prescriber info.

- But individual programs may require sharing additional patient clinicals or other info with the REMS Administrator as part of the Hooks interaction so that it can determine whether it needs to respond, and if so, what it should include in its response
- Stakeholders agree that it would benefit those configuring a provider system (e.g., an EHR) for this process to include a consistent set of FHIR resources in the CDS Hooks request--regardless of the particular medication
- However, the provider system should enable the REMS Administrator to query for additional patient clinical or other information during the CDS exchange, for example to retrieve lab results or other diagnostics specific to a REMS drug program

<p></p>
### Prefetch
- The content expected to be included in the CDS Hooks request as 'prefetch' data is:
  - Practitioner / PractitionerRole (?) identification of the provider in the triggering event
  - Full Practitioner / PractitionerRole resources for the prescribing physician (?)
  - Patient resource
  - Draft MedicationRequest for the medication being considered
  - ..._ to be determined_

See [some detailed specification section] for specific content and examples

<p></p>

### Query During CDS Hooks
- In addition, the provider system is expected to provide sufficient authorization during the CDS Hooks exchange to enable the REMS Administrator to retrieve related patient information including...
  - Lab results
  - Vital signs
  - Conditions
  - Concurrent and past medications
  - Procedures
  - _... to be determined_
##### Search guidance / examples for retrieving data using CDS Hooks context elements
  

#### Required / optional CDS Hooks specifics (hooks, prefetch, ...)
#### Required / optional actions / content to be exchanged at enrollment or other events

<p></p>

### SMART-related
#### Required / optional SMART launch specifics (scopes, deferring, ...)

  <p></p>
  
#### Deferred SMART launch using system action and Task
#### Ability to launch a REMS Administrator SMART app manually (not in conjunction with CDS Hooks)

  <p></p>
  
### REMS Privacy and Security
[specifics about security and privacy related to REMS interactions]

<p></p>

#### FHIR Privacy and Security Guidance
In addition, implementers are expected to...
- follow core [FHIR security principles](https://www.hl7.org/fhir/security.html).
 
- protect patient privacy as described in [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html).

<p></p>

 

_To be built out_

<p></p>



### Sharing EHR Information During CDS Hooks Interactions
[something around...
- The REMS Administrator will typically some common information--regardless of the particular REMS program--at the time of a CDS Hooks request, such as patient demographics and prescriber info
- But individual programs may require sharing additional patient clinicals or other info with the REMS Administrator as part of the Hooks interaction so that it can determine whether it needs to respond, and if so, what it should include in its response
- Stakeholders agree that it would benefit those configuring an EHR for this process to include a consistent set of FHIR resources in the CDS Hooks request--regardless of the particular medication
- However, the EHR should enable the REMS Administrator to query for additional patient clinical or other information during the CDS exchange, for example to retrieve lab results or other diagnostics specific to a REMS drug program

<br/><br/>
Prefetch
- The content expected to be included in the CDS Hooks request as 'prefetch' data is:
  - Practitioner / PractitionerRole (?) identification of the provider in the triggering event
  - Full Practitioner / PractitionerRole resources for the prescribing physician (?)
  - Patient resource
  - Draft MedicationRequest for the medication being considered
  - ..._ to be determined_

See [some detailed specification section] for specific content and examples

<br/><br/>

Query During CDS Hooks
- In addition, the EHR is expected to provide sufficient authorization during the CDS Hooks exchange to enable the REMS Administrator to retrieve related patient information including...
  - Lab results
  - Vital signs
  - Conditions
  - Concurrent and past medications
  - Procedures
  - _... to be determined_
  
See [some detailed specification section] for technical details and examples


]

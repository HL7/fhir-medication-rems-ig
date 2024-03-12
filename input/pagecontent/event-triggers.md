### Triggering CDS Hooks During Patient Care
CDS Hooks enumerates a small set of system trigger events, referred to as ["hooks"](https://cds-hooks.hl7.org/2.0/) that represent points in a provider system workflow at which CDS Hooks requests will be made to the external CDS Server (the REMS Administrator in this guide's scenarios). 

This guide does not limit the hooks that may be used in REMS workflows, but those that may be most useful in REMS scenarios include:
- [order-select](https://cds-hooks.org/hooks/order-select) which occurs after the clinician selects the order and before signing
- [patient-view](https://cds-hooks.org/hooks/patient-view/) which occurs when the user opens a patient's record; typically called only once at the beginning of a user's interaction with a specific patient's record
- [encounter-start](https://cds-hooks.org/hooks/encounter-start) which is invoked when the user is initiating a new encounter. In an inpatient setting, this would be the time of admission. In an outpatient/community environment, this would be the time of patient-check-in for a face-to-face or equivalent for a virtual/telephone encounter
- [medication-refill](https://cds-hooks.org/hooks/medication-refill) which fires when a medication refill request for an existing prescription of a specific medication is received

<p></p>

#### Configuring hooks based on workflow and patient information
REMS drug therapies tend to be complex and prescribing them may involve more pre-steps (labs, assessments, etc.) than a typical ambulatory prescription. The right time to initiate REMS interactions might not be limited to the provider system order flow (where the `order-select` hook fires) and may require that the CDS Hooks exchange with the REMS Administrator occur before the prescriber begins an order (potentially utilizing the `appointment-start` or `patient-view` hooks).

After a patient has begun therapy, `appointment-start` or `patient-view` hooks may be useful during follow-up appointments, and `medication-refill` at the time that requests for additional fill authorizations are received by the provider.
 
Additional clinical information may also need to factor in when determining when/whether to send a CDS Hooks request to the Administrator. Additional configuration within the provider system to limit when a hook fires may be needed; for example, setting up the `patient-view` hook so that a CDS request is transmitted only when the patient has a certain condition or other particular information in their medical record. This type of configuration is not addressed by the CDS Hooks standard and capabilities may vary by provider system.

<p></p>

#### Configuring hooks based on the medication
Because each medication is supported by one REMS Administrator among multiple, the provider system must be configured to call the correct CDS Server based on the medication being considered.

Similar to clinical "filtering" of hooks described in the section above, this type of configuration is not addressed by the CDS Hooks standard and must be addressed according to the capabilities of the provider system.
 
<p></p>
<p></p>
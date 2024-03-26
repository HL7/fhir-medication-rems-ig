### Triggering CDS Hooks During Patient Care
CDS Hooks enumerates a small set of system trigger events, referred to as ["hooks"](https://cds-hooks.hl7.org/2.0/) that represent points in a Provider System workflow at which CDS Hooks requests will be made to the external CDS Server (the REMS Administrator in this guide's scenarios). 

This guide does not limit the hooks that may be used in REMS workflows, but those that may be most useful in REMS scenarios include (in order of applicability):
- [`order-sign`](https://cds-hooks.org/hooks/order-sign) which occurs at the point in the ordering process when the prescriber finalizes the prescription
- [`order-select`](https://cds-hooks.org/hooks/order-select) which occurs after the clinician selects the medication at the start of the ordering process
- [`patient-view`](https://cds-hooks.org/hooks/patient-view/) which occurs when the user opens a patient's record; typically called only once at the beginning of a user's interaction with a specific patient's record
- [`encounter-start`](https://cds-hooks.org/hooks/encounter-start) which is invoked when the user is initiating a new encounter. In an inpatient setting, this would be the time of admission. In an outpatient/community environment, this would be the time of patient-check-in for a face-to-face or equivalent for a virtual/telephone encounter

<p> </p>

Note that more than one hook might be utilized during an encounter, each for a particular purpose. For example, during the order flow...
- the `order-select` hook might be used to enable the REMS Administrator to alert the provider early in the ordering process that they are not authorized to prescribe the REMS drug
- the `order-sign` hook might be used to prompt patient enrollment once the prescription details have been finalized.

Additional considerations when selecting which hook events to configure:
- If multiple hooks are configured for the same workflow, they must be used for distinct purposes and should not result in duplicate alerts or requests to the provider
- Hooks should be used in a way that avoids enabling the provider to take actions before they are appropriate, for example, completing patient enrollment if it is not yet sure that an order will be written.

<p></p>

#### Configuring hooks based on workflow and patient information
REMS drug therapies tend to be complex and prescribing them may involve more pre-steps (labs, assessments, etc.) than a typical ambulatory prescription. The right time to initiate REMS interactions might not be limited to the Provider System order flow (where the `order-select` and `order-sign` hooks fire) and may require that the CDS Hooks exchange with the REMS Administrator occur before the prescriber begins an order (potentially utilizing the `encounter-start` or `patient-view` hooks).

After a patient has begun therapy, `appointment-start` or `patient-view` hooks may be useful during follow-up appointments.
 
Additional clinical information may also need to be considered when determining when/whether to send a CDS Hooks request to the Administrator. Additional configuration within the Provider System to limit when a hook executes may be needed; for example, setting up the `patient-view` hook so that a CDS request is transmitted only when the patient has the REMS drug, a certain condition or other particular information in their medical record. This type of configuration is not addressed by the CDS Hooks standard and capabilities may vary by Provider System.

<p></p>

#### Configuring hooks based on the medication
Because each medication is supported by one REMS Administrator among multiple, the Provider System must be configured to call the correct CDS Server based on the medication being considered.

Similar to clinical "filtering" of hooks described in the section above, this type of configuration is not addressed by the CDS Hooks standard and must be addressed according to the capabilities of the Provider System.

Future opportunities to address configuration challenges are discussed in the [Future Directions section](future-directions.html#provider-system-configuration-for-many-drugs-and-rems-programs).
 
<p></p>
<p></p>
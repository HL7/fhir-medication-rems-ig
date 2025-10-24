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

In the event that a Prescriber Intermediary is used to forward the hooks, the intermediary system must also be configured to forward the request to the correct CDS Server for the specified mediation. This may be keyed off of the medication code. These codes can be provided by 3rd party vendors (e.g. First DataBank, Medi-Span, or NLM (National Library of Medicine) RxNorm). Multiple Prescriber Intermediaries can be used by the EHR. Its configuration should point to the correct intermediary for each medication or selection of medications.

Future opportunities to address configuration challenges are discussed in the [Future Directions section](future-directions.html#provider-system-configuration-for-many-drugs-and-rems-programs).
 
<p></p>

### Triggering ETASU Status Checks

FHIR Operations allow for complex queries or actions to be performed on a FHIR server beyond the normal CRUD actions (Create, Read, Update, Delete). The `$rems-etasu` FHIR operation has been added to allow clients to the REMS Administrator FHIR server to query the status of the ETASU (Elements to Assure Safe Use) at any time. For more details see the [Out-of-band ETASU Check section](specification.html#out-of-band-etasu-check).

#### Manually Triggering
The EHR system may include a manual trigger through a button to query the ETASU status in either the Provider workflow or in the Patient Portal. This interaction allows the Patient, Provider, or even the Pharmacy to determine what else is needed before a medication can be dispensed to a Patient. One of these stakeholders can check the status and complete a form in response or prompt another stakeholder to complete a form/requirement as needed. 

#### Querying for REMS Case before submitting Prescription to Pharmacy
The operation is also useful before sending the medication to the Pharmacy via NCPDP SCRIPT NewRx message. The returned FHIR `Parameters` include a `caseNumber` that represents the REMS Case Number for the given Patient and Medication. This case number is included in the NewRx message as the authNumber. The Pharmacy may use this number to reference the REMS case involving this Medication and Patient without needing to identify the case by matching against Patient demographics.

<p></p>

### Triggering Prescriber Intermediary Updates

The Prescriber Intermediary system can update its links to the REMS Administrator CDS Hooks and FHIR server endpoints using the mechanism described in the [Detailed Specification section](specification.html#automatic-rems-endpoint-registration-using-spl). This guide does not specify any mandatory methods of triggering the updates, but a couple of options are available. The update event may be triggered daily using a cron job or similar time-based job scheduler. Alternatively, it can be a manual process triggered by an external event or button within a user interface tied to the intermediary system.

<p></p>
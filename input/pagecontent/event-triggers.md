### Triggering CDS Hooks During Patient Care
[something around...
- CDS Hooks enumerates a small set of trigger events (e.g., order-select, encounter-start)
- REMS drugs tend to be more complex and prescribing them involves more pre-steps (labs, assessments, etc.) than a typical ambulatory prescription. The right time to initiate REMS interactions might not be limited to the EHR order flow
- Additional clinical information may also need to factor in when determining when/whether to send a CDS Hooks request to the Administrator
- Each medication has its own REMS Administrator... so the EHR needs to know which CDS Server to call, based on the medication being considered
- Below are considerations and options for:
  - determining when to trigger interactions with the Administrator, based on EHR workflow and/or other patient clinical indicators
  - determining which administrator to contact, based on the medication

]

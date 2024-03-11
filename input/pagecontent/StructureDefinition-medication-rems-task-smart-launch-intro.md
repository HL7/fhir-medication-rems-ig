**Important elements in this profile:**

- **Task.code**
  - The value, `launch-app-ehr` defines this task as one that places the specified SMART app in the provider's work queue
- **Task.for**
  - Patient reference that SHOULD be populated if the requested use of the SMART app is related to a particular patient
- **Task.requester**
  - The organization requesting that this task be performed SHOULD be provided
- **Task.owner**
  - A reference to the provider in whose work queue to add the SMART app launch task SHOULD be populated
- **Task.reasonReference**
  - The medication request for the REMS drug that this task relates to SHOULD be populated if this task is related to a specific prescription
- **Input.type = `smartonfhir-application`**
  - Indicates that this input holds the URL of the SMART app to be launched
- **Input.type = `smartonfhir-appcontext`**
  - Indicates that this input holds app context information to be used by the SMART application. This content will be included as `appContext` in the token response as is specified [here in the CDS Hooks specification](https://cds-hooks.org/specification/current/#link)

<p></p>


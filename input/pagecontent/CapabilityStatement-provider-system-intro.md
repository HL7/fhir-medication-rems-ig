This section describes base system capabilities a Provider System must support to be conformant with the Medication REMS FHIR IG.

Additional behavior and data population expectations are defined in the [Technical Background](technical-background.html), [Formal Specification](specification.html) and [CDS Hooks Card Profiles](cds-cards.html) sections.

### SMART App Capabilities
The Provider System:
- **SHALL** support the [SMART App Launch Implementation Guide](http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch)
- **SHALL** support the [EHR-based app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch) interaction pattern
- **SHALL** support the [standalone app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-standalone-launch) interaction pattern

<p></p>

### CDS Hooks Capabilities

The Provider System:
- **SHALL** support the [CDS Hooks 2.0 Implementation Guide](https://cds-hooks.hl7.org/2.0/)
- **SHALL** support immediate provider actions in response to a CDS Hook suggestion or action
- **SHOULD** support CDS suggestions with associated actions to defer the launch of SMART application

<p></p>

### FHIR RESTful Capabilities

The Provider System:
- **SHOULD** enable a REMS Administrator’s SMART app to create a DocumentReference resource associated to the patient
- **SHALL** support the JSON source format
- **SHOULD** support the XML source format

<p></p>

### Security

- Communication security implemented by the Provider System SHALL conform with the guidelines stated in [FHIR Security](https://www.hl7.org/fhir/security.html) for all exchanges covered in this IG.
- For general security considerations refer to [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html). 

<br />


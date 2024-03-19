This section describes base system capabilities a REMS Administrator System must support to be conformant with the Medication REMS FHIR IG.

Additional behavior and data population expectations are defined in the [Technical Background](technical-background), [Formal Specification](specification.html) and [CDS Hooks Card Profiles](cds-cards) sections.

### SMART App Capabilities
The REMS Administrator System:
- **SHALL** support the [SMART App Launch Implementation Guide](http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch)
- **SHOULD** support the [EHR-based app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-ehr-launch) interaction pattern
- **MAY** support the [standalone app launch](https://hl7.org/fhir/smart-app-launch/app-launch.html#launch-app-standalone-launch) interaction pattern
<p></p>

### CDS Hooks Capabilities

The REMS Administrator System:
- **SHOULD** support the [CDS Hooks 2.0 Implementation Guide](https://cds-hooks.hl7.org/2.0/)

<p></p>

### FHIR RESTful Capabilities

The REMS Administrator System:
- **SHALL** support the JSON source format. 
- **SHOULD** support the XML source format. 

<p></p>

### Security

- Communication security implemented by the REMS Administrator System SHALL conform with the guidelines stated in [FHIR Security](https://www.hl7.org/fhir/security.html) for all exchanges covered in this IG.
- For general security considerations refer to [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html). 

<br />

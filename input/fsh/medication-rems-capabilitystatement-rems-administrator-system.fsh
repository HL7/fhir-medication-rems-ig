Instance: rems-administrator-system
InstanceOf: CapabilityStatement
Usage: #definition
Title: "Medication REMS Capability Statement - REMS Administrator System"
Description: "This CapabilityStatement describes the expected capabilities of a REMS Administrator System that conforms to the conventions of the Medication REMS FHIR implementation guide."
* url = "http://hl7.org/fhir/us/medication-rems/CapabilityStatement/rems-administrator-system"
* version = "1.0.0"
* name = "MedicationRemsCapabilityStatementRemsAdministratorSystem"
* status = #active
* experimental = false
* date = "2024-04-01T00:00:00-05:00"
* publisher = "HL7 International - Pharmacy"
* contact[0].name = "HL7 International - Pharmacy"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* contact[+].name = "Frank McKinney"
* contact[=].telecom[0].system = #email
* contact[=].telecom[=].value = "frank.mckinney@pocp.com"
* contact[=].telecom[+].system = #email
* contact[=].telecom[=].value = "fm@frankmckinney.com"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* description = "This CapabilityStatement describes the expected capabilities of a REMS Administrator System that conforms to the conventions of the Medication REMS FHIR implementation guide."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[+] = #json
* patchFormat = #application/json-patch+json
* implementationGuide[0] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHALL
* implementationGuide[+] = "https://cds-hooks.hl7.org/2.0/"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* rest.mode = #server
* rest.documentation = "When participating in exchanges described in the Medication REMS FHIR IG, the REMS Administrator System **SHALL** 1. Implement RESTful behavior according to the FHIR specification. 2. Support the JSON source format. \nWhen participating in exchanges described in the Medication REMS FHIR IG, the REMS Administrator System **SHOULD**: 1. Support the XML source format."
* rest.security.description = "1. Communication security implemented by the REMS Administrator System SHALL conform with the guidelines stated in [FHIR Security](https://www.hl7.org/fhir/security.html) for all exchanges covered in this IG. 2. For general security considerations refer to [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html)."
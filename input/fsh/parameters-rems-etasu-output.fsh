Instance: parameters-rems-etasu-output
InstanceOf: Parameters
Usage: #example
Description: "Example output parameters for the $rems-etasu operation"
* parameter.name = "rems-etasu"
* parameter.resource.resourceType = "GuidanceResponse"
* parameter.resource.status = #success
* parameter.resource.moduleUri = "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/"
* parameter.resource.subject.reference = "Patient/example-patient-123"
* parameter.resource.outputParameters.reference = "#etasuOutputParameters"
* parameter.resource.contained.resourceType = "Parameters"
* parameter.resource.contained.id = "etasuOutputParameters"
* parameter.resource.contained.parameter[0].name = "Patient Enrollment"
* parameter.resource.contained.parameter[=].resource.resourceType = "GuidanceResponse"
* parameter.resource.contained.parameter[=].resource.status = #success
* parameter.resource.contained.parameter[=].resource.moduleUri = "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/"
* parameter.resource.contained.parameter[=].resource.subject.reference = "Patient/example-patient-123"
* parameter.resource.contained.parameter[=].resource.note.text = "Patient Enrollment"
* parameter.resource.contained.parameter[+].name = "Prescriber Enrollment"
* parameter.resource.contained.parameter[=].resource.resourceType = "GuidanceResponse"
* parameter.resource.contained.parameter[=].resource.status = #success
* parameter.resource.contained.parameter[=].resource.moduleUri = "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/"
* parameter.resource.contained.parameter[=].resource.subject.reference = "Patient/example-patient-123"
* parameter.resource.contained.parameter[=].resource.note.text = "Prescriber Enrollment"
* parameter.resource.contained.parameter[+].name = "case_number"
* parameter.resource.contained.parameter[=].valueString = "a24e73e53b2"
Profile: MedicationRemsTaskSmartLaunch
Parent: $smart-launch-task
Id: medication-rems-task-smart-launch
Title: "Medication REMS Task - SMART Launch"
Description: "This profile defines a Task to be returned in a REMS Administrator's CDS Hooks response - enabling the provider or staff to launch a SMART app from their work queue."
* ^meta.lastUpdated = "2024-03-10T00:00:00-05:00"
* ^url = "http://hl7.org/fhir/us/medication-rems/StructureDefinition/medication-rems-task-smart-launch"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2024-03-10T00:00:00-05:00"
* ^publisher = "HL7 International - Pharmacy"
* ^contact[0].name = "HL7 International - Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^contact[+].name = "Frank McKinney"
* ^contact[=].telecom[0].system = #email
* ^contact[=].telecom[=].value = "frank.mckinney@pocp.com"
* ^contact[=].telecom[+].system = #email
* ^contact[=].telecom[=].value = "fm@frankmckinney.com"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* id 1.. MS
* intent 1.. MS
* intent = #proposal (exactly)
* for 0.. MS
* for ^label = "Related Patient"
* for ^short = "Related Patient in the provider system"
* for ^comment = "SHOULD be populated if the requested use of the SMART app is related to a particular patient"
* authoredOn 1.. MS
* requester 0..1 MS
* requester only Reference(Organization)
* requester ^comment = "The organization requesting that this task be performed SHOULD be provided"
* owner only Reference(Practitioner)
* owner MS
* owner ^label = "Provider"
* owner ^short = "Provider"
* owner ^comment = "The provider in whose work queue to add the SMART app launch task SHOULD be populated"
* owner ^min = 0
* reasonReference only Reference(MedicationRequest)
* reasonReference MS
* reasonReference ^label = "Related medication request"
* reasonReference ^short = "Related medication request"
* reasonReference ^definition = "The medication request for the REMS drug that this task relates to SHOULD be populated if this task is related to a specific prescription"
* reasonReference ^min = 0
* reasonReference.reference 1.. MS
* reasonReference.reference ^label = "MedicationRequest reference"
* reasonReference.reference ^short = "MedicationRequest reference"
* reasonReference.reference ^definition = "Reference to the related MedicationRequest resource"

Instance: medication-rems-task-smart-launch-1
InstanceOf: medication-rems-task-smart-launch
Usage: #example
* status = #requested
* intent = #proposal
* code = $smart-codes#launch-app-ehr "Launch application using the SMART EHR launch"
* description = "Complete patient enrollment using the DRUG-X REMS SMART app"
* for = Reference(Patient/example-patient-123) "August Samuels"
* authoredOn = "2024-02-13"
* input[0].type = $smart-codes#smartonfhir-application "SMART on FHIR application URL."
* input[=].valueUrl = "https://example.org/DRUG-X/smart-application"
* input[+].type = $smart-codes#smartonfhir-appcontext "Application context related to this launch."
* input[=].valueString = "{\"providerSystemPatientId\":\"123\"}"

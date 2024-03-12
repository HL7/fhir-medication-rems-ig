Alias: $us-core-documentreference = http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference
Alias: $loinc = http://loinc.org
Alias: $us-core-documentreference-category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category
Alias: $formatcode = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode

Instance: example-rems-docref-1
InstanceOf: $us-core-documentreference
Usage: #example
Description: "Example of a US Core document reference containing a patient's REMS program information"
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-documentreference"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><b>REMS information for August Samuels</b><br />On March 9, 2024<br /><br />Patient Name: August Samuels<br />Patient REMS ID: 0354600<br />Patient enrollment status: Enrolled March 9, 2024<br /><br />Prescriber Name: Mary Patel<br />Prescriber REMS ID: 0354035500 (NPI)<br /><br />Medication: Zombify 10mg Tablet<br />Initial dispense authorization number: 30550221<br /><br /></div>"
* status = #current
* type = $loinc#51851-4 "Administrative note"
* type.text = "REMS administrative note"
* category = $loinc#51851-4 "Administrative note"
* subject = Reference(Patient/example-patient-123) "August Samuels"
* date = "2024-03-09T15:29:46Z"
* description = "REMS Patient Information Note"
* content.attachment.contentType = #text/plain
* content.attachment.data = "UkVNUyBpbmZvcm1hdGlvbiBmb3IgQXVndXN0IFNhbXVlbHMgW3RleHQgdHJ1bmNhdGVkXQ=="
* content.attachment.title = "REMS information for August Samuels on March 9, 2024"
* content.format = $formatcode#urn:ihe:iti:xds:2017:mimeTypeSufficient "mimeType Sufficient"
* context.period.start = "2024-03-09T08:00:00+11:00"

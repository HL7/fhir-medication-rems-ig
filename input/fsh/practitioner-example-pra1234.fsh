Instance: pra1234
InstanceOf: Practitioner
Description: "Example of a Practitioner"
Usage: #example
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-practitioner"
* identifier[0].system = "http://hl7.org/fhir/sid/us-npi"
* identifier[0].value = "1122334455"
* address.use = #home
* address.type = #both
* address.state = "NY"
* address.city = "Buffalo"
* address.postalCode = "14210"
* address.line = "840 Seneca St"
* telecom[0].system = #phone
* telecom[=].value = "555-873-1557"
* telecom[=].rank = 1
* telecom[+].system = #email
* telecom[=].value = "jane.betty@myhospital.com"
* telecom[=].rank = 2
* telecom[+].system = #fax
* telecom[=].value = "555-123-4567"
* telecom[=].rank = 3
* name.use = #official
* name.family = "Doe"
* name.given[0] = "Jane"
* name.given[+] = "Betty"
* name.prefix = "Dr."
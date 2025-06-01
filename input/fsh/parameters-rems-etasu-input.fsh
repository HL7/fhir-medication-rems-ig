Instance: parameters-rems-etasu-input
InstanceOf: Parameters
Usage: #example
Description: "Example input parameters for the $rems-etasu operation"
* parameter[0].name = "patient"
* parameter[=].resource.resourceType = "Patient"
* parameter[=].resource.id = "example-patient-123"
* parameter[=].resource.meta.versionId = "1"
* parameter[=].resource.meta.lastUpdated = "2025-04-10T01:10:26.457-04:00"
* parameter[=].resource.meta.source = "#r7DbQaYwStt3SnNl"
* parameter[=].resource.text.status = #generated
* parameter[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><div class=\"hapiHeaderText\">Jon Stark <b>SNOW </b></div><table class=\"hapiPropertyTable\"><tbody><tr><td>Identifier</td><td>0V843229061TB</td></tr><tr><td>Address</td><td><span>1 Winterfell Rd </span><br/><span>Winterfell </span><span>Westeros </span></td></tr><tr><td>Date of birth</td><td><span>01 June 1996</span></td></tr></tbody></table></div>"
* parameter[=].resource.identifier.system = "http://hl7.org/fhir/sid/us-medicare"
* parameter[=].resource.identifier.value = "0V843229061TB"
* parameter[=].resource.name.use = #official
* parameter[=].resource.name.family = "Samuels"
* parameter[=].resource.name.given[0] = "August"
* parameter[=].resource.gender = #male
* parameter[=].resource.birthDate = "1989-03-12"
* parameter[=].resource.address.use = #home
* parameter[=].resource.address.type = #both
* parameter[=].resource.address.line = "10023 Oakways Ln"
* parameter[=].resource.address.city = "Concord"
* parameter[=].resource.address.state = "MA"
* parameter[=].resource.address.postalCode = "01742"
* parameter[+].name = "medication"
* parameter[=].resource.resourceType = "Medication"
* parameter[=].resource.id = "123-mr-IPledge-med"
* parameter[=].resource.code.coding[0].system = "http://www.nlm.nih.gov/research/umls/rxnorm"
* parameter[=].resource.code.coding[0].code = #6064
* parameter[=].resource.code.coding[0].display = "isotretinoin"
* parameter[=].resource.code.coding[1].system = "http://hl7.org/fhir/sid/ndc"
* parameter[=].resource.code.coding[1].code = #0245-0571-01
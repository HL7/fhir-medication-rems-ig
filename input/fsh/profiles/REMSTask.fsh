Profile: REMSTaskSmartLink
Parent: Task
Id: rems-task
Title: "Task "
Description: "Defines how Task is used to ask for a SMART on Fhir app to be launched"
* ^status = #draft
* . ^mustSupport = false
* status 1..1 MS
* status only code
* intent MS
* code 1..1 MS
* code only CodeableConcept
* code from TaskCode (required)
* for 0..1 MS
* for ^short = "Patient the application is in context for"
* for only Reference(USCorePatientProfile)
* authoredOn 1..1 MS
* requester 1..1 MS 
* owner 0..1 MS
  * ^short = "Who should the application be launched by"
* reasonCode MS
* input MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* input contains
    smartAppLink 0..1 MS and
    appContext 0..* MS
* input[smartAppLink]
  * ^definition = "The url of the SMART App to launch"
  * type 1..1 MS
  * type only CodeableConcept
  * type = $temp#smart-app-endpoint
  * value[x] 1..1 MS
  * value[x] only canonical
  * value[x] ^short = "url"
* input[appContext] 
  * ^definition = "The applicaiton context to launch the application with"
  * type 1..1 MS
  * type only CodeableConcept
  * type = $temp#app-context
  * value[x] 1..1 MS
  * value[x] only string



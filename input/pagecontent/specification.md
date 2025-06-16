### Pre-reading
Before reading this formal specification, implementers are encouraged to first familiarize themselves with other key portions of this implementation guide:

* The [Participant Roles and Needs](roles.html) section overviews the real world people and organizations who participate in REMS programs and defines the system roles referenced in the specification below.

* The [REMS Steps and Terminology](process.html) and [Use Cases](use-cases.html) sections describe the process context and goals behind the interactions defined below

* The [Technical Background](technical-background.html) page identifies related specifications that this guide depends on. 


### Conformance Conventions
This implementation guide uses the following terms to set expectations for implementers to conform to specific behaviors and information content it defines:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which could result in interoperability issues or sub-optimal behavior if not adhered to), but which are not strictly required for an implementation to be considered conformant to this version of the guide.

* **MAY** describes optional behaviors that implementers are free to consider but where there is no recommendation for or against adoption.

<p></p>

### Provider System and REMS Administrator System Interactions

This implementation guide establishes two basic interaction patterns between a Provider System and REMS Administrator System that can be applied at multiple points in treating a patient with a REMS drug:
- **Preferred approach:** Interaction initiated by the Provider System during the provider's workflow
- **Additional / transitional approach**: Provider uses an external REMS Administrator application that accesses patient data in the Provider System using standalone SMART app launch. This provides a transitional bridge for REMS provider portals that exist today, and for circumstances where interaction with the REMS Administrator may more naturally occur within its external system.

#### Interaction initiated by the Provider System during the provider's workflow
This interaction is initiated by the Provider System during the provider's workflow, using CDS Hooks and, optionally, EHR-based SMART App Launch. 

- Provider Systems **SHALL** support this interaction approach because it offers the greatest opportunity to raise and address REMS requirements when related care activities occur. 
- REMS Administrators **SHOULD** implement this interaction approach.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>

#### Interaction between an external REMS Administrator application and the Provider System
In this interaction, a provider uses an external REMS Administrator application that accesses patient data in a Provider System using standalone SMART app launch. 

- Provider Systems **SHALL** support this interaction approach to provide a transitional bridge from REMS Administrator portals that exist today or for circumstances where interaction with the REMS Administrator may more naturally occur within its external system. 
- REMS Administrators **MAY** support this interaction approach.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Interactions with a Standalone SMART App - Examples</strong></figcaption>
  <p>
  <img src="standalone-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>

#### CDS Hooks and SMART App Launch patterns may be applied at multiple points in a patient's care

The guide does not strictly require that either of these patterns be implemented at particular workflow events. Implementers are free to choose when and how they apply these interactions. However, implementers **SHOULD** support these interactions whenever possible to:

- notify the provider that a REMS program exists for a drug being considered or ordered
- alert the provider of unmet REMS requirements 
- provide information to educate the provider or patient, or assist with their REMS responsibilities 
- enroll the patient into the REMS program at the earliest opportunity
- make the provider aware of REMS requirements or information needs during the course of treatment
- supply the REMS Administrator with needed patient, provider or treatment information electronically from the Provider System--without human intervention--where possible, to reduce the burden on participants and prevent care delays
- and save REMS Administrator-supplied information about the patient's participation in the REMS program to the patient's record in the Provider System.

In particular, this guide strongly recommends leveraging the CDS Hooks and SMART app launch workflow at the start of the patient's therapy to raise patient enrollment requirements and enable them to be completed quickly, minimizing manual data entry and preventing a possible delay in treatment. 

<p></p>

#### Support for immediate provider actions in response to a REMS Interaction

Many EHRs support a subset of CDS Hooks and SMART launch features today to bring alerts and information into the prescriber's workflow at appropriate times--to be acted upon immediately. 

The guide makes use of these features to notify the prescriber of pertinent REMS information, for example that there's a REMS program for a drug being considered or that the prescriber's REMS enrollment has lapsed. The provider's response in these situations may be to simply acknowledge the information before continuing with their workflow.

A provider may also take the opportunity to complete a REMS requirement returned in a CDS Hooks response immediately through use of a SMART app. Use of the guide's patterns can minimize the time needed from the provider in such a circumstance--to complete a patient enrollment form, for example--by the REMS Administrator prefilling or hiding questions that were satisfied by data provided in the preceding CDS Hooks interaction. 

Provider Systems **SHALL** support immediate provider responses to Cards returned .

<p></p>

#### Support for deferred SMART app launch

In other cases, a provider action may not be able to be completed immediately upon receiving it in a CDS Hooks response, and instead may need to be deferred until a later time. The guide leverages an approach where the REMS Administrator's CDS Hooks response includes a `suggestion` Card containing a Task resource enabling the provider to launch the indicated SMART app later, as described in the [CDS Hooks Card Profiles section](cds-cards.html#deferred-smart-application-launch-suggestion).

Provider Systems **SHOULD** support `suggestion` cards with associated `actions` to defer the launch of SMART application, and **SHOULD** provide the REMS Administrator's CDS server sufficient OAuth scopes to enable the app to create a Task to enable the deferred launch, as [described here](cds-cards.html#deferred-smart-application-launch-suggestion).

<p></p>

#### Enabling the Provider System user to manually launch the SMART app

In some situations, it may be helpful for the prescriber or other provider assisting in the care of a REMS patient to manually launch the associated REMS Administrator SMART app, independent of a CDS Hooks interaction. 

Provider Systems and REMS Administrators **MAY** support manual launch of the REMS Administrator SMART application.

When a Provider System provides this support, it **SHALL** provide patient context during launch.

<p></p>

#### Support for saving REMS information to the patient's record

The REMS Administrator SMART app **MAY** save information about the patient's REMS participation to the Provider System's patient record. Saving of REMS information is typically most effective during the provider’s interaction with a SMART app because it can be timed to occur after activities that might change the patient's status or information--for example by completing patient enrollment. 

To enable this to occur, the Provider System **SHOULD** authorize a REMS Administrator's SMART app with sufficient OAuth scopes to enable the app to create a DocumentReference resource associated to the patient. [This guidance in the SMART App Launch IG](https://hl7.org/fhir/smart-app-launch/scopes-and-launch-context.html) provides details for assigning scopes during app launch.

If using this capability, the REMS Administrators **SHOULD** follow [US Core DocumentReference guidance](https://hl7.org/fhir/us/core/StructureDefinition-us-core-documentreference.html) when creating this resource. 

In addition to the US Core requirements, this guide recommends populating DocumentReference.type with the LOINC value `51851-4` (Administrative note).

See an [example DocumentReference](DocumentReference-example-rems-docref-1.html) that illustrates this guidance.

<p></p>

#### Support for forwarding messages through Prescriber Intermediary

The Prescriber Intermediary server application sits in between the EHR system and the REMS Administrator. The benefit to this is allowing the REMS Administrator system to register their CDS Hooks with any supported intermediaries instead of every EHR system. The CDS Hooks requests are sent to the Prescriber Intermediary when configured to do so. This intermediary will determine based on the medication in the hook which REMS Administrator to send the request to. The intermediary will then forward back any returned cards from the REMS Administrator to the EHR. The interaction will be transparent to the EHR system. The intermediary **SHALL** populate the prefetch if unset using the prefetch tokens provided by the REMS Administrator. Lastly, the intermediary **SHALL** remove the FHIR Authorization from the Hook before sending it to the REMS Administrator.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow with a Prescriber Intermediary</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence-with-intermediary.png" style="float:none">  
  </p>
</figure>
</div>

<p></p>

The Prescriber Intermediary **SHOULD** also support forwarding FHIR requests from the EHR to the REMS Administrators. Similarly to the CDS Hooks requests, FHIR requests will be forwarded. This enables the `$rems-etasu` FHIR operation (for retrieving the ETASU out-of-band) and the `$questionnaire-package` operation (for retrieving Questionnaires in a shared SMART on FHIR application scenario).

<p></p>

#### Support for Shared SMART on FHIR Application 

Similar to the burden with registering the CDS Hook server on the REMS Administrator with every EHR, there is significant effort during setup to register the SMART on FHIR application from the REMS Administrator with every EHR. The REMS Administrators have the option to implement their own SMART on FHIR application that may give them tighter control, however REMS Administrators **SHOULD** support shared SMART App launch instead. The Shared SMART app **SHALL** follow the [Da Vinci Documentation Templates and Rules \(DTR\) IG](https://hl7.org/fhir/us/davinci-dtr/). 

##### Rendering the Shared SMART app
The shared SMART app **SHALL** request the resources necessary to render the forms from the REMS Administrators using the `$questionnaire-package` operation on the Questionnaire resource. The path to the operation on the REMS administrator's FHIR server will follow the pattern `<fhir_server_base>/Questionnaire/<questionnaire-id>/$questionaire-package`. When retrieving the questionnaire package, the REMS Administrator will compile a FHIR bundle containing the Questionnaire, ValueSet, and any Library resource needed to render the form. Embedded within Library resources there **SHOULD** be CQL (Clinical Quality Language) scripts. These scripts link the Questionnaire to data within the FHIR server. Once executed by the Shared SMART App, they are able to pre-populate the forms with data. Without the CQL, the forms will be empty when loading, negating the benefit of using a SMART on FHIR application.

##### Storing Partially Completed Questionnaires
While the forms are being completed, the data **SHALL** be stored within a QuestionnaireResponse FHIR resource. The application **SHOULD** provide a method for storing and retrieving in-progress forms from the EHR FHIR server. This storage and retrieval method **SHALL** be implemented using standard storage and retrieval methods for QuestionnaireResponse resources on the FHIR server. The shared application **SHOULD** query for all QuestionnaireResponses for this Patient and medication and give the user completing the form the option to select which they would like to continue. The shared SMART on FHIR application **SHALL** render the partially completed form with the answers already provided in the stored and loaded QuestionnaireResponse.

##### Submitting Completed Questionnaires
Upon completion of the form, the application **SHALL** send the QuestionnaireResponse to the correct REMS Administrator for the medication. The application **MAY** send the responses through the Prescriber Intermediary, or straight to the REMS Administrator. The REMS Administrator **SHALL** support a FHIR Operation `$submit` on the QuestionnaireResponse resource. The path shall be of the form `<base_fhir_url>/QuestionnaireResponse/$submit`. The REMS Administrator is then free to parse and store the QuestionnaireResponse following the requirements of the REMS program.


<p></p>

### Provider System and Pharmacy System Interactions

This Implementation Guide is part of a larger system whose scope encompasses not just the Patient and Provider interactions with the REMS Administrator, but also the Pharmacy. The full system completes the interaction from start with the Provider meeting with a Patient and determining that a medication is needed that has a REMS. Through the technologies outlined in this guide they are able to determine what the requirements are for the REMS program and complete those before sending on the medication to the Pharmacy. Once the medication is sent to a Pharmacy, the REMS interactions are not complete until the Patient is given the medication. In fact, there may even be follow-on visits to the Provider that check the status of the Patient and determine that the patient is still handing the medications well.

<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow with a Prescriber Intermediary</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence-with-pharmacy.png" style="float:none">  
  </p>
</figure>
</div>

<p></p>

The Pharmacy interactions are out of scope of this IG but are detailed in the NCPDP implementation guides (TODO: add link). These interactions detail the the use of the REMS specific messages within the NCPDP SCRIPT standard. Using the standard, the Pharmacy system is able to use standard messages to query the REMS Administrator though a REMS Pharmacy Intermediary. This intermediary forwards the messages to the correct REMS Administrator and returns reject codes if the medication cannot be dispensed. A successful message will provide dispense authorization for the Pharmacy to finally dispense the medication to the Patient. 

#### Sending the Medication to the Pharmacy
The EHR **SHALL** send the medication to the Pharmacy using the standard NCPDP SCRIPT NewRx message. This message contains information about the Patient and the Medication being prescribed. For more details on the message please see the NCPDP SCRIPT specification. 

The message also contains a tagged value called `AuthorizationNumber`. This value **SHALL** contain the REMS Case Number for the given Patient and Medication. This case number **SHOULD** have been previously retrieved from the REMS Administrator though the [$rems-etasu FHIR Operation described below](specification.html#out-of-band-etasu-check). If there is no case number available, the `AuthorizationNumber` can be omitted. 

A REMS Administrator may not create a case number for the Patient until enrollment or other forms have been completed. The case number is used to reference the case and make it easier for the case to be retrieved by the REMS Administrator internally without having to rely on Patient demographics. 

#### Reminding the Provider of Incomplete Forms
This guide does not build a specific mechanism for sending message back from the Pharmacy to the EHR. The methods currently in place should be utilized for notifying the Provider that REMS requirements still need to be completed before the medication can be dispensed. Future versions of this guide may outline the details surrounding new communications mechanisms to automate this interaction.

<p></p>

### Data Exchange During CDS Hooks Interactions
<p></p>

The REMS Administrator will typically need information about the patient, provider and drug to support a REMS interaction, regardless of the REMS program or point in the patient's care.

But individual programs may require sharing additional patient clinicals or other info with the REMS Administrator as part of the Hooks interaction so that it can determine how best to respond.

<p></p>

#### Prefetch

Supplying a consistent set of FHIR resources in the CDS Hooks request is needed to provide sufficient context to enable the REMS Administrator to respond--regardless of the medication or situation.

The Provider System **SHOULD** support include the following FHIR resources as prefetch data within CDS Hooks requests submitted to a REMS Administrator's CDS service. The REMS Administrator’s CDS service **SHALL** query the Provider System to retrieve the resources below if not provided in the CDS request.
  - **Practitioner**, to identify the provider participating in the triggering event
  - **Patient**, to identify the patient being treated
  - **MedicationRequest** for the REMS drug (which may be draft or completed, depending on when the CDS request is triggered) and other patient medications
  - **Medication** if referenced by the MedicationRequest
  - **Pharmacy** (optional) requested pharmacy as represented by a HealthcareService resource

For example: 

{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  ...
    "prefetch" : {
      "patient": "Patient/{{context.patientId}}",
      "practitioner": "{{context.userId}}",
      "medicationRequests": "MedicationRequest?subject={{context.patientId}}&_include=MedicationRequest:medication",
    }
}</code></pre>
{% endraw %}

<p></p>

### Query During CDS Hooks
- In addition, the Provider System is expected to provide sufficient authorization during the CDS Hooks exchange to enable the REMS Administrator to retrieve related patient information including...
  - lab results
  - vital signs
  - conditions
  - concurrent and past medications
  - procedures
  - etc. 

Provider Systems **SHALL** enable the REMS Administrator to query for additional patient clinical or other information during the CDS exchange, for example to retrieve lab results or other diagnostics specific to a REMS drug program

<p></p>

### Out-of-band ETASU Check

There may be instances where a client to the REMS Administrator may want to know the current ETASU (Elements to Assure Safe Use) status of the REMS program at any given time. A new FHIR operation $rems-etasu on the GuidanceResponse resource **SHOULD** be supported by the REMS Administrator FHIR Server. This operation allows the clients to the REMS Administrator FHIR server to query the status of the REMS process for an individual patient at any time. The clients to this operation may include the EHR or Pharmacy applications. The users of these may include the Patient, Provider, or Pharmacist. The operation will also return the case number if available for the REMS case associated with the Patient and Medication input as Parameters. This operation allows for the systems to programmatically check the ETASU status in a parsable output format that can be displayed to the users in a graphical and more user-friendly method. The data can also be used to determine the case number for use when sending the Prescription to the Pharmacy using the NewRx NCPDP SCRIPT message.

#### Input 

The input parameters optionally consist of a Patient and Medication FHIR Resource or a case number. These resources are used by the REMS Administrator to retrieve the REMS case for the provided patient. 

##### Example Input
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">
{
    "resourceType": "Parameters",
    "parameter": [
        {
            "name": "patient",
            "resource": {
                "resourceType": "Patient",
                "id": "example-patient-123",
                "meta": {
                    "versionId": "1",
                    "lastUpdated": "2024-03-27T12:19:51.575-04:00",
                    "source": "#rHsFtpinBxvVskjP"
                },
                "text": {
                    "status": "generated",
                    "div": "<div xmlns=\"http://www.w3.org/1999/xhtml\">…</div>"
                },
                "identifier": [
                    {
                        "system": "http://hl7.org/fhir/sid/us-medicare",
                        "value": "0V843229061TB"
                    }
                ],
                "name": [
                    {
                        "use": "official",
                        "family": "Samuels",
                        "given": [
                            "August",
                        ]
                    }
                ],
                "gender": "male",
                "birthDate": "1989-03-12",
                "address": [
                    {
                        "use": "home",
                        "type": "both",
                        "line": [
                            "10023 Oakways Ln"
                        ],
                        "city": "Concord",
                        "state": "MA",
                        "postalCode": "01742"
                    }
                ]
            }
        },
        {
            "name": "medication",
            "resource": {
                "resourceType": "Medication",
                "id": "123-mr-IPledge-med",
                "code": {
                    "coding": [
                        {
                            "system": "http://www.nlm.nih.gov/research/umls/rxnorm",
                            "code": "6064",
                            "display": "Isotretinoin 20 MG Oral Capsule"
                        },
                        {
                            "system": "http://hl7.org/fhir/sid/ndc",
                            "code": "0245-0571-01"
                        }
                    ]
                }
            }
        },
        {
            "name": "case_number",
            "valueString": "a24e73e53b2"
        }
    ]
}
</code></pre>
{% endraw %}

#### Output

The output consists of a FHIR Parameter with a FHIR Resource of the type GuidanceResponse. The GuidanceResponse contains a *status* value mapped to the REMS meaning in the following table.

<table class='grid'>
  <thead>
    <tr>
      <th>GuidanceResponse Value</th>
      <th>REMS Meaning</th>
    </tr>
  </thead>
  <tr>
    <td>success</td>
    <td>Completed</td>
  </tr>
  <tr>
    <td>data-requested</td>
    <td></td>
  </tr>
  <tr>
    <td>data-required</td>
    <td>Incomplete / Needed</td>
  </tr>
  <tr>
    <td>in-progress</td>
    <td></td>
  </tr>
  <tr>
    <td>failure</td>
    <td>Not Found</td>
  </tr>
  <tr>
    <td>entered-in-error</td>
    <td></td>
  </tr>
</table>

This GuidanceResponse represents the overall status of the REMS ETASU. Inside the GuidanceResponse there is a contained Parameters list named *etasuOutputParameters*. Each Parameter in this list contains a GuidanceResponse resource that is representative of one of the individual elements of the REMS program. These may include any forms or knowledge assessments that need to be completed. These parameters are referenced by the *outputParameters* field. The *status* of the GuidanceResponse values gives the completion status of the REMS ETASU requirement. The values are matched in the table above.

##### Example Output
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">
{
    "resourceType": "Parameters",
    "parameter": [
        {
            "name": "rems-etasu",
            "resource": {
                "resourceType": "GuidanceResponse",
                "status": "data-required",
                "moduleUri": "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/",
                "subject": {
                    "reference": "Patient/example-patient-123"
                },
                "outputParameters": {
                    "reference": "#etasuOutputParameters"
                },
                "contained": [
                    {
                        "resourceType": "Parameters",
                        "id": "etasuOutputParameters",
                        "parameter": [
                            {
                                "name": "Patient Enrollment",
                                "resource": {
                                    "resourceType": "GuidanceResponse",
                                    "status": "success",
                                    "moduleUri": "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/",
                                    "subject": {
                                        "reference": "Patient/example-patient-123"
                                    },
                                    "note": [
                                        {
                                            "text": "Patient Enrollment"
                                        }
                                    ]
                                }
                            },
                            {
                                "name": "Prescriber Enrollment",
                                "resource": {
                                    "resourceType": "GuidanceResponse",
                                    "status": "data-required",
                                    "moduleUri": "https://build.fhir.org/ig/HL7/fhir-medication-rems-ig/",
                                    "subject": {
                                        "reference": "Patient/example-patient-123"
                                    },
                                    "note": [
                                        {
                                            "text": "Prescriber Enrollment"
                                        }
                                    ]
                                }
                            },
                            {
                                "name": "case_number",
                                "valueString": "a24e73e53b2"
                            }
                        ]
                    }
                ]
            }
        }
    ]
}
</code></pre>
{% endraw %}

<p></p>
  
### Automatic REMS Endpoint Registration using SPL

The use of a REMS Prescriber Intermediary server sitting between the EHR and the REMS Administrator allows for the EHR to only register a single CDS Hooks endpoint. The burden of registering all the REMS Administrators is shifted to a more centralized point within the REMS Prescriber Intermediaries. This burden can be further reduced by allowing the REMS Prescriber Intermediary to automatically discover and register the CDS Hooks endpoints provided by the REMS Administrators for each REMS program. The combined capabilities of a recommended API similar to the openFDA API and recommended use of REMS Structured Product Labeling (SPL) could enable the automated discovery of the REMS Administrator endpoints in a sustainable manner over time. 

#### Background

##### SPL

Structured Product Labeling (SPL) is a document markup standard approved by Health Level Seven (HL7) and adopted by FDA as a mechanism for exchanging product and facility information. The REMS document and appended materials are also required to be submitted to the FDA using the SPL format. This includes details on the requirements for the REMS program and specifies all forms and Elements to Assure Safe Use (ETASU) requirements. The SPL format also allows for storing REMS Electronic Resource Information. The REMS Electronic Resource Information can be in the format of a URL (Uniform Resource Locator) or URN (Uniform Resource Name).

If an SPL file includes the URL of the CDS Hook that connects the prescriber EHR to the REMS Administrator, the entire zip file from [DailyMed's SPL Resources: Download ALL Indexing & REMS Files](https://dailymed.nlm.nih.gov/dailymed/spl-resources-all-indexing-files.cfm) webpage containing the REMS SPL files can be downloaded and parsed for those CDS Hook endpoint URLs. The REMS Administrator CDS Hook URLs can then be discovered, registered, and accessed by the REMS Prescriber Intermediary to route the request to the correct REMS Administrator based upon the REMS drug ordered by the prescriber.

##### openFDA API

The FDA provides the openFDA Application Programming Interface (API) for querying drug product labeling information. The results from these queries are returned in JSON format. Detailed information about the openFDA API can be found at https://open.fda.gov/apis/. For guidance on using the drug labeling endpoint, one can visit “How to Use the Endpoint” at https://open.fda.gov/apis/drug/label/how-to-use-the-endpoint/. The openFDA API includes endpoints for packaged product National Drug Codes (NDCs) to query specific medication data, including naming information, ingredient information, and packaging information amongst others. 

A recommended API similar to the openFDA API could provide expanded results for REMS drugs that include REMS Administrator and REMS endpoint information. If REMS endpoint information is provided for the CDS Hook URLs, they can be discovered, registered, and accessed by the REMS Prescriber Intermediary to route the request to the correct REMS Administrator based upon the REMS drug ordered by the prescriber.

#### Endpoint Discovery Using an SPL Zip Archive

If an SPL file includes the URL of the CDS Hook that connects the prescriber EHR to the REMS Administrator, the endpoint information can be pulled from the [DailyMed's SPL Resources: Download ALL Indexing & REMS Files](https://dailymed.nlm.nih.gov/dailymed/spl-resources-all-indexing-files.cfm) webpage or from some other resource that consistently provides the submitted REMS SPL files.

##### Existing Reference Value URN Example
To understand the construction of the reference value URN, the below is an example of the REMS Electronic Resource Information embedded in the SPL in the following format: 

```
  <subjectOf>  
      <document> 
          <id root="00000000-0000-0000-0000-000000000006"/>  
          <title>REMS SPL Pilot – NCPDP D0 - Patient Data </title>  
          <text>  
          <reference value="urn:NCPDP:D.0:P1:610674:00000000-0000-0000-0000-000000000005"/>  
          </text>  
      </document>  
  </subjectOf>  
```
 
The reference value contains a URN with the following components: 

- the developer of the standard (e.g., “NCPDP”)  
- the standard version (e.g. “D.0”),  
- the transaction (e.g. “P1”)  
- the destination address, such as a BIN number (e.g., “610674”)  
- the id of a REMS material document which provides instructions for how to carry out the transaction (e.g., “00000000-0000-0000-0000-000000000005") 


##### Example Reference Value URN for a FHIR CDS Hooks Service
Below is an example of how this reference value might be constructed for a FHIR CDS Hooks service: 
`<reference value="urn:HL7:FHIR4.0:rems_cds_discovery:cdshooksserver.remsdrug.com/cds-services" />`
In this case, the components of the URN are as follows:

- the developer of the standard (e.g., "FHIR")  
- the standard version (e.g. “4.0”),  
- the transaction (e.g. “rems_cds_discovery”)  
- the destination address, such as a BIN number (e.g., "cdshoooksserver.remsdrug.com/cds-services")  

The example above lists the “rems_cds_discovery” endpoint as “cdshoooksserver.remsdrug.com/cds-services”. This URL within the URN can be used to reference the CDS Hooks server. The REMS Prescriber Intermediary can query this endpoint with a metadata request for the CapabilityStatement to find all the supported endpoints and capabilities and confirm that the capabilities match those required as described in the CodeX US Medication REMS FHIR IG. 


##### Example Reference Value URN for a FHIR Server
Below is an example of how this reference value might be constructed for a FHIR Server base url: `<reference value="urn:HL7:FHIR4.0:rems_fhir_base:fhirserver.remsdrug.com/fhir/" />`
In this case, the components of the URN are as follows:

- the developer of the standard (e.g., "FHIR")  
- the standard version (e.g. “4.0”),  
- the transaction (e.g. “rems_fhir_base”)  
- the destination address, such as a BIN number (e.g., "fhirserver.remsdrug.com/fhir/")  

The example above lists the “rems_fhir_base” endpoint as “fhirserver.remsdrug.com/fhir”. This URL within the URN can be used to reference the base url for the FHIR server. From this base url all FHIR queries can be completed. This base url can be used by the intermediary for forwarding requests to the `$rems-etasu` and `$questionnaire-package` operations.

#### Endpoint Discovery Using an API

In addition to the REMS Document in SPL, a recommended API similar to the the openFDA API may provide the URL for the REMS Administrator CDS Hooks endpoint. This would in turn be readable by the REMS Prescriber Intermediary allowing for automatic registration of the REMS Administrator Endpoints. 

Like the openFDA API the data elements available include the Generic Name, Brand Name, and packaged product NDC, all of which are queryable elements within this API. Additionally, the recommended API would include data elements for REMS Administrator API Endpoint, REMS Administrator, REMS Approval Date, and REMS Modification Date. A client can search for REMS medication information based on one of the three queriable data element values. The package-specific NDC is most specific and reflective of the codes that will be used in a real-world environment. The REMS Administrator API Endpoint data element (`rems_endpoint`) contains the URL of the REMS Administrator CDS Hooks endpoint for the queried medication. If there is no endpoint supplied, there may be no CDS Hooks endpoint available for the REMS Administrator yet. 

##### Example Output
When queried for the Turalio medication, the following is an example output showing the recommended REMS data elements: 
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">
{
    "meta": {
        "disclaimer": "disclaimer",
        "terms": "terms",
        "license": "license",
        "last_updated": "2025-03-13",
        "results": {
            "skip": 0,
            "limit": 1,
            "total": 1
        }
    },
    "results": [
        {
            "brand_name": "Turalio",
            "generic_name": "PEXIDARTINIB HYDROCHLORIDE",
            "product_ndc": "65597-407",
            "rems_administrator": "REMS Prototype",
            "rems_endpoint": "http://localhost:3003/",
            "rems_approval_date": "20240906",
            "rems_modification_date": "20240906",
            "packaging": [ 
                { 
                "package_ndc": "65597-407-20", 
                "description": "1 BOTTLE in 1 CARTON (65597-407-20)  / 120 CAPSULE in 1 BOTTLE", 
                "marketing_start_date": "20230201", 
                "sample": false 
                }
            ]
        }
    ]
}
</code></pre>
{% endraw %}

<p></p>

##### FHIR Server Endpoint Discovery and Registration

FHIR Server endpoints for the REMS Administrator are recommended for operations such as the out-of-band ETASU check. A second endpoint in the REMS Prescriber Intermediary should be maintained pointing to the REMS Administrator’s FHIR server. This endpoint can be discovered using the methods outlined above but labelled as “fhir_server” instead of “rems_endpoint”. 

#### REMS Administrator Endpoint Registration Updates

The REMS Prescriber Intermediary can periodically retrieve the REMS SPL zip archive to find new REMS medications and their respective CDS Hooks endpoints. This operation could happen on a specific interval, or with a trigger such as being notified when the SPL archive has been updated. The REMS Prescriber Intermediary can also query the recommended API for a newer CDS Hooks endpoint based on the drug packaged product NDC code.

<p></p>

### Security and Privacy

#### FHIR Privacy and Security Guidance
Implementers are expected to...
- follow core [FHIR security principles](https://www.hl7.org/fhir/security.html).
 
- protect patient privacy as described in [FHIR Security and Privacy Considerations](https://www.hl7.org/fhir/secpriv-module.html).

<p></p>
  
#### REMS Workflow-Related Privacy and Security

Provider Systems and REMS Administrators **SHALL** follow guidance defined in...
- the CDS Hooks [Security and Safety](https://cds-hooks.hl7.org/2.0/#security-and-safety) section
- [SMART App Launch  Implementation Guide](https://hl7.org/fhir/smart-app-launch).

#### Prescriber Intermediary Security

The Prescriber Intermediary is useful for forwarding CDS Hooks requests from the EHR to the correct REMS Administrator. Passing the FHIR authorization on to a third party that was not registered with the EHR is a problem. Therefore, the FHIR authorization **shall** be stripped from the hook request before being forwarded to the REMS Administrator. This can leave a problem with the prefetch not properly being populated. In this case, the intermediary **shall** populate the prefetch using the FHIR authorization that it had stripped from the hook. This will provide all needed information to the REMS Administrator in order to process the hook request.
 
<p></p>
<p></p>



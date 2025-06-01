This page gives guidelines for populating and returning CDS Hooks response Cards in a REMS workflow. 

[Cards](https://cds-hooks.hl7.org/2.0/#cds-service-response) are how REMS Administrator Systems return information and requested actions (e.g., launching a SMART app) to the provider in response to requests triggered during the prescriber's workflow. 

REMS Administrator Systems dynamically create these Cards for each CDS Hooks request based on conditions including:
- the prescribed drug's REMS program
- the status of required REMS steps at the time of the event
- REMS information needs associated with the current point in the patient's treatment. 
- Ability of optionally provided Pharmacy to dispense desired REMS medication.

This guidance is based on [the CDS Hooks specification](https://cds-hooks.hl7.org/2.0/#card-attributes) as applied to the REMS workflow. In addition, this guide aims to provide direction that is consistent with that given in the Da Vinci Coverage Requirements Discovery (CRD) IG to the extent possible (as described further [here](technical-background.html#consistency-with-the-da-vinci-burden-reduction-igs)).

<p></p>

### General Card Population Guidance
All Card types, including the Suggestion type containing a system Action as described in the [Deferred SMART Application Launch](#deferred-smart-application-launch-suggestion) section  below, are presented to the provider within the workflow of their Provider System. They:
- display information
- offer links that the provider may follow to external information
- give the provider the option to complete a task by launching a SMART app immediately 
- or give the provider the option to place the SMART app step in their work queue to be completed in the future.

In all cases, Cards interrupt the provider's workflow and will be welcomed by the provider only when they are pertinent to the situation, when their benefit outweighs the disruption to the provider's thought process, and when their content can be quickly understood and acted upon.

<p></p>

**General guidelines for a REMS Administrator System returning Cards:**

*  The `Card.indicator` denotes the urgency or importance of what the Card conveys. It **SHOULD** be populated from the perspective of _clinical importance and/or risk_ to the patient, versus importance from an administrative perspective. For example, while a REMS Administrator might perceive a provider not being registered for a REMS Program as very important and urgent from the perspective of being able to prescribe and dispense a REMS drug, it would be, at most, a `warning` to the user according to the conventions for presenting Cards. The indicator value, `critical`, must be reserved for reporting the risk of life or death or other serious clinical outcomes. Most REMS responses **SHOULD** be marked as `info`.

*  The `Card.source.label` **SHOULD** be populated with the name of the REMS program that the user and patient would recognize. In general this would be based on the name of the drug being requested.  

*  Because providers' time is limited, information returned in Cards must be quickly understandable and pertinent to the request context, the current state of the patient's treatment and the status of REMS requirements. Specifically:

    *  `Card.summary` **SHOULD** provide consise but actionable information. "Not Enrolled" would not be very helpful, because it is not complete enough to identify the problem fully and would require a further step by the provider to learn who or what is not registered. "Provider must enroll in the Drug X REMS program" or "Patient must enroll before taking Drug X" would be better.

    *  `Card.detail` **SHOULD** present information in the order of importance to the provider, with the most critical details first and less critical information following.

    *  `Card.detail` **SHOULD** provide sufficient context for the provider to quickly understand the purpose or content of presented links. In addition, the detail should provide a clear sense of how the provider will be expected to use or interact with the link or app after they open it. This will enable the provider to determine whether they need to take action immediately during the workflow versus deferring until later.

    *  The number of Cards should be manageable. Consider whether user workflow will be faster with separate Cards for each link or a single Card having multiple links. Typically, it's best to use the smallest number of Cards that can convey the information and requested actions.

    *  When providing links, keep document size short and/or provide linking directly to the section that is relevant for the context to minimize the time needed for the provider to read the critical information.

    *  While links are permitted in the markdown content of `Card.detail`, support for this is not universal, so links **SHOULD** also be provided in `Card.link`. This also provides a consistent place for users to access all relevant links.

    *  If a Pharmacy was provided in the prefetch, the `Card.detail` **SHOULD** include information about the pharmacy. This includes information about the status of the Pharmacy with the specific REMS program and if the medication can be dispensed or not.

* Provider Systems might not support all Card capabilities; therefore Card options **SHOULD** provide sufficient information for a user to take appropriate actions manually if automated support isn't available.

<p></p>

### Potential REMS CDS Hooks Response Types
Note: While the Card types and content described below are what REMS Administrators will typically return in a REMS workflow, implementers are not limited to these options.

<p></p>

#### External Reference
This response type presents a Card with one or more links to external web pages, PDFs, or other resources that provide relevant information with regards to the REMS program the CDS Hook was executed for. A link might provide information about the program, requirements for safe use,  printable forms, etc. Typically, these references would be links to information available from the REMS Administrator's website or other authoritative sources.  The Card **SHALL** have at least one `Card.link`.  The `Link.type` **SHALL** have a type of "absolute".

When reasonable, an "External Reference" Card **SHOULD** contain a summary of the actionable information from the external reference.

For example, this CDS Hooks [Card](https://cds-hooks.hl7.org/2.0/#cds-service-response) contains five [Links](https://cds-hooks.hl7.org/2.0/#link) - a link to an overview website, a link to a PDF containing a guide for the medication itself, a link to PDF that specifics the REMS program information, a link to a PDF that contains adverse event management and a link to a provider enrollment form.  

{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.uuid">uuid</a>" : "urn:uuid:07bc9814-9d2a-11ee-8c90-0242ac120002",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "DRUG-X REMS Program and Requirements",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.detail">detail</a>" : "Learn about the DRUG-X REMS Program and Requirements",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X REMS Program Administrator",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.org/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.topic">topic</a>" : {
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/us/davinci-crd/CodeSystem/temp",
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "guideline",
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.display">display</a>" : "Guideline"
    }
  },
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links">links</a>" : [
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Program Overview" ,
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/Overview",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Medication Guide",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/MedicationGuide.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Program Requirements",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/RemsProgramRequirements.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X Adverse Reaction Management Guide",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/AdverseReactionManagment.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "Provider Enrollment Form",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/ProviderEnrollmentForm.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    }
  ]
}</code></pre>
{% endraw %}

As much as technically possible, links provided **SHOULD** take the user to the specific place in the documentation relevant to the current hook context to minimize provider reading and navigation time.

<p></p>

#### Instructions
This response type presents a Card with textual guidance or instructions to display to the provider. The text might provide information related to updated REMS guidelines, notifying the user of a need to update a self-assessment or even something as simple as "No REMS requirements currently require action". 

Instructions **SHOULD** reflect the current status of the patient's and provider's participation in the REMS program--providing only applicable direction at the time of the request. The instruction text **SHOULD** be concise and simple for the provider to consume, omitting any general guidance that is not relevant to the situation. To accomplish this, the text returned might need to be generated uniquely each time a hook is fired.

Care should be taken not to overuse this return type with information that is not truly relevant. 

This example CDS Hook [Card](https://cds-hooks.hl7.org/2.0/#cds-service-response) just contains a message:

{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "Provider Mary Zhang must re-enroll in the DRUG-X REMS program by December 15",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.detail">detail</a>" : "Your enrollment in the DRUG-X REMS program must be renewed annually. The deadline for Mary Zhang MD is December 15",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X Rems Program",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.org/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.icon">icon</a>" : "https://example.org/img/icon-100px.png"
  }
}</code></pre>
{% endraw %}

<p></p>

#### Launch SMART application
Unlike External References, SMART apps can be launched within the Provider System workflow and use data from the Provider System to support their features. They allow interaction between the REMS Administrator and Provider System and can be authorized to access patient clinical data to help guide the interactive experience and minimize data entry. Apps can provide a wide variety of functions in the REMS workflow, including patient enrollment, providing education, collecting periodic clinical information required by the REMS, etc. 

Card population for this response type is similar to the [External Reference](#external-reference) response type, except with the `Link.type` set to "smart" instead of "absolute". The `Link.appContext` will typically also be present, providing context information that is useful to the app, which will be included when the EHR launches it.

For example, the Card below contains a SMART App [Link](https://cds-hooks.hl7.org/2.0/#link) to enroll the patient into the REMS program:

{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.uuid">uuid</a>" : "urn:uuid:353cd963-2ecd-46f9-958b-ed7d2bbf6e01",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "Launch DRUG-X REMS Patient Enrollment App",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X REMS Administrator",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.org/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.icon">icon</a>" : "https://example.org/img/icon-100px.png"
  },
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links">links</a>" : [
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Patient Enrollment Application",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/smart-app",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "smart",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.appContext">appContext</a>" : "{\"providerSystemPatientId\":\"123\"}"
    }
  ]
}</code></pre>
{% endraw %}

<p></p>

**Note regarding app registration.** To be made available to providers within a Provider System, SMART apps need to first be approved by the provider organization and, typically, also the associated software vendor.  

<p></p>

#### Deferred SMART Application Launch Suggestion
This response type can be used to present a Card that indicates there is a SMART application that can be launched at a future time to satisfy a REMS step.  A recommended use within the REMS workflow is to defer launching of a SMART app for enrolling the provider or patient into the REMS program.

This is accomplished by including a `suggestion` within a CDS Card that includes a `create` action for a Task resource. 

Note that this `suggestion` may reside within the same Card that contains a `link` to launch the app immediately, giving the provider a choice of launching the app now or later.

The Task resource: 
  - is based on either the [Task EHR Launch](https://hl7.org/fhir/smart-app-launch/StructureDefinition-task-ehr-launch.html) or [Task EHR Standalone](https://hl7.org/fhir/smart-app-launch/StructureDefinition-task-standalone-launch.html) profiles from the [SMART App Launch IG](https://hl7.org/fhir/smart-app-launch)
- has a `Task.code` of either  `launch-app-ehr` or `launch-app-standalone` 
- points to the SMART application to launch using a `Task.input` element with a `Task.input.type.coding.code` value of `smartonfhir-application`
- includes an additional `Task.input` element with a `Task.input.type.coding.code` of `smartonfhir-appcontext` which will hold the application context to use to launch the SMART application with. 

This guide defines a [Task profile which further tailors the resource for use in the REMS workflow](StructureDefinition-medication-rems-task-smart-launch.html).
 
The example below shows a CDS Hook [Suggestion](https://cds-hooks.hl7.org/2.0/#suggestion) containing a SMART application launch Task as the Card's [Action](https://cds-hooks.hl7.org/2.0/#action).  

<!-- TODO include Binary-CRDServiceResponse2-form-json-html.xhtml -->
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.uuid">uuid</a>" : "urn:uuid:353cd963-2ecd-46f9-958b-ed7d2bbf6e01",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "Defer DRUG-X patient enrollment until later,
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X REMS Administrator",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.org/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.icon">icon</a>" : "https://example.org/img/icon-100px.png"
  },
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions">suggestions</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.label">label</a>" : "Put the DRUG-X enrollment app in your work queue to complete later",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions">actions</a>" : [
      {
        "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions.type">type</a>" : "create",
        "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions.description">description</a>" : "Add deferred SMART Launch for DRUG-X to the work queue",
        "<a href="http://hl7.org/fhir/R4/task.html#Task">resource</a>" : {
          "<a href="http://hl7.org/fhir/R4/task.html">resourceType</a>" : "Task",
          "<a href="http://hl7.org/fhir/R4/task.html#Task.status">status</a>" : "requested",
          "<a href="http://hl7.org/fhir/R4/task.html#Task.intent">intent</a>" : "proposal",
          "<a href="http://hl7.org/fhir/R4/task.html#Task.code">code</a>" : {
            "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
              {
                "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
                "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "launch-app-ehr",
                 "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "Launch application using the SMART EHR launch"
              }
            ]
          },
          "<a href="http://hl7.org/fhir/R4/task.html#Task.description">description</a>" : "Complete DRUG-X REMS enrollment",
          "<a href="http://hl7.org/fhir/R4/task.html#Task.for">for</a>" : {
            "<a href="http://hl7.org/fhir/R4/references.html#Reference#Reference.reference">reference</a>" : "http://example.org/fhir/Patient/123"
          },
          "<a href="http://hl7.org/fhir/R4/task.html#Task.authoredOn">authoredOn</a>" : "2024-02-13",
          "<a href="http://hl7.org/fhir/R4/task.html#Task.for">requester</a>" : {
            "<a href="http://hl7.org/fhir/R4/references.html#Reference#Reference.reference">reference</a>" : "http://example.org/fhir/Organization/rems-administrator/100",
            "<a href="http://hl7.org/fhir/R4/references.html#Reference#Reference.reference">display</a>" : "DRUG-X REMS Administrator"        
          },
          "<a href="http://hl7.org/fhir/R4/task.html#Task.input">input</a>" : [
            {
              "<a href="http://hl7.org/fhir/R4/task.html#Task.input.type">type</a>" : {
                "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
                  {
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "smartonfhir-application",
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "SMART on FHIR application URL."
                  }
                ]
              },
              "<a href="http://hl7.org/fhir/R4/task.html#Task.input.value[x]">valueString</a>" : "https://example.org/DRG-X/smart-application"
            },
            {
              "<a href="http://hl7.org/fhir/R4/task.html#Task.input.type">type</a>" : {
                "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
                  {
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "smartonfhir-appcontext",
                    "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "Application context related to this launch."                  
                   }
                 ]
               },
               "<a href="http://hl7.org/fhir/R4/task.html#Task.input.value[x]">valueString</a>" : "{\"providerSystemPatientId\":\"123\"}"
            }
          ]
        }
      }
    ]
  }
}
</code></pre>
{% endraw %}

<p></p>
<p></p>
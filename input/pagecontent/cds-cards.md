### Profiles of CDS Response Cards and System Actions

CDS Hooks [Cards](https://cds-hooks.hl7.org/#cds-service-response) are the means by which REMS Administrator Systems return information and requested actions (e.g., launching a SMART app) to the provider in response to requests triggered during the prescriber's workflow. 

REMS Administrator Systems will populate these Cards according to the prescribed drug's REMS program, the status of required REMS steps at the time of the event, information needs driven by the patient's treatment, etc. This page gives guidelines for populating and using these Cards in a REMS workflow. 

This guidance is based on [the CDS Hooks specification](https://cds-hooks.hl7.org/#card-attributes), plus considerations specific to the REMS workflow. In addition, this guide also aims to provide direction that is consistent with that given in the Da Vinci Coverage Requirements Discovery IG, to the extent possible (as described further [here](technical-background.html#use-of-cds-hooks)).

**The following guidelines apply to Cards returned in response to a REMS-related CDS Hooks request:**

*  The `Card.indicator` denotes the urgency or importance of what the card conveys. It **SHOULD** be populated from the perspective of clinical importance and/or risk to the patient, versus importance to the associated REMS program. For example, while a REMS Administrator System might perceive a Provider not being registered for the a REMS Program as 'critical' from the perspective of being able to prescribe and dispense a drug, it would at most be a 'warning' to the user--from the perspective of clinical care.  The `indicator` value, 'critical', must be reserved for reporting the risk of life or death or other serious clinical outcomes. Most REMS responses **SHOULD** be marked as 'info'.

*  The `Card.source.label` **SHOULD** be populated with the name of the REMS program that the user and patient would recognize. In general this would be based on the name of the medication being requested.  

*  Because providers' time is limited, information returned in Cards must be quickly understandable and pertinent to the request context, the current state of the patient's treatment and the status of REMS requirements. Specifically:

    *  `Card.summary` **SHOULD** provide consise but actionable information. "Not Enrolled" would not be very helpful, because it is not complete enough to identify the problem fully and would require a further step by the provider to learn who or what is not registered. "Provider must enroll in the Drug X REMS program" or "Patient must enroll before taking Drug X" would be better.

    *  `Card.detail` **SHOULD** present information in the order of importance to the provider, with the most critial details first and less critical information following.

    *  `Card.detail` **SHOULD** provide sufficient context for the provider to quickly understand the purpose or content of presented links. In addition, the detail should provide a clear sense of how the provider will be expected to use or interact with the link or app after they open it. This will enable the provider to determine whether they need to take action immediately during the workflow versus deferring until later.

    *  The number of cards should be manageable. Consider whether user workflow will be faster with separate cards for each link or a single card having multiple links. Typically, it's best to use the smallest number of cards that can convey the information and requested actions.

    *  When providing links, keep document size short and/or provide linking directly to the section that is relevant for the context in order to minimize the time needed for the provider to read the critial information.

    *  While links are permitted in the markdown content of `Card.detail`, support for this is not universal, so links **SHOULD** also be provided in `Card.link`. This also provides a consistent place for users to access all relevant links.

* Provider Systems might not support all card capabilities; therefore card options **SHOULD** provide sufficient information for a user to take appropriate actions manually if automated support isn't available.


### Potential REMS CDS Hooks Response Types

### External Reference
This response type presents a Card with one or more links to external web pages, PDFs, or other resources that provide relevant information with regards to the REMS program the CDS Hook was executed for. A link might provide information about the program, requirements for safe use,  printable forms, etc. Typically, these references would be links to information available from the REMS Administrator's website or other authoritative sources.  The card **SHALL** have at least one `Card.link`.  The `Link.type` **SHALL** have a type of "absolute".

When reasonable, an "External Reference" card **SHOULD** contain a summary of the actionable information from the external reference.

For example, this CDS Hooks [Card](https://cds-hooks.hl7.org/#cds-service-response) contains five [Links](https://cds-hooks.hl7.org/#link) - a link to an overview website, a link to a PDF containing a guide for the medication itself, a link to PDF that specifics the REMS program information, a link to a PDF that contains adverse event management and a link to a provider enrollment form.  

<!-- TODO include Binary-CRDServiceResponse-links-json-html.xhtml -->
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
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Medication Guide,
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/MedicationGuide.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
        {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X Adverse Reaction Management Guide",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/AdverseReactionManagment.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    }
    ,{
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "Provider Enrollment Form",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/ProviderEnrollmentForm.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    }
  ]
}</code></pre>
{% endraw %}

As much as technically possible, links provided **SHOULD** take the user to the specific place in the documentation relevant to the current hook context to minimize provider reading and navigation time.


### Instructions
This response type presents a Card with textual guidance or instructions to display to the provider. The text might provide information related to updated REMS guidelines, notifying the user of an need to update a self assessment or even something as simple as "No REMS requirements currently require action". 

Instructions **SHOULD** reflect the current status of the patient's and provider's participation in the REMS program--providing only applicable direction at the time of the request. The instruction text **SHOULD** be concise and simple for the provider to consume, omitting any general guidance that is not relevant to the situation. To accomplish this, the text returned might need to be generated uniquely each time a hook is fired.

Care should be taken not to overuse this return type with information that is not truly relevant. 

This example CDS Hook [Card](https://cds-hooks.hl7.org/#cds-service-response) just contains a message:

<!-- TODO include Binary-CRDServiceResponse-info-json-html.xhtml -->
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

### Launch SMART application
Unlike External References, SMART apps can be launched within the Provider System workflow and use data from the Provider System to support their features. They allow more sophisticated interaction between payers and providers than simple external links. They provide full control over user interface, workflow, etc. and can be authorized to access patient clinical data to help guide the interactive experience and minimize data entry.  Apps can provide a wide variety of functions in the REMS workflow, including patient enrollment, providing education, etc.

To be made available to providers within a Provider System, SMART apps need to first be approved by the provider organization and, typically, also the associated software vendor.  

This response type is similar to the [External Reference](#external-reference) response type, except with the `Link.type` set to "smart" instead of "absolute". The `Link.appContext` will typically also be present, providing context information that is useful to the app, which will be included when the EHR launches it.

For example, this [Card](https://cds-hooks.hl7.org/#cds-service-response) contains a SMART App [Link](https://cds-hooks.hl7.org/#link) to enroll the patient into the REMS program:

<!-- TODO include Binary-CRDServiceResponse2-smart-json-html.xhtml -->
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
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.appContext">appContext</a>" : "{\&quot;providerSystemPatientId\&quot;:\&quot;205f471f-f408-45d4-9213-0eedf95f417f\&quot;}"
    }
  ]
}</code></pre>
{% endraw %}

### Deferred Launch SMART application
This response type can be used to present a Card that indicates there is a SMART Application that can be launched at a future time to achieve some goal.  In general for the REMS workflows, this card type will be used to defer launching of a SMART application for the purpose of enrolling the provider or patient in a REMS program or for the collection of periodic clinical information to ensure the safe use of a medication as may be required by the REMS. 

This suggestion will always include a "create" action for a Task resource. The Task will be either a `task-ehr-launch` or a `task-standalone-launch` as defined by the [SMART App Launch IG](https://hl7.org/fhir/smart-app-launch/task-launch.html).  The Task will point to the SMART application to launch using a Task.input element with a Task.input.type.coding.code of "smartonfhir-application". The Task will include an additional Task.input element with a Task.input.type.coding.code of "smartonfhir-appcontext" which will hold the application context to use to launch the SMART application with. 

<table class="grid">
  <thead>
    <tr>
      <th>SMART Task Profiles</th>
      <th>US Core Profiles</th>
    </tr>
  </thead>
  <tr>
    <td><a href="https://hl7.org/fhir/smart-app-launch/task-launch.html">task launch</a></td>
    <td/>
  </tr>
</table>

The following is an example CDS Hook [Suggestion](https://cds-hooks.hl7.org/#suggestion), with the specified SMART application.  This [Action](https://cds-hooks.hl7.org/#action) only contains the FHIR [Task]({{site.data.fhir.path}}task.html) resource.  

<!-- TODO include Binary-CRDServiceResponse2-form-json-html.xhtml -->
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.label">label</a>" : "Add deferred SMART Launch for DRUG-X to the task list (possibly for reassignment)",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions">actions</a>" : [
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions.type">type</a>" : "create",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.suggestions.actions.description">description</a>" : "Add deferred SMART Launch for DRUG-X to the task list",
      "<a href="http://hl7.org/fhir/R4/task.html#Task">resource</a>" : {
        "<a href="http://hl7.org/fhir/R4/task.html">resourceType</a>" : "Task",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.status">status</a>" : "requested",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.intent">intent</a>" : "proposal",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.code">code</a>" : {
          "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
            {
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "launch-ehr-app",
               "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "Launch application using the SMART EHR launch"
            }
          ]
        },
        "<a href="http://hl7.org/fhir/R4/task.html#Task.description">description</a>" : "Complete DRUG-X REMS Registration",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.for">for</a>" : {
          "<a href="http://hl7.org/fhir/R4/references.html#Reference#Reference.reference">reference</a>" : "http://example.org/fhir/Patient/123"
        },
        "<a href="http://hl7.org/fhir/R4/task.html#Task.authoredOn">authoredOn</a>" : "2024-02-13",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.input">input</a>" : [
          {
            "<a href="http://hl7.org/fhir/R4/task.html#Task.input.type">type</a>" : {
              "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
                {
                  "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
                  "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "smartonfhir-application",
                  "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "SMART on FHIR application URL"
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
             "<a href="http://hl7.org/fhir/R4/task.html#Task.input.value[x]">valueString</a>" : "{\"field\":\"value\"}"
          }
        ]
      }
    }
  ]
}</code></pre>
{% endraw %}

<p></p>

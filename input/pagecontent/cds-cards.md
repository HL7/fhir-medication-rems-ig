### Profiles of CDS Response Cards and System Actions

[Cards](https://cds-hooks.hl7.org/2.0/#cds-service-response) serve as the mechanisms that REMS Administration systems will use to return information to the REMS Client related to the REMS Program the CDS Hook is being invoked for.  This page profiles the general rules for Cards as the pertain to this specification. 

In addition to the [guidance provided in the CDS Hooks specification](https://cds-hooks.hl7.org/2.0/#card-attributes), the following additional guidance applies to REMS Administration Systems when constructing cards: 

Note that the Da Vinci CRD Implementation Guide was used as the basis for this information and modified to suite the needs of the REMS workflows. The goal is to stay inline with the CRD IG as much as possible but provide direction on how to use those specifications within the context of the REMS workflows. For instance, the Response Types listed below that came from the CRD IG are essentially the same as in the CRD IG, but provide examples of how to use for REMS and documentation on extectations for REMS vs coverage information. 


*  The `Card.indicator` **SHOULD** be populated from the perspective of the clinical decision maker, not the REMS Administrator. While a REMS Administration system might perceive a Provider not being registered for the a REMS Program as 'critical' from the perspective of being able to prescribe and dispense a drug, it would at best be a 'warning' to the user from a perspective of clinical care.  'critical' must be reserved for reporting life or death or serious clinical outcomes. Most REMS responses **SHOULD** be marked as 'info'.d

*  The `Card.source.label` **SHOULD** be populated with the name of the REMS program that the user and patient would recognize. In general this would be based on the name of the medication being requested.  


*  Users are busy.  Time spent reading a payer-returned card is inevitably time not spent reviewing other information or interacting with the patient.  If not useful or relevant, users will quickly learn to ignore - or even demand the disabling of - payer-provided alerts.  Therefore, information must be delivered efficiently and be tuned to provide maximum relevance.  Specifically:

    *  `Card.summary` **SHOULD** provide actionable information.  "Not Registered" would not be very helpful. "Provider not registered for " or "Prior authorization required" would be better.

    *  `Card.detail` **SHOULD** provide graduated information, with critical information being provided in the first paragraph and less critical information towards the end of the page.

    *  `Card.detail` **SHOULD** provide enough context that a user can determine whether it is worth the precious seconds to launch an app or external link or not - ideally providing a sense of where to look for and how to use whatever link or app they do launch in the specific context of the order they're making at the time.

    *  Keep the number of cards manageable.  Consider whether user workflow will be faster with separate cards for each link or a single card having multiple links.  Typically, using the smallest number of cards that still support descriptive actionable summaries is best.

    *  When providing links, don't send the user to the first page of an 80+ page PDF.  Keep document size short and/or provide linking directly to the section that is relevant for the context.

    *  While links are permitted in the markdown content of `Card.detail`, support for this is not universal, so links **SHOULD** also be provided in `Card.link`.  This also provides a consistent place for users to access all relevant links.

* REMS Client systems might not support all card capabilities, therefore card options **SHOULD** provide sufficient information for a user to perform record changes manually if automated support isn't possible.


### Potential REMS Response Types

### External Reference
This response type presents a Card with one or more links to external web pages, PDFs, or other resources that provide relevant information with regards to the REMS program the CDS Hook was executed for.  The links might provide information about the program, requirements for safe use,  printable forms, etc. Typically, these references would be links to information available from the REMS Administration Systems website other authoritative sources.  The card **SHALL** have at least one `Card.link`.  The `Link.type` **SHALL** have a type of "absolute".

When reasonable, an "External Reference" card **SHOULD** contain a summary of the actionable information from the external reference.

For example, this CDS Hooks [Card](https://cds-hooks.hl7.org/2.0/#cds-service-response) contains five [Links](https://cds-hooks.hl7.org/2.0/#link) - a link to an overview website, a link to a PDF containing a guide for the medication itself, a link to PDF that specifics the REMS program information, a link to a PDF that contains adverse event management and a link to a provider enrollment form.  

<!-- TODO include Binary-CRDServiceResponse-links-json-html.xhtml -->
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.uuid">uuid</a>" : "urn:uuid:07bc9814-9d2a-11ee-8c90-0242ac120002",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "DRUG-X REMS Program and Requirements",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.detail">detail</a>" : "Learn about the DRUG-X REMS Program and Requirements",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X REMS Program Administrator",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.com/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.topic">topic</a>" : {
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/us/davinci-crd/CodeSystem/temp",
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "guideline",
      "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.display">display</a>" : "Guideline"
    }
  },
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links">links</a>" : [
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Program Overview" ,
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.com/DRUG-X/Overview",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Medication Guide,
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.com/DRUG-X/MedicationGuide.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    },
        {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X Adverse Reaction Management Guide",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.com/DRUG-X/AdverseReactionManagment.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    }
    ,{
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "Provider Enrollment Form",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.com/DRUG-X/ProviderEnrollmentForm.pdf",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "absolute"
    }
  ]
}</code></pre>
{% endraw %}

As much as technically possible, links provided **SHOULD** take the user to the specific place in the documentation relevant to the current hook context to minimize provider reading and navigation time.


### Instructions
This response type presents a `Card` with textual guidance to display to the user making the decisions. The text might provide information related to updated REMS guidelines, notifying the user of an need to update a self assessment or even something as simple as "No special coverage requirements". It can be generated in a more sophisticated context for the REMS Administrator, while remaining simple to consume for the provider because it more easily allows returned information to be tuned to the specific context of the order/encounter that triggered the hook. In some cases, the text returned might be generated uniquely each time a hook is fired.

Care should be taken not to overuse this return type with information that is not truly relevant. For instance, if a REMS Administration system somehow receives a request for a DRUG it does not manage the REMS program for, returning a card that states something to the fact of "DRUG-X has no REMS associated with it" is not helpful and more likely adds to distraction. 

This example CDS Hook [Card](https://cds-hooks.hl7.org/2.0/#cds-service-response) just contains a message:

<!-- TODO include Binary-CRDServiceResponse-info-json-html.xhtml -->
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "DRUG-X has a REMS Program annual ",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.detail">detail</a>" : "You are currently registered with the DRUG-X Rems Program. ",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X Rems Program",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.com/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.icon">icon</a>" : "https://example.com/img/icon-100px.png"
  }
}</code></pre>
{% endraw %}

### Launch SMART application
SMART apps allow more sophisticated interaction between payers and providers.  They provide full control over user interface, workflow, etc.  With permission, they can also access patient clinical data to help guide the interactive experience and minimize data entry.  Apps can provide a wide variety of functions, including eligibility checking, guiding users through form entry, providing education, etc.

All such apps will need to go through the approval processes for the client's provider organization and typically, also the associated software vendor.  This response type can cause the launching of such apps to occur in the context in which they are relevant to patient care and/or to payment-related decision-making.

This response type is just a modified version of the [External Reference](#external-reference) response type.  However, the `Link.type` will be "smart" instead of "absolute".  The `Link.appContext` will typically also be present.  

NOTE: 

For example, this [Card](https://cds-hooks.hl7.org/2.0/#cds-service-response) contains a SMART App [Link](https://cds-hooks.hl7.org/2.0/#link) to perform an opioid assessment:

<!-- TODO include Binary-CRDServiceResponse2-smart-json-html.xhtml -->
{% raw %}
<pre class="json" style="white-space: pre;"><code class="language-json">{
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.uuid">uuid</a>" : "urn:uuid:353cd963-2ecd-46f9-958b-ed7d2bbf6e01",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.summary">summary</a>" : "Launch DRUG-X REMS Application",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.indicator">indicator</a>" : "info",
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source">source</a>" : {
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.label">label</a>" : "DRUG-X REMS Administrator",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.url">url</a>" : "https://example.com/DRUG-X",
    "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.source.icon">icon</a>" : "https://example.com/img/icon-100px.png"
  },
  "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links">links</a>" : [
    {
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.label">label</a>" : "DRUG-X REMS Application",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.url">url</a>" : "https://example.org/DRUG-X/smart-app",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.type">type</a>" : "smart",
      "<a href="https://build.fhir.org/ig/FHIR/fhir-tools-ig//StructureDefinition-CDSHooksResponse.html#CDSHooksResponse.cards.links.appContext">appContext</a>" : "{\&quot;payerXYZQNum\&quot;:\&quot;205f471f-f408-45d4-9213-0eedf95f417f\&quot;}"
    }
  ]
}</code></pre>
{% endraw %}

### Deferred Launch SMART application
This response type can be used to present a Card that indicates there is a SMART Application that can be launched at a future time to achieve some goal.  In general for the REMS workflows, this card type will be used to defer launching of a SMART application for the purpose of registering providers or patients on a REMS program or for the collection of periodic clinical information to ensure the safe use of a medication as may be required by a REMS program. 

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

The following is an example CDS Hook [Suggestion](https://cds-hooks.hl7.org/2.0/#suggestion), with the specified SMART application.  This [Action](https://cds-hooks.hl7.org/2.0/#action) only contains the FHIR [Task]({{site.data.fhir.path}}task.html) resource.  

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
          "<a href="http://hl7.org/fhir/R4/references.html#Reference#Reference.reference">reference</a>" : "http://example.org/fhir/Provider/123"
        },
        "<a href="http://hl7.org/fhir/R4/task.html#Task.authoredOn">authoredOn</a>" : "2024-02-13",
        "<a href="http://hl7.org/fhir/R4/task.html#Task.input">input</a>" : [
          "<a href="http://hl7.org/fhir/R4/task.html#Task.input.type">type</a>" : {
          "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
            {
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "smartonfhir-application",
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "SMART on FHIR application URL"
              
            }
          ],
           "<a href="http://hl7.org/fhir/R4/task.html#Task.input.value[x]">valueString</a>" : "https://example.com/DRG-X/smart-application"
        },
          "<a href="http://hl7.org/fhir/R4/task.html#Task.input.type">type</a>" : {
          "<a href="http://hl7.org/fhir/R4/datatypes.html#CodeableConcept#CodeableConcept.coding">coding</a>" : [
            {
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.system">system</a>" : "http://hl7.org/fhir/smart-app-launch/CodeSystem/smart-codes",
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.code">code</a>" : "smartonfhir-appcontext",
              "<a href="http://hl7.org/fhir/R4/datatypes.html#Coding#Coding.description">display</a>" : "Application context related to this launch."
              
            }
          ],
            "<a href="http://hl7.org/fhir/R4/task.html#Task.input.value[x]">valueString</a>" : "{field:'value'}"
          }
        ]
      }
    }
  ]
}</code></pre>
{% endraw %}


### Other considerations 
Important to note is that the DaVinci CRD specification outlines other return types related to filling out forms via FHIR Questionnaires.  While there are no examples provided here, there is nothing within this specification that precludes the use of that return type for a REMS workflow.


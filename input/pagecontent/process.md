### Process Steps and Timeframes
REMS program requirements vary widely for different medications. Some programs focus on making providers and patients aware of potential risks, while others require additional steps, authorizations, reporting or other actions at the start of treatment or during ongoing therapy.

This IG uses the following generalized set of timeframes and steps to provide context to its guidance. The aim is to provide enough detail to give direction and make necessary distinctions--but generalize enough so that references to a step or timeframe can cover the range of specific actions that participants might take for different REMS programs.

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: Generalized REMS Process Flow</strong></figcaption>
  <br />
  <p>
  <img src="flow.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

<p></p>
Additional details and possible variations for each step in the process flow are shown below.
<p></p>

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Process Activities</strong></figcaption>
  <br />
  <p>
  <img src="steps.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>


### Process Focus Areas

**Reusable Patterns.** This guide establishes information sharing patterns that can be applied at multiple points in the REMS process outlined above. These patterns enable a REMS participant to implement a standard "interface" that can be called multiple times during a patient's therapy--using the same basic methods but with varying inputs and response content depending on the situation.
- see [Technical Background](technical-background.html) for more about the guide's architectural approach.

**Prescriber Focus.** The primary focus of this implementation guide is improving information exchange and minimizing manual steps for the prescriber. The exchange patterns defined in the guide can be used at the start of therapy and at later encounters during the patient's treatment. 
 
**Potential to Support Other Participants' Needs**. It is possible that the patterns described in this guide might be adaptable to interactions between REMS Administrators and other parties involved in fulfilling a REMS prescription, such as pharmacists or distributors. While the guidance contained here was not tested for use by participants other than prescriber systems and REMS Administrators, other REMS stakeholders are free to adapt it to their needs where possible.


<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: Implementation Guide Focus Areas</strong></figcaption>
  <p>
  <img src="focus-areas.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>



### Terms Used in This Guide
Below are terms and wording conventions used throughout this implementation guide.

- "REMS" and "REMS program" are used interchangeably to refer to a Risk Evaluation and Mitigation Strategy (REMS)--a drug safety program that the United States Food and Drug Administration (FDA) requires for medications with serious safety concerns.
- The terms “medication” and “drug” refer to prescription drugs and prescription biologics.
- The guide uses “prescriber” throughout to represent the health care provider or other authorized party acting on their behalf that prescribes or orders the REMS drug.
- The guide uses “pharmacist” throughout to represent the dispensing pharmacist, other authorized pharmacy staff, the associated certified pharmacy or health care facility or operating organization
<p></p>


### REMS Within the E-Prescribing Process
Nearly all drug prescriptions in the United States are transmitted electronically to pharmacies. Those data exchanges and other related medication management interactions are conducted using a set of federal standards and other conventions that enable consistent, nationwide exchange.

This section: 
- overviews these e-prescribing interactions
- describes where REMS steps fit in
- provides guidance for integrating related FHIR and NCPDP SCRIPT exchanges


### REMS Within the Context of E-Prescribing

#### Populating REMS IDs / etc. in the SCRIPT prescription

#### Populating FHIR based on SCRIPT prescription data 
(e.g., for submission in a CDS request)

#### Other Supporting SCRIPT Messages
e.g., pharmacy-to-prescriber request to complete unmet REMS requirements (RxChangeRequest)

<p></p>

_To be completed_
<p></p>

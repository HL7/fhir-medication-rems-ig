### Process Steps and Timeframes
REMS program requirements vary widely for different medications. Some programs focus on making providers and patients aware of potential risks, while others require additional steps, authorizations, reporting, or other actions at the start of treatment or during ongoing therapy.

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

- "REMS" and "REMS program" are used interchangeably to refer to a Risk Evaluation and Mitigation Strategy (REMS) -- a drug safety program that the United States Food and Drug Administration (FDA) requires for medications with serious safety concerns.
- The terms “medication” and “drug” refer to prescription drugs and prescription biologics.
- The guide uses “prescriber” throughout to represent the health care provider that orders the REMS drug , their staff, or another authorized party acting on their behalf to perform REMS-related activities.
- The guide uses “pharmacist” throughout to represent the dispensing pharmacist, other authorized pharmacy staff, the associated certified pharmacy or health care facility or operating organization.

<p></p>

### REMS Within the E-Prescribing Process
Nearly all drug prescriptions in the United States are transmitted electronically to pharmacies. Those data exchanges and related medication management interactions are conducted using a set of federally-named standards and other conventions that enable consistent, nationwide exchange. This guide does not redefine the means for transmitting a drug request from the provider to a pharmacy and prescriber systems are expected to continue using named standards such as NCPDP SCRIPT for transmission of electronic REMS prescriptions.

<p></p>

#### Conveying REMS information in the electronic prescription

By populating REMS-related data elements in the electronic prescription, the prescriber's system can improve the receiving pharmacist's workflow and reduce dispensing obstacles. The REMS-related elements below are supported in the currently-adopted NCPDP SCRIPT NewRx prescription specification (v2017071).

Provider Systems are encouraged to transmit these REMS data elements when possible, though this guide does not require it--as that may not be supported by current prescribing system processes.

<p></p>

<table class="grid">
<thead>
<tr>
<th style="min-width:300px">REMS Information</th>
<th style="min-width:400px">NCPDP SCRIPT NewRx Element</th>
</tr>
</thead>
<tbody>
<tr>
<td>Patient ID</td>
<td>REMSPatientID</td>
</tr>
<tr>
<td>Prescriber ID</td>
<td>REMSHealthcareProviderEnrollmentID</td>
</tr>
<tr>
<td>Facility ID</td>
<td>REMSHealthcareSettingEnrollmentID</td>
</tr>
<tr>
<td>Dispense authorization</td>
<td>REMSAuthorizationNumber</td>
</tr>
<tr>
<td>Patient Risk Category</td>
<td>REMSPatientRiskCategory</td>
</tr>
<tr>
<td>Indication that prescriber REMS requirements are met</td>
<td>PrescriberCheckedREMS <br />(value: "A" - Prescriber has checked REMS and the provider&rsquo;s actions have been completed)</td>
</tr>
</tbody>
</table>
<!-- DivTable.com -->

<p></p>

#### Transmitting the prescription after the prescriber's REMS steps are satisfied

If a prescription for a REMS drug is transmitted before the required REMS steps have been met, the receiving pharmacy will not be allowed to dispense it until steps are taken to satisfy the unmet requirements. Resolving the situation typically involves manual activities such as phone calls or faxes between the pharmacy and clinic, and frustration for the patient as they wait to pick up their medication.

In order to prevent delays for the patient and additional work for the pharmacist, the prescriber system should not transmit the prescription to the pharmacy until all prescribing-time REMS requirements have been met. 

While holding a REMS prescription in this way benefits the downstream fulfillment process, this guide recognizes that current prescribing workflows may not support this behavior and does not strictly require it.

<p></p>
<p></p>

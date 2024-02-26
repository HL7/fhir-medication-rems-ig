### Approach: Common Patterns to be Applied at Multiple Steps

This guide establishes two information sharing patterns that can be applied at multiple points in the REMS process outlined above:
- Information sharing within the provider system workflow (using CDS Hooks and EHR-based SMART App Launch)
- Patient information retrieval from an external REMS Administrator application (using standalone SMART app launch).

#### Information sharing within the provider system workflow
The figure below illustrates how this pattern can... 
- trigger an interaction between a provider's system and the REMS Administrator at appropriate points in the provider's workflow
- provide the REMS Administrator with provider and patient details 
- enable the provider to supply additional information using a SMART app without leaving the provider system.

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow - Examples</strong></figcaption>
  <p>
  <img src="ehr-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>

#### Patient information retrieval from an external REMS Administrator application
The following figure illustrates a pattern that enables an external REMS Administrator application to pull in patient details from the provider system, minimizing manual entry. 

<div>
<figure class="figure">
<figcaption class="figure-caption"><strong>Figure: REMS Within the Provider System Workflow - Examples</strong></figcaption>
  <p>
  <img src="standalone-launch-sequence.png" style="float:none">  
  </p>
</figure>
</div>
<p></p>


<p></p>

### Release 2.0.0
 <p><b>Substantive and breaking changes:</b></p>
 <ul>
    <li>
        Added support for Prescriber Intermediary system between EHR and REMS Administrators.
    </li>
    <li>
        Added support for shared/common SMART on FHIR application similarly to DaVinci DTR IG.
    </li>
    <li>
        Added support for automatic REMS Administrator registration within the Prescriber Intermediary using SPL.
    </li>
    <li>
        Added new FHIR operation for out-of-band ETASU check.
    </li>
    <li>
        Added workflows including Pharmacy systems using NCPDP SCRIPT.
    </li>
</ul>

<br/>

<p><b>Non-Substantive changes:</b></p>
<ul>
    <li>
        Added HealthcareService resource as optional parameter to CDS Hooks prefetch for checking status of Pharmacy registration in REMS program.
    </li>
    <li>
        Updated Future Directions section with new paths forward for the use case.
    </li>
    <li>
        Updated Technical Background to include QuestionnaireResponse needed by shared SMART app launch.
    </li>
    <li>
        Updated Technical Background with information about FHIR Operations, DaVinci DTR IG, CQL, SQL, FDA OpenAPI, NCPDP SCRIPT. All in support of new features and capabilities added to version 2.0 of this IG.
    </li>
    <li>
        Added example FHIR Parameters for $rems-etasu out-of-band FHIR Operation for ETASU checking.
    </li>
    <li>
        Updated use cases to include new capabilities.
    </li>
    <li>
        Updated participant roles to include the Intermediary.
    </li>
    <li>
        Updated list of use case participants.
    </li>
</ul>
<schema xmlns="http://purl.oclc.org/dsdl/schematron"
        schemaVersion="iso" queryBinding="xslt2">

   <title>Norwegian rules for EHF Catalogue Response</title>

   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" prefix="cbc"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" prefix="cac"/>
   <ns uri="urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2" prefix="ubl"/>

   <pattern>
      <rule context="/ubl:ApplicationResponse">
         <assert id="NOGOV-T58-R002" test="(cbc:UBLVersionID != '')" flag="fatal">[NOGOV-T58-R002]-A catalogue response MUST have a syntax identifier.</assert>
         <assert id="NOGOV-T58-R003"
                 test="cac:SenderParty/cbc:EndpointID"
                 flag="warning">[NOGOV-T58-R003]-A catalogue response should have sellers endpoint id.</assert>
         <assert id="NOGOV-T58-R004"
                 test="cac:ReceiverParty/cbc:EndpointID"
                 flag="warning">[NOGOV-T58-R004]-A catalogue response should have the receivers endpoint id.</assert>
         <assert id="NOGOV-T58-R009"
                 test="not(count(//*[not(node()[not(self::comment())])]) &gt; 0)"
                 flag="fatal">[NOGOV-T58-R009]-A catalogue response MUST not contain empty elements.</assert>
      </rule>
      <rule context="cac:ReceiverParty/cbc:EndpointID">
         <assert id="NOGOV-T58-R007" test="@schemeID = 'NO:ORGNR'" flag="fatal">[NOGOV-T58-R007]-An endpoint identifier scheme for receiver MUST have the value 'NO:ORGNR'.</assert>
         <assert id="NOGOV-T58-R008"
                 test="(string(.) castable as xs:integer) and (string-length(.) = 9)"
                 flag="fatal">[NOGOV-T58-R008]-MUST be a norwegian organizational number. Only numerical value allowed</assert>
      </rule>
      <rule context="cac:SenderParty/cbc:EndpointID">
         <assert id="NOGOV-T58-R005" test="@schemeID = 'NO:ORGNR'" flag="fatal">[NOGOV-T58-R005]-An endpoint identifier scheme for sender MUST have the value 'NO:ORGNR'.</assert>
         <assert id="NOGOV-T58-R006"
                 test="(string(.) castable as xs:integer) and (string-length(.) = 9)"
                 flag="fatal">[NOGOV-T58-R006]-MUST be a norwegian organizational number. Only numerical value allowed</assert>
      </rule>
      <rule context="//*[contains(name(),'Date')]">
         <assert id="NOGOV-T58-R001"
                 test="(string(.) castable as xs:date) and (string-length(.) = 10)"
                 flag="fatal">[NOGOV-T58-R001]-A date must be formatted YYYY-MM-DD.</assert>
      </rule>
      <rule context="//cbc:ProfileID">
         <assert id="EHFPROFILE-T58-R001"
                 test=". = 'urn:www.cenbii.eu:profile:bii01:ver2.0'"
                 flag="fatal">[EHFPROFILE-T58-R001]-A Catalogue response must only be used in profile 1</assert>
      </rule>
   </pattern>
</schema>

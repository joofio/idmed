Instance: related-med-1
InstanceOf: DefinedMed
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title: "Use case 1 - Related Medication to prescription "

* identifier[0].system = "http://medication-identifiers.com"
* identifier[0].value = "123"


Instance: related-med-2
InstanceOf: DefinedMed
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title: "Use case 1 - First Related Medication to dispense "

* identifier[0].system = "http://medication-identifiers.com"
* identifier[0].value = "456"


Instance: related-med-3
InstanceOf: DefinedMed
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title: "Use case 1 - Second Related Medication to dispense "

* identifier[0].system = "http://medication-identifiers.com"
* identifier[0].value = "789"


Instance: example-1-of-medReq
InstanceOf: ExtendedRequest
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title: "Use case 1 - Prescription of Medication with relatedMedication"

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #active
* intent = #order

* medicationCodeableConcept = https://infarmed.gov.pt/codings/pa_codes#2837409  "paracetamol 500 mg"

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"

* extension[relatedMedication]
  * extension[relationType].valueCoding = #SINGLE
  * extension[relatedMed]
    * valueReference.identifier.system = "http://medication-identifiers.com"
    * valueReference.identifier.value = "123"


Instance: example-1-of-meddisp
InstanceOf: ExtendedDispense
Usage: #example
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title: "Use case 1 - Dispense of Medication with relatedMedication"


* identifier[0].system = "http://dispense-identifiers.com"
* identifier[0].value = "f219aa4e-5d10-4f3d-840d-a15e0dff2957"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #completed

* medicationCodeableConcept = https://infarmed.gov.pt/codings/pa_codes#2837409  "Ben-u-ron 500 mg pack of 20"

* whenHandedOver = "2021-07-19T13:00:00+02:00"

* quantity.value = 1
* quantity.unit = "Box"
* quantity.system =  "http://standardterms.edqm.eu/PAC"
* quantity.code = #30009000

* authorizingPrescription.identifier.system = "http://prescription-identifiers.com"
* authorizingPrescription.identifier.value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"


* performer[+].actor.identifier.value = "7c3aa173-3185-4001-a661-df36a7492798"
* performer[=].actor.identifier.system = "http://dispenser-identifiers.com"
* performer[=].actor.display = "Pharmacist"
* performer[=].function.coding = #dispenser

* performer[+].actor.identifier.value = "5b2e9903-fba7-4ed3-aa76-52d386012ca0"
* performer[=].actor.identifier.system = "http://dispenser-identifiers.com"
* performer[=].actor.display = "Pharmacy X"
* performer[=].function.coding = #dispensingOrg


* extension[relatedMedication]
  * extension[relationType].valueCoding = #MULTIPLE
  * extension[relatedMed]
    * valueReference.identifier.system = "http://medication-identifiers.com"
    * valueReference.identifier.value = "456"
* extension[relatedMedication][+]
  * extension[relationType].valueCoding = #MULTIPLE
  * extension[relatedMed]
    * valueReference.identifier.system = "http://medication-identifiers.com"
    * valueReference.identifier.value = "789"
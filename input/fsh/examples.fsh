Instance: example-1-of-medReq
InstanceOf: ExtendedRequest
Description: "This example shows a prescription that is made by brand name and the pharmacist changes the brand name for another brand name in the same VOS - Cluster."
Title:    "Dispense Example - Prescribed branded medication is changed by another branded medication from the same VOS-cluster"

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* subject.identifier.system = "https://www.ehealth.fgov.be/standards/fhir/NamingSystem/ssin"
* subject.identifier.value = "64110219106"

* status = #active
* intent = #order

* medicationCodeableConcept = https://cnk.apb.be/codings/cnk_product_codes#2837409  "Amlor harde caps. 98x 5mg"

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"

* extension[relatedMedication]
  * extension[relationType].valueCoding = #123
  * extension[relatedMed]
    * valueReference.identifier.value = "123"
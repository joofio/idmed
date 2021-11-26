Instance: example3a-original-med-presc
InstanceOf: Medication
Usage: #example
Description: "Original Medication prescribed with data from the origin country. With no information regarding cross-border"
Title: "Use case 1 - Original Medication Prescribed"


* code = https://infarmed.gov.pt/codings/product_code#2 "Paracetamol 500 mg comprimidos"

* status = #active

* form = http://naming.sns.gov.pt/fhir/form#123 "Comprimidos"

* ingredient.itemCodeableConcept = https://infarmed.gov.pt/codings/ingredient_code#4 "Paracetamol"  

* ingredient.strength.numerator.value = 500  
* ingredient.strength.numerator.unit = "mg"  


Instance: example3a-original-med-disp
InstanceOf: Medication
Usage: #example
Description: "Original Medication dispensed with data from the origin country. With no information regarding cross-border"
Title: "Use case 1 - Original Medication Dispensed"

* code = https://infarmed.gov.pt/codings/product_code#20 "Ben-U-Ron 500 mg comprimidos pack de 20"

* status = #active

* form = http://naming.sns.gov.pt/fhir/form#123 "Comprimidos"

* ingredient.itemCodeableConcept = https://infarmed.gov.pt/codings/ingredient_code#4 "Paracetamol"  

* ingredient.strength.numerator.value = 500  
* ingredient.strength.numerator.unit = "mg"  


Instance: example3a-related-med-presc
InstanceOf: DefinedMed
Usage: #example
Description: "Medication prescribed with data regarding cross-border compliance - different from original, even though is connected"
Title: "Use case 1 - Related Medication to prescription"


* code = https://npech.eu/codings/phpid#Ab350 "Paracetamol 500 mg Tablets"

* status = #active

* form = http://standardterms.edqm.eu/PAC#10219000 "Tablet"

* ingredient.itemCodeableConcept = https://npech.eu/codings/ingredient_code#4A4b "Paracetamol"  

* ingredient.strength.numerator.value = 500  
* ingredient.strength.numerator.unit = "mg"  


Instance: example3a-related-med-disp-1
InstanceOf: DefinedMed
Usage: #example
Description: "Medication dispensed with data regarding cross-border compliance - different from original, even though is connected"
Title: "Use case 1 - Related Medication to dispense"


* code = https://npech.eu/codings/phpid#Ab350 "Paracetamol 500 mg Tablets"

* status = #active

* form = http://standardterms.edqm.eu/PAC#10219000 "Tablet"

* ingredient.itemCodeableConcept = https://npech.eu/codings/ingredient_code#4A4b "Paracetamol"  

* ingredient.strength.numerator.value = 500  
* ingredient.strength.numerator.unit = "mg"  


Instance: example3a-related-med-disp-2
InstanceOf: DefinedMed
Usage: #example
Description: "Medication dispensed with data regarding cross-border compliance - different from original, even though is connected"
Title: "Use case 1 - Related Medication to dispense"


* code = https://npech.eu/codings/mpid#Ab350 "Ben-u-Ron 500 mg Tablets"

* status = #active

* form = http://standardterms.edqm.eu/PAC#10219000 "Tablet"

* ingredient.itemCodeableConcept = https://npech.eu/codings/ingredient_code#4A4b "Paracetamol"  

* ingredient.strength.numerator.value = 500  
* ingredient.strength.numerator.unit = "mg"  


Instance: example-3a-of-medReq
InstanceOf: MedicationRequest
Usage: #example
Description: "Original medication Request"
Title: "Use case 1 - Original Prescription of Medication"

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #active
* intent = #order

* medicationReference = Reference(original-med-presc-1)

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"


* dosageInstruction.route = https://infarmed.gov.pt/codings/route_codes#2 "Uso Oral"

* extension[relatedMedication]
  * extension[relationType].valueCoding = #SINGLE
  * extension[relatedMed]
    * valueReference.identifier.system = "http://medication-identifiers.com"
    * valueReference.identifier.value = "123"




Instance: example-3a-of-ext-medReq
InstanceOf: ExtendedRequest
Usage: #example
Description: "Extended medication Request"
Title: "Use case 1 - Extended Prescription of Medication"

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #active
* intent = #order

* medicationReference = Reference(original-med-presc-1)

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"

* dosageInstruction.route = https://hl7.org/fhir/ValueSet/route-codes#26643006 "Oral use"

* extension[relatedMedication]
  * extension[relationType].valueCoding = #SINGLE
  * extension[relatedMed]
    * valueReference = Reference(related-med-presc-1)


Instance: example-3a-of-meddisp
InstanceOf: MedicationDispense
Usage: #example
Description: "Medication dispense document with extension for cross-border"
Title: "Use case 1 - Extended Dispense of Medication "

* identifier[0].system = "http://dispense-identifiers.com"
* identifier[0].value = "f219aa4e-5d10-4f3d-840d-a15e0dff2957"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #completed

* medicationReference = Reference(original-med-disp-1)

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


Instance: example-3a-of-ext-meddisp
InstanceOf: ExtendedDispense
Usage: #example
Description: "Original Medication dispense document"
Title: "Use case 1 - Original Dispense of Medication "


* identifier[0].system = "http://dispense-identifiers.com"
* identifier[0].value = "f219aa4e-5d10-4f3d-840d-a15e0dff2957"

* subject.identifier.system = "http://naming.sns.gov.pt/fhir/patients"
* subject.identifier.value = "64110219106"

* status = #completed

* medicationReference = Reference(original-med-disp-1)

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
    * valueReference = Reference(related-med-disp-1)
* extension[relatedMedication][+]
  * extension[relationType].valueCoding = #MULTIPLE
  * extension[relatedMed]
    * valueReference = Reference(related-med-disp-2)




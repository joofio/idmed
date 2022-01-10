Instance: example0-of-medReq
InstanceOf: MedicationRequest
Usage: #example
Description: "Original medication Request"
Title: "1 - Prescription of Medication"

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* subject.identifier.system = "http://naming.be/fhir/patients"
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


* dosageInstruction.route = https://codings.be/codings/route_codes#2 "Oral Use"



Instance: original-med-presc-1
InstanceOf: Medication
Usage: #example
Description: "Medication prescribed with data from the origin country. With no information regarding cross-border"
Title: "2 - Medication Prescribed"


* code = https://products.be/codings/product_code#2 "Monuril sachet 300 mg 2 units"

* status = #active

* form = http://naming.be/fhir/form#123 "Powder for oral solution"

* ingredient.itemCodeableConcept = https://ingredients.be/codings/ingredient_code#4 "Fosfomycin"  

* ingredient.strength.numerator.value = 300  
* ingredient.strength.numerator.code = #mg
* ingredient.strength.numerator.system = "http://unitsofmeasure.org" 


Instance: enriched-med-presc-1
InstanceOf: Medication
Usage: #example
Description: "Medication prescribed enriched with information regarding cross-border"
Title: "3 - Enriched Medication Prescribed"


* code = https://products.be/codings/product_code#2 "Monuril sachet 300 mg 2 units"

* status = #active

* form = http://naming.be/fhir/form#123 "Powder for oral solution"

* ingredient.itemCodeableConcept = https://ingredients.be/codings/ingredient_code#4 "Fosfomycin"  

* ingredient.strength.numerator.value = 300  
* ingredient.strength.numerator.code = #mg
* ingredient.strength.numerator.system = "http://unitsofmeasure.org" 

* extension[relatedMedication]
  * extension[relationType].valueCoding = #SINGLE
  * extension[relatedMed]
    * valueReference.identifier.system = "https://npech.eu/codings/phpid"
    * valueReference.identifier.value = "Ab350"



Instance: related-med-presc-1
InstanceOf: DefinedMed
Usage: #example
Description: "Medication prescribed with data regarding cross-border compliance - different from original, even though is connected"
Title: "4 - Related Medication to prescription [Pharmaceutical Product]"


* code = https://npech.eu/codings/phpid#Ab350 "Fosfomycin sachet 300 mg"

* status = #active

* form = http://standardterms.edqm.eu/PAC#10110000 "Powder for oral solution"

* ingredient.itemCodeableConcept = https://npech.eu/codings/ingredient_code#4A4b "Fosfomycin"  

* ingredient.strength.numerator.value = 300  
* ingredient.strength.numerator.code = #mg
* ingredient.strength.numerator.system = "http://unitsofmeasure.org" 


Instance: original-med-presc-1
InstanceOf: Medication
Usage: #example
Description: "Medication prescribed with data from the origin country. With no information regarding cross-border"
Title: "2 - Medication Prescribed"


* code = https://products.be/codings/product_code#2 "Monuril sachet 300 mg 2 units"

* status = #active

Instance: enriched-med-presc-1
InstanceOf: Medication
Usage: #example
Description: "Medication prescribed enriched with information regarding cross-border"
Title: "3 - Enriched Medication Prescribed"


* code = https://products.be/codings/product_code#2 "Monuril sachet 300 mg 2 units"

* status = #active

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




Instance: cnpem1
InstanceOf: Medication

* code = http://products.pt/cnpem#50012606 "Fosfomicina 3g 2x Saq"
/*
// Alternative 2: 
* version: 2
* extension[relatedMedication]
  * extension[relatedMed].valueReference = Reference(cnpem1X)
  * extension[relationType].valueCoding = #123

*/

Instance: original-presc
InstanceOf: XBMedRequest

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"


* status = #active
* intent = #order
* subject  
  * identifier.value = "patient1"

//* medicationReference = Reference(cnpem1) //alternative with reference
* medicationCodeableConcept =  http://products.pt/cnpem#50012606 "Fosfomicina 3g 2x Saq"

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"

Instance: updated-presc
InstanceOf: XBMedRequest

* identifier[0].system = "http://prescription-identifiers.com"
* identifier[0].value = "69eb6358-6eb6-40e4-972f-33d22c3392c5"

* meta.versionId = "2"

* status = #active
* intent = #order

* subject  
  * identifier.value = "patient1"

//* medicationReference = Reference(cnpem1) //alternative with reference
* medicationCodeableConcept =  http://products.pt/cnpem#50012606 "Fosfomicina 3g 2x Saq"
  * extension[relatedMedication]
    * extension[relatedMed].valueReference = Reference(cnpem1X)
    * extension[relationType].valueCoding = #123

* authoredOn = "2021-07-19T09:00:00+02:00"

* requester.identifier.value = "7c121778-5b2b-442d-9314-0a73995ab3dd"
* requester.identifier.system = "http://physician-identifiers.com"
* requester.display = "GP"

* encounter.identifier.value = "0cf5dc52-28dc-43ce-96d2-3a757526c739"
* encounter.identifier.system = "http://encounter-identifiers.com"


Instance: cnpem1X
InstanceOf: Medication

* extension[relatedMedication]
  * extension[relationType].valueCoding = #upper
  * extension[relatedMed]
    * valueReference.identifier.system = "http://phpids"
    * valueReference.identifier.value = "0xE857DA811B4A6F3BD57810C45D2EA1ED" // Why 0x????


// Now we want to convey the characteristics
// Option 1: add everything as drugCharacteristic

// Option 2: add the proper medication characteristics

* status = #active
* form = http://standardterms.edqm.eu/PAC#10112000 "Granules for oral solution"
* ingredient.itemCodeableConcept = https://who-umc/blah/substance#3VH781SH5M "Fosfomicine"  
* ingredient.strength.numerator.value = 3  
* ingredient.strength.numerator.unit = "g"  

// For connectathon: How to express the 20 tablets when not expressed by the code?
// Option 1: DrugCharacteristic (extension)
//Option 2: total
* amount.numerator.value = 2
* amount.numerator.code = #sachet


// Alternative 1: Extension on MedXXX resource
// Alternative 11: Extension on Med[x] element - whether codeableconcept or Ref
// Alternative 2: Extension on Medication



Extension:      DrugCharacteristic
Parent:         Extension
Id:             drugCharacteristic
Title:          "Drug Characteristic"
Description:    "Drug Characteristic"
* extension contains
    characteristicType 1..1 and
    characteristicValue 1..1 
* extension[characteristicType].value[x] only CodeableConcept
* extension[characteristicValue].value[x] only string or Quantity or CodeableConcept or Attachment or base64Binary


Profile: DefinedMed
Parent: Medication
* extension contains
    DrugCharacteristic named drugCharacteristic 0..* 


Extension: RelatedMedication
Id:        relatedMedication
Title:     "Related Medication"
Description: "Related Medication to be used on clinical medication workflow resources in order to portrait the information for cross-border. This extension is used on MedicationAdministration,MedicationDispense,MedicationRequest and MedicationStatement  resource."


* extension contains
    relationType 1..1 MS and
    relatedMed 1..1 MS

* extension[relationType] ^short = "Relation Type"
* extension[relationType].value[x] only Coding

* extension[relatedMed] ^short = "Related medication"
* extension[relatedMed].value[x]  only Reference(Medication)



// This rule set limits the application of an extension to the given path
RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"




// Define a local code system
CodeSystem: RelationTypeCS
Id:         relationtype-cs
Title: "Relation Type for Related Medication Code System"
Description: "Indicates the relation of the related medication with the original medication"
// You can choose any url, or use the default, but in this case we want the URL to be in the HL7 namespace
* ^url =  http://terminology.hl7.org/CodeSystem/relationtype
// Spacing layout over three lines per term is optional, for clarity
// The definition (second text string) is optional
* #SINGLE  
    "Direct Translation"
    "Direct Translation"
* #MULTIPLE  
    "One of many possibilities"
    "One of many possibilities"
* #DIFFERENT  
    "Different Drug"
    "Different Drug"
* #DIF_Strength  
    "Different Strength"
    "Different Strength"
* #DIF_BRAND 
    "Different Brand"
    "Different Brand"
* #DIF_FORM
    "Different Pharmaceutical Form"
    "Different Pharmaceutical Form"
* #DIF_PACKSIZE
    "Different Pack Size"
    "Different Pack Size"
* #DIF_ROUTE
    "Different Administration Route"
    "Different Administration Route"


ValueSet: RelationTypeVS
Id: relationtype-vs
Title: "Relation Type for Related Medication Value Set"
Description: "Indicates the relation of the related medication with the original medication"
* include codes from system RelationTypeCS

Profile: XBMedRequest
Parent: MedicationRequest

/*
// Alternative 1:
* extension[relatedMedication]
  * extension[relatedMed].valueReference = Reference(cnpem1X)
  * extension[relationType].valueCoding = #123
*/


* medication[x]

// Alternative 1.1
  * extension contains RelatedMedication named relatedMedication 0..1
    

Profile: XBMedRequest1
Parent: MedicationRequest


// Alternative 1:
* extension contains RelatedMedication named relatedMedication 0..1



//// examples


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


//updated resource with extension
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


//original prescriptiom.
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

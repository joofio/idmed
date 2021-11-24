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
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(MedicationDispense)
* insert ExtensionContext(MedicationRequest)
* insert ExtensionContext(MedicationStatement)

* extension contains
    relationType 1..1 MS and
    relatedMed 1..1 MS

* extension[relationType] ^short = "Relation Type"
* extension[relationType].value[x] only Coding

* extension[relatedMed] ^short = "Related medication"
* extension[relatedMed].value[x]  only Reference(DefinedMed)


// This rule set limits the application of an extension to the given path
RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"


Profile: ExtendedRequest
Parent: MedicationRequest
* extension contains
    RelatedMedication named relatedMedication 0..* MS 


Profile: ExtendedAdministration
Parent: MedicationAdministration
* extension contains
    RelatedMedication named relatedMedication 0..* MS


Profile: ExtendedDispense
Parent: MedicationDispense
* extension contains
    RelatedMedication named relatedMedication 0..* MS


Profile: ExtendedStatement
Parent: MedicationStatement
* extension contains
    RelatedMedication named relatedMedication 0..* MS


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

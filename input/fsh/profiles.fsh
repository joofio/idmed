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
* extension[relatedMed].value[x]  only Reference (DefinedMed)


// This rule set limits the application of an extension to the given path
RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"

Profile: ExtendedRequest
Parent: MedicationRequest
* extension contains
    RelatedMedication named relatedMedication 0..* MS 

Profile: CrossBorderMedicationAdministration
Parent: MedicationAdministration
* extension contains
    RelatedMedication named relatedMedication 0..* MS


Profile: CrossBorderMedicationDispense
Parent: MedicationDispense
* extension contains
    RelatedMedication named relatedMedication 0..* MS

Profile: CrossBorderMedicationStatement
Parent: MedicationStatement
* extension contains
    RelatedMedication named relatedMedication 0..* MS

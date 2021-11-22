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



Extension: RelatedMedication
Id:        RelatedMedication
Title:     "Related Medication"
Description: "Related Medication to be used on clinical medication workflow resources in order to portrait the information for cross-border. This extension is used on MedicationAdministration,MedicationDispense,MedicationRequest and MedicationStatement  resource."
* insert ExtensionContext(MedicationAdministration)
* insert ExtensionContext(MedicationDispense)
* insert ExtensionContext(MedicationRequest)
* insert ExtensionContext(MedicationStatement)

* extension contains
    relation 1..1 MS and
    definedMedication 1..1 
* extension[relation].value[x] only string
* extension[definedMedication].value[x] only Reference(Medication)


Profile: DefinedMed
Parent: Medication
* extension contains
    DrugCharacteristic named drugCharacteristic 0..* 


// This rule set limits the application of an extension to the given path
RuleSet: ExtensionContext(path)
* ^context[+].type = #element
* ^context[=].expression = "{path}"

Profile: CrossBorderMedicationRequest
Parent: MedicationRequest
* extension contains
    RelatedMedication named RelatedMedication 0..* 

Profile: CrossBorderMedicationAdministration
Parent: MedicationAdministration
* extension contains
    RelatedMedication named RelatedMedication 0..* 


Profile: CrossBorderMedicationDispense
Parent: MedicationDispense
* extension contains
    RelatedMedication named RelatedMedication 0..* 


Profile: CrossBorderMedicationStatement
Parent: MedicationStatement
* extension contains
    RelatedMedication named RelatedMedication 0..* 

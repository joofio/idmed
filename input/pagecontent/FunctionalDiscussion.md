
This IG is based on the need for exchanging cross-border information.

The different countries in the EU have different medication definitions and those definitions should not impact the proper exchange of information.

The basis is that an extension is created to contain the cross-border information of the national product.  However, it is not conceivable to map every product to IDMP standards. Additionally, the difference in definitions turns this task into a more difficult one.
The logic implemented here is necessary only to map concepts.
Using the Portuguese CNPEM, which is mapped to a pharmaceutical product with the addition of pack size.

The diagram shows that mapping:
<div>
{% include concept-map.svg %}
</div>

So, with this approach enables that is just needed to map the building blocks of a medication concept into its idmp counterparts and different definitions are built on top of that.

With the example in the resources:
1. A prescription regarding CNPEM is done (Fosfomicine 3g 2x sachet)
    1.1. The prescription is made by CNPEM code 50012606
2. The data is transformed into idmp (ingredient, strength, form and pack)
3. The concept for CNPEM IDMP-compatible is created
4. Additionally, other concepts may be added as well, like pharmaceuticalProduct, MedicinalProduct, etc with different relation types.
   
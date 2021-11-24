<h2>The brand does not exist</h2>

In this case, the specific brand that was prescribed and/or dispensed is not available in the target country.
Since most countries have active principle based prescription for its majority of cases, it is assumed that this use case will be more frequent regarding dispensing. 
However, it should work on all Medication related Resources.

For this case, we can have two options:
1. Match the upper level of the drug
2. Provide several other brands as relatedMedication


The alternatives are displayed below:

**1**

<div>
{% include usecase1-alternative1.svg %}
</div>
In the above example, the Paracetamol with Brand ben-u-ron is linked to a single product with a different level (no brand for it)

**2**

<div>
{% include usecase1-alternative2.svg %}
</div>
In the above example, the Paracetamol with Brand ben-u-ron is linked to other brands existing in the target country.



The pack size may be also connected, if none similar is available for all available brands, is it important? **Discuss**
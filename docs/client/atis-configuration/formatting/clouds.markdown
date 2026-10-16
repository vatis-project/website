---
layout: home
title: Clouds
parent: Formatting
nav_order: 5
---

# Clouds

This element represents the cloud layers information obtained from the METAR reports.

* `{clouds}` ... The cloud layers (e.g. FEW050 SCT100)

![Clouds](/assets/images/Formatting_Clouds.png)

### Identify ceiling layer in voice ATIS
When enabled, the lowest BKN (broken) or OVC (overcast) cloud layer will be referred to as the "ceiling" in the voice ATIS. For example, it will be spoken as "CEILING ONE THOUSAND FOUR HUNDRED OVERCAST, TWO THOUSAND BROKEN."

### Convert cloud layer altitude to metric
If this option is selected, the altitude (height) of the cloud layer will be converted to the metric unit in both the voice and text ATIS.

### Display cloud height in hundreds of feet
If enabled, the cloud height will be converted to hundreds of feet in the text ATIS. For example, FEW010 will be displayed as FEW1000.

### Undetermined height (///)
The text used when the height of a cloud layer or the vertical visibility is not reported (`///`). Set the voice and text values separately for a **cloud layer** and for **vertical visibility**. The text replaces `{altitude}` in the Cloud Types.

### Undetermined cloud type
A layer whose height is not reported (for example `FEW///` or `BKN///CB`) uses the **UND** row in Cloud Types. In that row, `{amount}` is replaced with the layer amount (e.g. FEW or BKN), so you can word these layers differently from layers with a known height.

<hr/>

## Cloud Types
Specify how the cloud types should be articulated in the voice ATIS.

![Clouds](/assets/images/Formatting_Clouds_Types.png)

* `{altitude}`: Represents the altitude or height of the cloud layer. This variable can be used to insert the specific altitude of the cloud layer in the voice or text ATIS, ensuring accurate reporting of cloud heights. You can optionally include a format parameter to specify the number of digits to display in the text ATIS. For example, to display the altitude with five digits, use the variable `{altitude:5}`.
* `{convective}`: If the cloud layer is identified as a convective layer (e.g., cumulonimbus clouds), this variable will include the spoken text for the convective layer. For example, if the layer is scattered cumulonimbus clouds at 25,000 feet, the spoken ATIS would say "SCATTERED TWO FIVE ZERO CUMULONIMBUS".

The following variables are also available in the Cloud Types:

* `{altitude:N}` ... Text ATIS only. The height zero-padded to *N* digits, for example `{altitude:2}` gives 03 for 300 feet.
* `{amount}` ... The **UND** row only. The layer amount, such as FEW or BKN.
* `{feet}` ... The word "feet" when the height is known, and empty when the height is `///`, so the unit is dropped together with the height.

## Convective Cloud Types
Specify how the convective cloud types should be articulated in the voice ATIS.

![Clouds](/assets/images/Formatting_Clouds_ConvectiveTypes.png)

## Convective Cloud Types (Text)
The Convective Cloud Types table also has a **Text** column. It sets how each convective type (CB, TCU) is shown in the text ATIS, independent of the spoken text. By default the text ATIS shows the METAR acronym.

<hr/>

## Variable Format


![Clouds Variable Format](/assets/images/Formatting_Clouds_VariableFormat.png)

The Variable Format tab sets the number style and suffix for the `{altitude}` variable, independently for the text and voice ATIS. For example, the text ATIS can append `FT` while the voice ATIS speaks digit-by-digit words. When cloud heights are converted to metric, the spoken "meters" word is still added after the formatted number.

**Style**<br/>
* **Default**, **Digits**, **Serial**, **Group** ... Built-in rendering, plain digits, digit-by-digit words, or words in groups.

**Suffix**<br/>
Text appended to the value exactly as typed.

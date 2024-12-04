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

**Identify ceiling layer in voice ATIS**<br/>
When enabled, the lowest BKN (broken) or OVC (overcast) cloud layer will be referred to as the "ceiling" in the voice ATIS. For example, it will be spoken as "CEILING ONE THOUSAND FOUR HUNDRED OVERCAST, TWO THOUSAND BROKEN."

**Convert cloud layer altitude to metric**<br/>
If this option is selected, the altitude (height) of the cloud layer will be converted to the metric unit in both the voice and text ATIS.

**Undetermined (Voice)**<br/>
The text spoken if the cloud altitude (height) is undetermined.

**Undetermined (Text)**<br/>
The text shown in the text ATIS if the cloud altitude (height) is undetermined.

<hr/>

## Cloud Types
Specify how the cloud types should be articulated in the voice ATIS.

![Clouds](/assets/images/Formatting_Clouds_Types.png)

* `{altitude}`: Represents the altitude or height of the cloud layer. This variable can be used to insert the specific altitude of the cloud layer in the voice or text ATIS, ensuring accurate reporting of cloud heights.
* `{convective}`: If the cloud layer is identified as a convective layer (e.g., cumulonimbus clouds), this variable will include the spoken text for the convective layer. For example, if the layer is scattered cumulonimbus clouds at 25,000 feet, the spoken ATIS would say "SCATTERED TWO FIVE ZERO CUMULONIMBUS".

## Convective Cloud Types
Specify how the convective cloud types should be articulated in the voice ATIS.

![Clouds](/assets/images/Formatting_Clouds_ConvectiveTypes.png)
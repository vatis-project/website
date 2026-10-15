---
layout: home
title: Weather
parent: Formatting
nav_order: 4
---

# Weather

The Weather element represents the present weather groups extracted from the METAR report. To include this element in the Preset ATIS template, use the `[WX]` variable.

`{weather}` ... The present weather items (e.g. SHRA BR)

![Weather](/assets/images/Formatting_Weather.png)

## Weather Descriptors
This setting allows you to specify the METAR weather descriptor codes and their corresponding spoken voice ATIS strings. You can define how each weather condition, such as SHRA (rain showers) or BR (mist), should be displayed in the text ATIS and spoken in the voice ATIS. The **Text** and **Spoken** values of each entry are independent, so intensity and proximity variants such as `-RA`, `+RA` and `VCSH` can each be written differently in the text and voice ATIS.

![Weather Descriptors](/assets/images/Formatting_Weather_Descriptors.png)

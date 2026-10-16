---
layout: home
title: Weather
parent: Formatting
nav_order: 4
---

# Weather

The Weather element represents the present weather groups extracted from the METAR report. To include this element in the Preset ATIS template, use the `[PRESENT_WX]` variable. (`[WX]` is the complete weather string, which includes this element along with the others.)

`{weather}` ... The present weather items (e.g. SHRA BR)

![Weather](/assets/images/Formatting_Weather.png)

## Recent Weather
The Recent Weather tab sets the template for the recent weather groups in the METAR (for example `RESHRA`). To include them in the Preset ATIS template, use the `[RECENT_WX]` variable. They are also part of the complete weather string, `[WX]`. The default text and voice template is `RECENT WEATHER {weather}`.

`{weather}` ... The recent weather items (e.g. SHRA BR)

## Weather Descriptors
This setting allows you to specify the METAR weather descriptor codes and their corresponding spoken voice ATIS strings. You can define how each weather condition, such as SHRA (rain showers) or BR (mist), should be displayed in the text ATIS and spoken in the voice ATIS. The **Text** and **Spoken** values of each entry are independent, so intensity and proximity variants such as `-RA`, `+RA` and `VCSH` can each be written differently in the text and voice ATIS.

![Weather Descriptors](/assets/images/Formatting_Weather_Descriptors.png)

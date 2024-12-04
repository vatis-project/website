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

## Intensity/Proximity Descriptors
This setting defines the spoken text for intensity/proximity descriptors associated with present weather conditions. These descriptors indicate the strength or proximity of the weather phenomena, such as light, moderate, heavy, near, or distant.

![Intensity and Proximity Descriptors](/assets/images/Formatting_Weather_Proximity.png)

## Weather Descriptors
This setting allows you to specify the METAR weather descriptor codes and their corresponding spoken voice ATIS strings. You can define how each weather condition, such as SHRA (rain showers) or BR (mist), should be spoken in the voice ATIS.

![Weather Descriptors](/assets/images/Formatting_Weather_Descriptors.png)
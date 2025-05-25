---
layout: home
title: Presets
parent: ATIS Configuration
nav_order: 2
---

# Presets

![Presets](/assets/images/AtisConfiguration_Presets.png)

The Presets tab allows you to manage your presets by adding, copying, renaming, or deleting them. The text box below the dropdown list is where you can customize the ATIS template. When an ATIS is generated, the variables will be replaced with actual data. If the Composite is configured to use Text to Speech, the template text will be synthesized and transmitted.

You can use the following variables in the ATIS template. If you want to use the voice translated text instead of the raw text value in the text ATIS, you can optionally suffix the variable name with `:VOX` (e.g., `[WX:VOX]`).

|Variable|Definition|
|---|---|
|`[FACILITY]`|The name of the ATIS facility (airport name)|
|`[ATIS_CODE]`<br/>`[ATIS_LETTER]`<br/>`[LETTER]`<br/>`[ID]`|The current ATIS letter code|
|`[WX]`<br/>`[FULL_WX_STRING]`|Inserts the weather elements in the standard order:<br/>`Surface Wind`, `Visibility`, `RVR`, `Present Weather`, `Clouds`, `Temperature`, `Dew Point`, `Altimeter` |
|`[OBS_TIME]`<br/>`[TIME]`|	The observation time of the METAR|
|`[WIND]`<br/>`[SURFACE_WIND]`|The reported surface wind|
|`[RVR]`|The runway visibility range (if available)|
|`[VIS]`<br/>`[PREVAILING_VISIBILITY]`|The prevailing visibility|
|`[PRESENT_WX]`<br/>`[PRESENT_WEATHER]`|The present weather conditions (e.g., rain, snow, hail, etc.)|
|`[CLOUDS]`|The reported cloud conditions|
|`[TEMP]`|The reported temperature|
|`[DEW]`|The reported dew point temperature|
|`[PRESSURE]`|The reported pressure value|
|`[TREND]`|The TREND forecast from the METAR|
|`[RECENT_WX]`|The recent weather conditions|
|`[ARPT_COND]`|Inserts the text from the free-form Airport Conditions field, followed by any selected static text options|
|`[NOTAMS]`|Inserts the text from the free-form NOTAMS field, followed by any selected static text options|
|`[TL]`|Inserts the transition level based on the configured ranges in the **Transition Level** formatting tab (non-US ATIS only)|
|`[CLOSING]`|Inserts the closing statement message|

<hr/>

## External ATIS Generator

**Use external ATIS generator (e.g. UniATIS)**<br/>
When this option is enabled, you can configure vATIS to utilize an external source for generating the ATIS text. Please note that you need to have a Preset selected before configuring an external ATIS generator.

* **URL** The URL of the external ATIS generator.
* **Arrival Runway** The arrival runway(s). You can include the variable `$arrrwy` in the URL to automatically append the value of the Arrival Runway field.
* **Departure Runway** The departure runway(s). You can include the variable `$deprwy` in the URL to automatically append the value of the Departure Runway field.
* **Approaches in Use** The approaches currently in use. You can include the variable `$app` in the URL to automatically append the value of the Approaches in Use field.
* **Remarks** Pertinent remarks. You can include the variable `$remarks` in the URL to automatically append the value of the Remarks field.

Additional variables include:

* `$metar` The current METAR string
* `$atiscode` The current ATIS letter

![External ATIS Generator](/assets/images/Formatting_ExternalGenerator.png)

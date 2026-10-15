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
|`[METAR]`|The complete, raw METAR as received (e.g. `KSFO 031856Z 28012KT 10SM FEW015 18/11 A3002`), without a leading "METAR" keyword|
|`[OBS_TIME]`<br/>`[TIME]`|	The observation time of the METAR|
|`[WIND]`<br/>`[SURFACE_WIND]`|The reported surface wind|
|`[RVR]`|The runway visibility range (if available)|
|`[VIS]`<br/>`[PREVAILING_VISIBILITY]`|The prevailing visibility|
|`[PRESENT_WX]`<br/>`[PRESENT_WEATHER]`|The present weather conditions (e.g., rain, snow, hail, etc.)|
|`[CLOUDS]`|The reported cloud conditions|
|`[TEMP]`|The reported temperature|
|`[DEW]`|The reported dew point temperature|
|`[PRESSURE]`|The reported pressure value|
|<code>[QFE&#124;ELEVATION_FT]</code>|The runway threshold QFE. Replace `ELEVATION_FT` with the runway threshold elevation in feet|
|`[TREND]`|The TREND forecast from the METAR|
|`[RECENT_WX]`|The recent weather conditions|
|`[WS]`|The wind shear information from the METAR (see [Wind Shear](formatting/wind-shear))|
|`[RWY_COND]`|The runway conditions (runway state) reported in the METAR (see [Runway Condition](formatting/runway-condition))|
|`[RMK_WIND]`|The wind reported in the METAR remarks (see [Remark Wind](formatting/remark-wind))|
|`[AUTO]`|Inserts the Automatic Observation text, only when the METAR is flagged AUTO (see [Automatic Observation](formatting/automatic-observation))|
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

Click **Test in Sandbox** to apply your changes and open this preset in the [Sandbox](sandbox), where you can enter or fetch a METAR and generate the ATIS.

## D-ATIS

![D-ATIS](/assets/images/AtisConfiguration_Presets_Datis.png)

When the selected preset is named **D-ATIS** a **D-ATIS** sub-tab is shown next to the **Template** sub-tab. It controls how the real-world D-ATIS is adjusted before it is placed in the Airport Conditions and NOTAMs fields when [Automatically fetch D-ATIS](../user-settings) is enabled. The settings are saved per station.

* **Prepend / Append Airport Conditions**: Text added before or after the fetched airport conditions.
* **Prepend / Append NOTAMs**: Text added before or after the fetched NOTAMs.
* **Text replacements**: A list of rules applied to the fetched text, in order from top to bottom.
  * **Pattern**: The text to find.
  * **Replacement**: The text to put in its place. Leave empty to remove the matched text.
  * **Regex**: If checked, the pattern is a regular expression. A single trailing comma, period or semicolon after a regex match is removed with it.

Use **New** to add a rule and **Delete** to remove the selected rule. Rules with an empty pattern are ignored, and an invalid regular expression is skipped.

The [Sandbox](sandbox) also fetches the current real-world D-ATIS when the D-ATIS preset is selected, so you can use it to check the effect of these settings.

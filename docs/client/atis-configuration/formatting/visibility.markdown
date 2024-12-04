---
layout: home
title: Visibility
parent: Formatting
nav_order: 3
---

# Visibility

The Visibility element represents the visibility value obtained from the METAR report. To include this element in the Preset ATIS template, use the `[VIS]` variable.

* `{visibility}` ... The visibility value (e.g. 10SM)

![Visibility](/assets/images/Formatting_Visibility.png)

<hr/>

## ICAO Formatting
The ICAO Formatting tab offers additional customization options for the prevailing visibility, specifically tailored for international stations. This tab is only visible for non-FAA ATIS stations.

![Visibility ICAO Formatting](/assets/images/Formatting_Visibility_ICAO.png)

**Include visibility unit suffix**<br/>
Enabling this option adds the unit type to the visibility value. For example, the visibility will be displayed as "FIVE THOUSAND METERS". If the specified "Meters Cutoff" value is met, the unit will automatically change to "KILOMETERS".

**Meters Cutoff**<br/>
The Meters Cutoff value determines the threshold at which the unit for visibility will switch from "meters" to "kilometers" in the voice ATIS.

**9999 (Voice)**<br/>
This setting defines the text spoken in the voice ATIS when the visibility is reported as 9999.

**9999 (Text)**<br/>
This setting defines the text displayed in the text ATIS when the visibility is reported as 9999.

**Visibility Direction**<br/>
This setting defines how visibility directions should be spoken in the voice ATIS when visibility differs across various directions (e.g., 1200SE 6000N). Use the provided table to specify the spoken text for cardinal directions.
---
layout: home
title: Wind Shear
parent: Formatting
nav_order: 8.1
---

# Wind Shear

The Wind Shear element represents the wind shear information in the METAR (for example `WS R04R` or `WS ALL RWY`). To include this element in the Preset ATIS template, use the `[WS]` variable. This component is only available for non-FAA ATIS stations.

You can set separate text and voice values for wind shear that is reported for a single runway and for wind shear that is reported for all runways.

| Setting | Default text | Default voice |
|-|-|-|
| **Runway Specific** | `WS R{Runway}` | `Wind Shear Runway {Runway}` |
| **All Runways** | `WS ALL RWY` | `Wind Shear All Runways` |

* `{Runway}` ... The runway identifier. Only available in the Runway Specific template. In the text ATIS it is the runway as reported (e.g. 04R). In the voice ATIS it is spoken digit by digit, followed by LEFT, RIGHT or CENTER (e.g. "ZERO FOUR RIGHT").


![Wind Shear](/assets/images/Formatting_WindShear.png)

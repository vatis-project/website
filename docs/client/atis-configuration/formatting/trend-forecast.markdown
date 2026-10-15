---
layout: home
title: Trend Forecast
parent: Formatting
nav_order: 8.4
---

# Trend Forecast

The Trend Forecast element represents the TREND forecast at the end of the METAR. To include this element in the Preset ATIS template, use the `[TREND]` variable. This component is only available for non-FAA ATIS stations.

Under **Change Indicator**, set the text and voice values used for each trend change indicator:

| Indicator | Default text | Default voice |
|-|-|-|
| **NOSIG** | `NOSIG` | No Significant Changes |
| **BECMG** | `BECMG` | Becoming |
| **TEMPO** | `TEMPO` | Temporary |

**Not Available** is the text to print and/or say when the TREND is not available in the METAR. It is empty by default.


![Trend Forecast](/assets/images/Formatting_TrendForecast.png)

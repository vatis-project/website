---
layout: home
title: Altimeter
parent: Formatting
nav_order: 8
---

# Altimeter

The altimeter element from the METAR.

* `{altimeter}` ... The numeric altimeter value (e.g. 2998 or 1013)
* `{altimeter|inhg}` ... The numeric altimeter value converted to inches of mercury (inHg)
* `{altimeter|hpa}` ... The numeric altimeter value converted to hectopascals (hPa)
* `{altimeter|text}` ... The altimeter value translated to words (e.g. TWO NINER NINER TWO)
* `{qfe|ELEVATION_FT}` ... Aerodrome atmospheric pressure. Replace `ELEVATION_FT` with the field elvation in feet. Only available for non-FAA stations.

![Altimeter](/assets/images/Formatting_Altimeter.png)


---
layout: home
title: Remark Wind
parent: Formatting
nav_order: 8.3
---

# Remark Wind

The Remark Wind element represents the wind reported in the remarks section of the METAR, such as the wind at a specific height above the runway. To include this element in the Preset ATIS template, use the `[RMK_WIND]` variable. This component is only available for non-FAA ATIS stations.

Set the text and voice templates for the remark wind. The defaults are:

* **Text**: `WIND {height}FT {dir}/{speed}KT`
* **Voice**: `Wind {height} feet {dir} degrees {speed} knots`

The following variables are available:

* `{height}` ... The height of the wind observation in feet.
* `{dir}` ... The wind direction in degrees, or VRB if variable.
* `{speed}` ... The wind speed in knots, including any gust (e.g. 03G10).

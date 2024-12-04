---
layout: home
title: Wind
parent: Formatting
nav_order: 2
---

# Wind

The Wind element represents the wind information obtained from the METAR report. To include this element in the Preset ATIS template, use the `[WIND]` variable.

![Wind](/assets/images/Formatting_SurfaceWind.png)

**Speak wind speed leading zero**<br/>
When this option is enabled, the leading zero on wind speeds less than 10 will be spoken. For example, if the wind speed is 05, it will be pronounced as "ZERO FIVE" instead of just "FIVE".

**Magnetic Variation**<br/>
When enabled, the wind direction in the text-to-speech output will be adjusted based on the specified magnetic variation value. This ensures that accurate wind direction information is provided.

<hr/>

You can customize the formatting for various wind types, including:

* **Standard wind** (e.g. 25010KT)
* **Standard wind with gusts** (e.g. 18015G20KT)
* **Variable wind** (e.g. VRB05KT)
* **Variable wind with gusts** (e.g. VRB05G15KT)
* **Wind with variable direction** (e.g. 240V270)
* **Calm wind**

The following variables are available to further customize the display of wind data. Note that some variables are only available for certain wind types:

* `{wind}` ... The complete wind string (only available for text ATIS, e.g., 25010G15KT V250V280)
* `{wind_dir}` ... The magnetic direction of the wind (e.g., 25010KT would yield 250)
* `{wind_spd}` ... The speed/velocity of the wind (e.g., 25010KT would yield 10)
* `{wind_gust}` ... The gust speed/velocity of the wind (e.g., 25010G18KT would yield 18)
* `{wind_vmin}` ... The first extreme wind direction (e.g., 250V280 would yield 250)
* `{wind_vmax}` ... The last extreme wind direction (e.g., 250V280 would yield 280)
* `{wind_unit}` ... The wind speed unit of measurement (e.g., 25010KT would yield KT, and the spoken value would be KNOTS)
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

**Speak wind speed in group format**<br/>
When this option is enabled, the wind speed is spoken in group form. For example, a wind speed of 25 is pronounced as "TWENTY-FIVE" instead of "TWO FIVE". The leading zero option is disabled while this option is enabled.

**Magnetic Variation**<br/>
When enabled, the wind direction is adjusted by the specified magnetic variation value in both the text and voice ATIS. This applies to `{wind_dir}` and to the variable direction values `{wind_vmin}` and `{wind_vmax}`. The complete wind string `{wind}` is shown as reported in the METAR and is not adjusted.

**Calm Wind Speed**<br/>
Set on the **Calm** tab. Wind is treated as calm, and the Calm template is used, when the wind speed is at or below this value (in the unit the METAR reports) or when both the direction and speed are zero. The default is 2.

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
* `{wind_spd}` ... The speed/velocity of the wind (e.g., 25010KT would yield 10). The speed can be converted to another unit with `{wind_spd|kt}` or `{wind_spd|mps}`.
* `{wind_gust}` ... The gust speed/velocity of the wind (e.g., 25010G18KT would yield 18). The speed can be converted to another unit with `{wind_gust|kt}` or `{wind_gust|mps}`.
* `{wind_vmin}` ... The first extreme wind direction (e.g., 250V280 would yield 250)
* `{wind_vmax}` ... The last extreme wind direction (e.g., 250V280 would yield 280)
* `{wind_unit}` ... The wind speed unit of measurement (e.g., 25010KT would yield KT, and the spoken value would be KNOTS)

### Wind speed digits in the text ATIS
By default, wind speeds in the text ATIS are shown with two digits (e.g. 09). Add `:` followed by one or more `#` characters to set the minimum number of digits:

| Template | Wind speed 9 |
|-|-|
| `{wind_spd}` | 09 |
| `{wind_spd:#}` | 9 |
| `{wind_spd:##}` | 09 |
| `{wind_spd:###}` | 009 |

This works for `{wind_spd}`, `{wind_gust}` and their unit variants, for example `{wind_spd|kt:#}` or `{wind_gust:#}`. The digit count applies to the text ATIS only and is ignored in the voice ATIS.

<hr/>

## Variable Format


![Wind Variable Format](/assets/images/Formatting_SurfaceWind_VariableFormat.png)

The Variable Format tab lets you set the number style and a suffix for each wind variable (`{wind_dir}`, `{wind_spd}`, `{wind_gust}`, `{wind_vmin}` and `{wind_vmax}`) independently for the text and voice ATIS. Unit variants such as `{wind_spd|kt}` and `{wind_spd|mps}` share the setting of the base variable.

**Style**<br/>
* **Default** ... The built-in rendering (digits in the text ATIS, digit-by-digit words in the voice ATIS).
* **Digits**, **Serial**, **Group** ... Plain digits, digit-by-digit words, or words in groups.

**Suffix**<br/>
Text appended to the value exactly as typed, so include a leading space if needed (e.g. ` knots`).

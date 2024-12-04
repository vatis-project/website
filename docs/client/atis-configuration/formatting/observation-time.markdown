---
layout: home
title: Observation Time
parent: Formatting
nav_order: 1
---

# Observation Time

The observation time refers to the time when the METAR report was generated. To include this information in the Preset ATIS template, use the `[OBS_TIME]` variable.

* `{time}` ... Represents the time value from the METAR (e.g. 0153)
* `{hour}` ... Indicates the hour portion of the time (e.g. 01)
* `{minute}` ... Indicates the minute portion of the time (e.g. 53)
* `{special}` ... Inserts the word "SPECIAL" (voice ATIS only) if the METAR observation time differs from the routine observation time.

![Observation Time](/assets/images/Formatting_ObservationTime.png)

**Routine Observation Time**<br/>
The Routine Observation Time setting allows you to specify the minute interval at which the METAR report is typically generated. For example, if the METAR for KLAX is updated every hour at the 53-minute mark, enter the value `53`. If the METAR station updates multiple times within an hour, you can enter the intervals separated by a comma, such as `15,45`.

If a METAR update is received and the minute of observation time does not match the specified value, it is considered a "special" update. You can use the `{special}` variable in both the Text and Voice templates to include the word "SPECIAL".
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

![Visibility ICAO Formatting](/assets/images/Formatting_Visibility_ICAO.png)

This tab (non-FAA stations) sets how a visibility in meters is written in the text ATIS and spoken in the voice ATIS, for example to show `7000` as `7 KM` and speak it as "seven kilometers".

Each row has an **At or above (m)** value, a **Text** format and a **Voice** format. A row applies from its At or above value up to the next row, so the row with the highest value that does not exceed the visibility is used. Edit a cell by double-clicking it, or select a cell and use the **{raw}**, **{m}** and **{km}** buttons under the table to insert a token. Use **Add New** and **Delete** to manage the rows. The **Preview** list below shows how sample visibilities are written in the text ATIS and spoken in the voice ATIS with the current rows.

Text tokens:

* `{raw}` ... The visibility as reported in the METAR (e.g. `0800`)
* `{m}` ... The visibility in meters (e.g. `800`)
* `{km}` ... The visibility in kilometers (e.g. `7` or `6.5`)

Voice tokens:

* `{m}` ... The visibility in meters, spoken in words (e.g. "eight hundred")
* `{km}` ... The visibility in kilometers (e.g. `7` or `6.5`)

The default rows are:

| At or above (m) | Text | Voice |
|---|---|---|
| 0 | `{raw}` | `{m} meters` |
| 5000 | `{raw}` | `{km} kilometers` |
| 9999 | `10KM` | `10 kilometers or more` |

This shows the METAR value in the text ATIS, speaks meters below 5000 and kilometers from 5000, and reports a visibility of 9999 as 10 kilometers or more. To switch at a different point, change the At or above value of the second row. The 9999 row sets what is shown and spoken when the METAR reports 9999. Remove the unit words from the Voice column to speak the visibility without a unit. To show `7000` as `7 KM` in the text ATIS, set the Text of the second row to `{km} KM`.

For example, with the rows below, `0800` is shown as `800 M` and spoken as "eight hundred meters", and `7000` is shown as `7 KM` and spoken as "7 kilometers":

| At or above (m) | Text | Voice |
|---|---|---|
| 0 | `{m} M` | `{m} meters` |
| 5000 | `{km} KM` | `{km} kilometers` |
| 9999 | `10KM+` | `10 kilometers or more` |

Visibilities below the lowest row are shown as reported in the METAR and spoken in meters.

When the METAR reports a directional minimum (e.g. `7000 4000E`), each value is formatted with the rules. The direction comes from the **Direction** tab (e.g. `7 KM 4000 M E` in the text ATIS). The minimum is spoken in group form (e.g. "twelve hundred"). The CAVOK row is used before these rules.

The **CAVOK** row below the table sets what is shown in the text ATIS and spoken in the voice ATIS when the METAR reports CAVOK. The default for both is "CAVOK". This row is always present and cannot be deleted.

## Direction

![Visibility Direction](/assets/images/Formatting_Visibility_Direction.png)

This tab (non-FAA stations) sets the wording used for the direction of a lower visibility. A METAR can report a lower visibility in one direction, for example `7000 4000E` means 7000 meters overall and 4000 meters to the east.

Each row is a METAR direction code (`N`, `NE`, `E`, `SE`, `S`, `SW`, `W`, `NW`) with two columns:

* **Text** ... Shown in the text ATIS in place of the code. The default is the METAR code, so `7000 4000E` stays `7000 4000E`.
* **Voice** ... Spoken in the voice ATIS. The default is a phrase such as "to the east", so the example is spoken as "seven kilometers and to the east four thousand meters".

## Fractions (Voice)

![Visibility Fractions](/assets/images/Formatting_Visibility_Fractions.png)

This tab (FAA stations) sets the spoken text for fractional visibility values such as `1/2SM` or `1 1/2SM`. Each row is the METAR value and the text spoken in the voice ATIS.

The text ATIS continues to show the METAR value as received.

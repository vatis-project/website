---
layout: home
title: Runway Condition
parent: Formatting
nav_order: 8.2
---

# Runway Condition

The Runway Condition element represents the runway state groups in the METAR (for example `R25/290150`), which report the deposit on the runway, its depth and the estimated surface friction. To include this element in the Preset ATIS template, use the `[RWY_COND]` variable. This component is only available for non-FAA ATIS stations.

## Template
Set the text and voice templates used for each reported runway. The defaults are:

* **Text**: `RWY {runway} {deposit} {depth} {friction}`
* **Voice**: `Runway {runway} {deposit} {depth} {friction}`

The following variables are available:

* `{runway}` ... The runway identifier.
* `{deposit}` ... The type of deposit on the runway (e.g. wet, covered with slush).
* `{depth}` ... The depth of the deposit in millimeters or centimeters. Empty if not reported.
* `{friction}` ... The estimated surface friction (e.g. good, medium to poor). Empty if not reported.
* `{raw}` ... The raw runway state group as it appears in the METAR (e.g. `R25/290150`). Text template only.

![Runway Condition](/assets/images/Formatting_RunwayCondition.png)

## Wording
The Wording tab lets you change the text and spoken wording for each deposit, depth and friction term. Use `{value}` in the depth wording to insert the depth (for example `{value} millimeters`).

![Runway Condition Wording](/assets/images/Formatting_RunwayCondition_Wording.png)

| Term | Default text | Default spoken |
|-|-|-|
| Clear and dry | `CLEAR AND DRY` | clear and dry |
| Damp | `DAMP` | damp |
| Wet | `WET` | wet |
| Rime | `COVERED WITH RIME` | covered with rime |
| Dry snow | `COVERED WITH DRY SNOW` | covered with dry snow |
| Wet snow | `COVERED WITH WET SNOW` | covered with wet snow |
| Slush | `COVERED WITH SLUSH` | covered with slush |
| Ice | `COVERED WITH ICE` | covered with ice |
| Compacted snow | `COVERED WITH COMPACTED SNOW` | covered with compacted snow |
| Frozen ruts | `FROZEN RUTS` | frozen ruts |
| Not operational | `NOT OPERATIONAL DUE TO DEPOSITS` | not operational due to deposits |
| Depth (1 millimeter) | `{value}MM` | `{value}` millimeter |
| Depth (millimeters) | `{value}MM` | `{value}` millimeters |
| Depth (centimeters) | `{value}CM` | `{value}` centimeters |
| Friction good | `FRICTION GOOD` | estimated surface friction good |
| Friction medium to good | `FRICTION MEDIUM TO GOOD` | estimated surface friction medium to good |
| Friction medium | `FRICTION MEDIUM` | estimated surface friction medium |
| Friction medium to poor | `FRICTION MEDIUM TO POOR` | estimated surface friction medium to poor |
| Friction poor | `FRICTION POOR` | estimated surface friction poor |
| Friction unreliable | `FRICTION UNRELIABLE` | estimated surface friction unreliable |

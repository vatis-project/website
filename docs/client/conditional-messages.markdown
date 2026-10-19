---
layout: home
title: Conditional Messages
parent: vATIS
nav_order: 9
---

# Conditional Messages

A static [Airport Conditions](/docs/client/airport-conditions) or [NOTAMs](/docs/client/notams) message can be included in the ATIS only while certain things are true, instead of being switched on and off by hand. There are two kinds of condition, and a message can use both:

* **Controllers online**: include the message only while specific VATSIM controllers are online, or only while they are offline.
* **Weather**: include the message only when the METAR meets rules you define, such as *ceiling below 200 feet*.

Typical uses are a frequency NOTAM that depends on whether Delivery is staffed, and a *Low Visibility Procedures in operation* airport condition that follows the weather.

Conditions are set in the message editor, which opens when you add a message with **New** or change one with **Edit** in the Airport Conditions or NOTAMs dialog. A message with no conditions is always included, as before. A message whose checkbox is not selected is never included, whatever its conditions say.

When both kinds of condition are set, **both** must be met for the message to be included.

## Controllers Online

![Include when a controller is online](/assets/images/StaticDefinitionEditorDialog_OnlineCondition.png)

In the **Include** row, choose when the message applies:

* **Always**: The message has no controller condition.
* **When online**: The message is included while at least one of the listed callsigns is online.
* **When offline**: The message is included while none of the listed callsigns is online.

When you choose **When online** or **When offline**, enter one or more callsigns, separated by commas or spaces. Callsigns are not case-sensitive, and the whole callsign must match. Use `*` as a wildcard for any run of characters:

| Entry | Matches |
|-|-|
| `EPWA_DEL` | Only `EPWA_DEL` |
| `EPWA_APP, EPWA_F_APP` | Either callsign |
| `EPWW_*_CTR` | `EPWW_CTR`, `EPWW_W_CTR`, `EPWW_E_CTR`, ... |
| `EPWA_*` | Any `EPWA_` position, including Tower and Ground |

Observers and ATIS connections are not counted as controllers.

### Example: Frequencies that depend on who is staffed
Some airports give different instructions depending on which positions are staffed. These NOTAMs are set on the same station, and in each pair only one is included at a time. The wording is only an example:

| NOTAM | Include | Callsigns |
|-|-|-|
| REPORT READY FOR START UP ON DELIVERY 121 DECIMAL 605 | When online | `EPWA_DEL` |
| REPORT READY FOR START UP ON TOWER 119 DECIMAL 980 | When offline | `EPWA_DEL` |
| AFTER DEPARTURE CONTACT APPROACH 121 DECIMAL 075 | When online | `EPWA_APP` |
| AFTER DEPARTURE CONTACT TOWER 119 DECIMAL 980 | When offline | `EPWA_APP` |

### Where the online list comes from
vATIS reads the list of online controllers from the [VATSIM data feed](https://vatsim.dev/api/data-api/get-network-data). The feed location is taken from the [VATSIM status file](https://status.vatsim.net/status.json), and if several feeds are listed vATIS picks one at random and tries the next if it fails.

* The feed is only read once a station has a message with a controller condition, so users who do not use this feature never make the request.
* The feed is refreshed once a minute, so a controller logging on or off can take up to a minute to show up.
* If the feed cannot be reached, vATIS keeps the last list it received. Until it has received one, nobody is considered online: **When offline** messages are included and **When online** messages are not.

## Weather

![Weather rules](/assets/images/StaticDefinitionEditorDialog_WeatherRules.png)

Click **Add rule** in the **Weather** row to add a rule. Each rule compares one value from the METAR with a limit. The message is included while the rules are met. A message without weather rules is not affected by the weather.

A rule is made of a field, a comparison, and a value:

| Field | Compares | Units |
|-|-|-|
| Ceiling | Height of the ceiling: the lowest cloud layer of the types set as ceiling in the [Clouds format](/docs/client/atis-configuration/formatting/clouds#ceiling) (broken and overcast by default) | ft, m |
| Lowest cloud base | Height of the lowest cloud layer of any coverage | ft, m |
| RVR | The lowest runway visual range reported | m, km, ft |
| Visibility | Prevailing visibility. CAVOK counts as 9999 m | m, km, ft |
| Wind speed | Mean wind speed | kt, km/h, m/s |
| Wind gust | Gust speed | kt, km/h, m/s |
| Wind direction | Mean wind direction. Variable winds (VRB) never match | deg |
| Temperature | Air temperature | °C, °F |
| Dewpoint | Dewpoint | °C, °F |
| QNH / altimeter | The pressure setting, converted if the METAR uses the other unit | hPa, inHg |
| Runway deposit depth | The deepest deposit in the METAR's runway condition groups | mm |
| Present weather | Present weather codes, e.g. `TS`, `FZRA`, `+SN`, `FG` | |
| Cloud type | Cloud types in the METAR: `CB` or `TCU` | |
| Windshear | Whether windshear is reported | |
| CAVOK | Whether the METAR reports CAVOK | |

Numeric fields use **below**, **above**, **at or below**, **at or above** or **equals**, and a number. The number is converted from the unit you choose, so a ceiling of `200 ft` works whether the METAR is in feet or the station reports meters.

Present weather and cloud type use **includes** or **does not include**, and one or more codes separated by commas or spaces. They match when *any* listed code is found, and a code matches inside longer ones: `RA` matches `-RA`, `+RA` and `TSRA`. Windshear and CAVOK use **is reported** or **is not reported**.

{: .note-title }
> Note
>
> A rule is not met when the METAR does not report the value it needs. With no RVR reported, both *RVR below 550 m* and *RVR above 550 m* are false. **does not include** and **is not reported** are the exception: they are met whenever a METAR exists but does not contain the code or condition. Before the first METAR has been received no rule is met.

### Combining rules with AND and OR
Every rule after the first starts with **AND** or **OR**, which joins it to the rule before it. **AND** is evaluated before **OR**, as in ordinary logic, so

`Ceiling below 200 ft` **AND** `RVR below 550 m` **OR** `Visibility below 100 m`

means *(ceiling below 200 ft and RVR below 550 m) or visibility below 100 m*, which is what the screenshot above sets up. Parentheses are not supported. If you need `A AND (B OR C)`, write it as `A AND B OR A AND C`.

Use **Remove** to delete a rule. If you remove the first rule, the next one becomes the first and its AND/OR is ignored.

### Example: Low Visibility Procedures
An airport condition that announces LVP when the ceiling is below 200 ft or the RVR is below 550 m:

| Rule | Field | Comparison | Value |
|-|-|-|-|
| 1 | Ceiling | below | 200 ft |
| 2 (OR) | RVR | below | 550 m |

Set the message text to `LOW VISIBILITY PROCEDURES IN OPERATION`. It appears in the ATIS while the METAR meets either rule and disappears again when it does not.

## When Conditions Are Checked
* When a station is connected, the ATIS is rebuilt as soon as a new METAR arrives, or when a controller logs on or off changes which messages apply. vATIS only rebuilds when the set of included messages actually changed.
* The ATIS letter is **not** advanced by these changes. It advances for a new METAR in the usual way, but a controller logging on or off will update the ATIS text under the same letter.
* The free-form text area in the main window lists the static messages that currently apply, so you can see what will be broadcast.
* The [Sandbox](/docs/client/atis-configuration/sandbox) uses the METAR in its METAR field to evaluate weather rules, and the current list of online controllers.

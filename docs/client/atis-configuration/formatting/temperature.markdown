---
layout: home
title: Temperature
parent: Formatting
nav_order: 6
---

# Temperature

The temperature element from the METAR.

* `{temp}` ... The temperature value (e.g. 05)
* `{prefix_symbol}` ... The symbol indicating the temperature range (+ or -). This can only be used in the text ATIS template.

![Weather](/assets/images/Formatting_Temperature.png)

**Prefix positive temperature with "plus" in voice ATIS**<br/>
When enabled, positive temperatures will be prefixed with the word "plus" in the voice ATIS. For example, "TEMPERATURE PLUS TWO FIVE".

**Speak leading zero in voice ATIS**<br/>
When enabled, the leading zero will be spoken in the voice ATIS. For example, "TEMPERATURE ZERO SIX".

### Customization
You can customize how the temperature is displayed in your text ATIS with the following options:
- **Digit Formatting**: Use `#` to control the number of digits shown. For example, `{temp:#}` will display only the significant digits, removing the leading zero for values less than 10 (e.g., 8 instead of 08). By default, the temperature will display with two digits.
- **Removing the "M" Prefix**: To remove the "M" prefix from negative temperatures, use `{temp:M}` or `{temp:##M}`. For example, **M05** will display as **05**.
- **Replacing the "M" Prefix**: To replace the "M" prefix with a dash, add `-` after the digits, for example `{temp:##-}`, which displays **M05** as **-05**. To replace it with your own text, put the text in single quotes, for example `{temp:##'MS'}`, which displays **M05** as **MS05**.

<hr/>

## Variable Format


![Temperature Variable Format](/assets/images/Formatting_Temperature_VariableFormat.png)

The Variable Format tab controls how each numeric variable is written, separately for the text ATIS and the voice ATIS. The row for `{temp}` has a **Text** and a **Voice** column group, each with a **Style** and a **Suffix**.

**Style**<br/>
* **Default** ... The built-in rendering (digits in the text ATIS, digit-by-digit words in the voice ATIS).
* **Digits** ... Plain digits (e.g. 1013).
* **Serial** ... Digit-by-digit words (e.g. ONE ZERO ONE THREE).
* **Group** ... Words in groups (e.g. TEN THIRTEEN).

**Suffix**<br/>
Text appended to the value exactly as typed, so include a leading space if you need one (e.g. ` knots`).

Every setting defaults to the previous behavior, so existing profiles are unchanged.

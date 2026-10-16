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

The Variable Format tab controls how the numeric variable is written. The row for `{temp}` has a **Text suffix**, a **Voice style** and a **Voice suffix**. There is no text style: the digits in the text ATIS are set by the format in the template, for example `{temp:##}` (see Customization above).

**Voice style**<br/>
* **Default** ... The built-in rendering (digit-by-digit words).
* **Digits** ... Plain digits (e.g. 1013).
* **Serial** ... Digit-by-digit words (e.g. ONE ZERO ONE THREE).
* **Group** ... Words in groups (e.g. TEN THIRTEEN).

**Text suffix and Voice suffix**<br/>
Text appended to the value in the text or voice ATIS, exactly as typed, so include a leading space if you need one (e.g. ` knots`).

Every setting defaults to the previous behavior, so existing profiles are unchanged.

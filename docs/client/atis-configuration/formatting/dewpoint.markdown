---
layout: home
title: Dewpoint
parent: Formatting
nav_order: 7
---

# Dewpoint

The dewpoint element from the METAR.

* `{dewpoint}` ... The dewpoint temperature value (e.g. 05)
* `{prefix_symbol}` ... The symbol indicating the temperature range (+ or -). This can only be used in the text ATIS template.

![Dewpoint](/assets/images/Formatting_Dewpoint.png)

**Prefix positive temperature with "plus" in voice ATIS**<br/>
When enabled, positive temperatures will be prefixed with the word "plus" in the voice ATIS. For example, "DEWPOINT PLUS TWO FIVE".

**Speak leading zero in voice ATIS**<br/>
When enabled, the leading zero will be spoken in the voice ATIS. For example, "DEWPOINT ZERO SIX".

### Customization
You can customize how the dewpoint temperature is displayed in your text ATIS with the following options:
- **Digit Formatting**: Use `#` to control the number of digits shown. For example, `{dewpoint:#}` will display only the significant digits, removing the leading zero for values less than 10 (e.g., 8 instead of 08). By default, the dewpoint will display with two digits.
- **Removing the "M" Prefix**: To remove the "M" prefix from negative dewpoint, use `{dewpoint:M}` or `{dewpoint:##M}`. For example, **M05** will display as **05**.
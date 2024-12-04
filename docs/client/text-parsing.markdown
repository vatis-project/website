---
layout: home
title: Text Parsing
parent: vATIS
nav_order: 10
---

# Text Parsing

The following text parsing rules can be used in the free-form textboxes for Airport Conditions and NOTAMs:

### Taxiways
To parse taxiway names, include the acronym `TWY` or `TWYS` before the identifier. For example, `TWY E16` will be pronounced as "taxiway echo sixteen" by the voice synthesizer.

### Runways
To parse runway names, include the acronym `RWY`, `RWYS`, `RUNWAY`, or `RUNWAYS` before the identifier. For example, `RWY 25R` will be pronounced as "runway two five right" by the voice synthesizer.

Alternatively, you can prefix the runway identifier with a caret symbol (`^`) and the voice synthesizer will pronounce the runway correctly. For example, `^25R` would be read as "TWO FIVE RIGHT."

### Numbers
To pronounce numbers in group format, prepend an asterisk (`*`), followed by the number, or enclose the number in braces (`{}`). For example, `*5058` (or `{5058}`) will be pronounced as "five thousand, fifty-eight."

If the number should be pronounced as negative, add a dash after the asterisk. For example, `*-8` will be pronounced as "minus eight."

### Airport Names
To parse airport identifiers into the airport name, prepend a plus sign (`+`) before the ICAO identifier. For example, `+KLAX` will be read as "Los Angeles International Airport" by the voice synthesizer.

### Navaids
To parse navaid identifiers into their names, prepend a plus sign (`+`) before the navaid identifier. For example, `+GBN` will be read as "Gila Bend" by the voice synthesizer.

### Contractions
To include a contraction, type the `@` symbol, followed by the contraction variable name. As you type, an autocomplete popup menu will display the available contraction options, allowing you to quickly select the desired contraction. See the [Contractions](atis-configuration/contractions) section for details on adding a contraction.
---
layout: home
title: Static Messages
parent: vATIS
nav_order: 7
---

# Static Messages

Airport Conditions and NOTAMs each have a free-form text box in the main window. On top of that, you can define static messages that can be toggled on or off. They're good for phrases you use all the time. Static messages are saved to the ATIS station and can be applied with any selected preset.

Airport Conditions and NOTAMs work the same way, so this page covers both. Where they differ, it says so.

![Airport Conditions](/assets/images/AirportConditionsDialog.png)

![NOTAMs](/assets/images/NotamsDialog.png)

## Adding or Managing Static Messages
To create or manage static messages:
1. Click the **AIRPORT CONDITIONS** or **NOTAMS** label above the free-form text box.
2. A dialog window will appear, allowing you to add, edit, or delete messages.
3. You can reorder messages by selecting one from the list and using the **Up** or **Down** buttons. Messages are displayed in the ATIS in the order they appear, but only if their checkboxes are selected.

When composing or modifying a message, you can insert contractions by typing the **@** symbol followed by the contraction variable name. As you type, an autocomplete menu will appear, showing available contraction options for quick selection. Contraction variables may optionally include the **@** symbol as a prefix. Once you choose a contraction from the autocomplete dropdown, the **@** symbol will be automatically removed.

![Contraction search](/assets/images/AirportConditions_ContractionSearch.gif)

### Include Before Free-form Text
If enabled, the checked static messages will be included before the free-form Airport Conditions or NOTAMs text in the ATIS.

### Conditional Messages
A static message can be included only while certain VATSIM controllers are online or offline, or only when the METAR meets rules you set, such as a ceiling or RVR limit. See [Conditional Messages](conditional-messages).

![Conditional message](/assets/images/StaticDefinitionEditorDialog_WeatherRules.png)

### Separators
When more than one message is checked, vATIS puts a separator between them in the ATIS. The separator is a period followed by a space unless you change it, so the checked messages read as separate sentences. Messages are used in the order they appear in the list.

* **Default separator**: The field at the bottom of the dialog. It goes between every two checked messages, unless a message has its own separator.
* **Separator after**: Set in the message editor, this replaces the default separator that follows the message you are editing. Leave it blank to use the default separator. It has no effect on the last checked message, since nothing follows it.

A separator is used exactly as typed, including spaces, so include any space you need (for example `... ` with a space after the dots). Separators apply only between the checked messages.

The checked messages are joined to the free-form text with a space for Airport Conditions and with a period for NOTAMs, whichever comes first.

For example, with these checked Airport Conditions messages and a separator of `... ` after the first one:

1. SIMUL ILS APPS IN PROG RWYS 24R AND 25L
2. SIMUL VIS APPS TO ALL RWYS ARE IN PROG
3. RWY 6L/24R CLSD

the ATIS reads:

`SIMUL ILS APPS IN PROG RWYS 24R AND 25L... SIMUL VIS APPS TO ALL RWYS ARE IN PROG. RWY 6L/24R CLSD`

{: .note-title }
> Note
>
> While every separator is the default, vATIS tidies up repeated punctuation, so a message that already ends with a period does not produce two. As soon as any separator is customized, vATIS stops tidying and uses exactly what you typed. In that case leave the final period off your messages and let the separators supply the punctuation.

![Separator after](/assets/images/StaticDefinitionEditorDialog.png)

---
layout: home
title: Contractions
parent: ATIS Configuration
nav_order: 4
---

# Contractions

The Contractions tab allows you to define personalized contractions. If you specify a contraction that already exists in the [Default Contractions](default-contractions) list, your new definition will overwrite it. Contractions serve various purposes, such as creating acronyms or modifying the pronunciation of words when using the text-to-speech engine.

![Contractions](/assets/images/Contractions.png)

## Adding New Contraction
* To add a new contraction, click the **New** button.
* A dialog will open, prompting you to enter the following details:
    * **Variable**: The name of the contraction variable. If you enter multiple words, it will be automatically converted to variable format (e.g., spaces will be replaced with underscores).
    * **Match using a regular expression**: Turns the contraction into a pattern that is matched against your text instead of being inserted with `@`. See [Regular Expression Contractions](#regular-expression-contractions).
    * **Text**: The written ATIS text that will be displayed.
    * **Voice**: The text that will be spoken by the voice synthesizer.
    * **Add to all ATIS stations in this profile**: When checked, the contraction is added to every ATIS station in the current profile instead of only the selected one.

![New Contraction](/assets/images/NewContractionDialog.png)

After filling in the required information, save the contraction to make it available for use in your ATIS messages.

## Editing Existing Contraction
1. Select the contraction in the table.
2. Click the **Edit** button. The same dialog used for new contractions opens with the current values filled in.
3. Make your changes and click **OK** to save them, or **Cancel** to discard them.

The table cannot be edited directly. The **Edit** button is only available when a contraction is selected.

## Deleting Contraction
1. Select the contraction from the table.
2. Click the **Delete** button to remove the contraction. This action is irreversable.

## Using Contractions

Contractions and speech tokens (such as numbers written in group format, e.g. `*5058`) are underlined in the ATIS template and Airport Conditions and NOTAMs editors. Hover over the underlined text to see how it will be spoken.

To include a contraction, type the @ symbol, followed by the contraction variable name. As you type, an autocomplete popup menu will display the available contraction options, allowing you to quickly select the desired contraction.

## Regular Expression Contractions

A regular expression (regex) contraction is matched against the text of your ATIS template, Airport Conditions and NOTAMs, so you don't have to define a contraction for every possible value or type the `@` symbol. Use one when the same format repeats with different values, such as `RSC 23 5/5/5` or approach suffix letters like the `Z` in `ILS Z RWY 28R`. The written text can stay exactly as you typed it while the spoken version is spaced out or converted for the voice synthesizer.

![New Regex Contraction](/assets/images/NewContractionDialog_Regex.png)

1. Click **New** and check **Match using a regular expression**.
2. Enter the **Variable**. For a regex contraction this is only a label, but it must still be unique.
3. Enter the **Pattern**, a [.NET regular expression](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference). Wrap the parts that change in parentheses to capture them. The pattern is case-sensitive; start it with `(?i)` to ignore case.
4. Enter the **Text** and **Voice** replacements, using the captured parts described below.

To change a regex contraction later, select it and click **Edit**.

![Contractions](/assets/images/Contractions.png)

### Using captured groups

| Syntax | Meaning |
|-|-|
| `$1`, `$2`, ... | The text captured by the first, second, ... set of parentheses |
| `${name}` | The text captured by a named group, written `(?<name>...)` in the pattern |
| `$$` | A literal `$` |

### Functions

Wrap a group in a function to change how it is spoken. Function names are not case-sensitive. When you type `$` in the **Text** or **Voice** of a regex contraction, a list of functions appears. Use the arrow keys and press **Enter** or **Tab** to insert one, or **Esc** to dismiss the list. The cursor is left inside the brackets, ready for the group number.

| Function | Example input | Result |
|-|-|-|
| `$group($1)` | `525` | five hundred and twenty-five |
| `$digits($1)` | `525` | five two five |
| `$spell($1)` | `ABC` | A B C |
| `$phonetic($1)` | `ABC` | Alpha Bravo Charlie |

Digits left in the voice text without a function are still read one at a time by the normal text-to-speech rules, so use `$group()` for quantities and `$spell()` or `$phonetic()` for letters.

### Examples

| Purpose | Pattern | Text | Voice |
|-|-|-|-|
| Approach suffix letter, speak it phonetically | `(ILS\|RNAV) ([XYZ])\b` | `$1 $2` | `$1 $phonetic($2)` |
| Runway surface condition codes | `RSC (\d+) (\d)/(\d)/(\d)` | `RSC $1 $2/$3/$4` | `RSC $digits($1) $digits($2) $digits($3) $digits($4)` |
| Number as a quantity | `(\d{4})FT` | `$1FT` | `$group($1) FEET` |

With the first example, `ILS Z RWY 28R` stays as written in the text ATIS and has the letter spoken as "Zulu", so it is read "ILS Zulu RWY 28R".

### Checking your pattern

While you type, vATIS checks the pattern and the replacements and explains any problem under the box in plain language. The **OK** button will not close the dialog until the problems are fixed. The same checks apply when you edit a contraction.

![Regex error](/assets/images/NewContractionDialog_RegexError.png)

Things it catches include:

* A missing or extra bracket, such as `(` without a closing `)`
* A pattern that matches empty text, such as `a*`, which would match everywhere
* A replacement that refers to a group the pattern does not have, such as `$3` when the pattern only has two sets of parentheses
* An unknown function name, or a function without a group, such as `$spell` instead of `$spell($1)`

### Notes

* Regex contractions are applied in the order they appear in the table, before `@` contractions.
* Regex contractions are applied automatically wherever the pattern matches, so you do not type `@` for them and they do not appear in the `@` autocomplete menu.
* An invalid pattern or an unknown function name is rejected when you save it. A pattern that takes too long to run is ignored.
* Regex contractions also apply to [D-ATIS](presets) text, so a pattern such as the RSC example works on a real-world D-ATIS without any reformatting.

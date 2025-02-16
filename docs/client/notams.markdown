---
layout: home
title: NOTAMs
parent: vATIS
nav_order: 8
---

# NOTAMs

In addition to the free-form NOTAMs text, you can define static messages that can be toggled on or off. These static messages are ideal for frequently used predefined phrases, offering flexibility to enable or disable them as needed. Static messages are saved to the ATIS station and can be applied with any selected preset.

![NOTAMs](/assets/images/NotamsDialog.png)

## Adding or Managing Static Messages
To create or manage static messages:
1. Click on the **NOTAMS** label above the free-form text box.
2. A dialog window will appear, allowing you to add, edit, or delete messages.
3. You can reorder messages by selecting one from the list and using the **Up** or **Down** buttons. Messages are displayed in the ATIS in the order they appear, but only if their checkboxes are selected.

When composing or modifying a message, you can insert contractions by typing the **@** symbol followed by the contraction variable name. As you type, an autocomplete menu will appear, showing available contraction options for quick selection. Contraction variables may optionally include the **@** symbol as a prefix. Once you choose a contraction from the autocomplete dropdown, the **@** symbol will be automatically removed.

![NOTAMS contraction search](/assets/images/Notams_ContractionSearch.gif)

### Include Before Free-form NOTAMs
If enabled, the checked static messages will be included before the free-form NOTAMs text in the ATIS.

{: .note }
The main window always shows static messages in front of the free-form NOTAMs, regardless of this setting. Text and voice ATIS messages will include the static messages in the correct location.
---
layout: home
title: ATIS Station
parent: vATIS
nav_order: 6
---

# ATIS Station

Each ATIS Station appears as a separate tab in the main user interface. When an ATIS is connected, the current ATIS letter is highlighted in cyan. 

If another controller connects an ATIS that you’ve added to your available stations, the ATIS letter will automatically sync and appear in the corresponding tab, just as if you were hosting that ATIS yourself. Any ATIS Station that you connect will also be synced to other users who have the ATIS Station added to their profile.

After disconnecting an ATIS, the ATIS letter will remain synced with other users for 5 minutes before being removed. This provides a seamless transition if another user takes over your ATIS connections and wishes to continue using the same ATIS letter.

![ATIS Stations](/assets/images/AtisStations.png)

The selected airport conditions and NOTAMs will be displayed in cyan-colored text within the free-form text boxes. This cyan-colored text is read-only and cannot be edited directly. The selected definitions will always appear before the free-form text, even if the "Include before free-form text" option is enabled. The rest of the text within the box can be edited as usual.

## New ATIS Update
When a new ATIS update is ready, the ATIS letter for the corresponding ATIS Station will blink. If you have enabled notification sounds, you will also hear a notification sound. To acknowledge the ATIS update, select the respective ATIS Station tab and left-click the ATIS letter once.

![Acknowledge Update](/assets/images/AcknowledgeUpdate.gif)

## Manually Enter ATIS Letter
If you prefer not to cycle through each letter to find the one you want, you can manually enter the ATIS letter. To enter the ATIS letter edit mode, **Shift + Left Double-Click** on the ATIS letter box. The cursor will change to a blinking I-beam, indicating that you can start typing. Type the desired letter and press Enter to confirm it. Press ESC (Escape) to cancel the action.

![Type ATIS Letter](/assets/images/TypeAtisLetter.gif)

## Fetch Real-World D-ATIS Letter
If the **Automatically fetch ATIS letter** option is enabled in User Settings, vATIS will automatically retrieve the real-world D-ATIS letter for stations with an FAA digital ATIS when connecting to the network. This process loads only the ATIS letter and does not include any related messages, such as airport conditions or NOTAMs.

## Fetch Real-World D-ATIS

If the **Automatically fetch D-ATIS** option is enabled in [User Settings](user-settings), vATIS can fill in the Airport Conditions and NOTAMs from the real-world digital ATIS, replacing the need for external tools such as vATISLoad.

1. Create a preset named **D-ATIS** for the station (the name is not case-sensitive) and select it in the preset list on the ATIS Station.
2. vATIS fetches the real-world D-ATIS right away, then every 5 minutes while the preset remains selected. The ATIS letter, Airport Conditions, and NOTAMs are updated each time.
3. Selecting a different preset stops the automatic updates.

Things to know:

* The real-world ATIS is matched to the station type: a Combined station uses the combined ATIS (or the departure ATIS if there is no combined one), while Arrival and Departure stations use the matching arrival or departure ATIS.
* If no D-ATIS is available for the station, the Airport Conditions show **D-ATIS NOT AVBL.**
* Text fetched automatically is not saved to the preset. Only your own edits to a D-ATIS preset are saved.
* The opening sentences of the real-world ATIS (station, letter, and weather) are removed, as is the trailing "ADVS YOU HAVE..." text. Only the airport conditions and NOTAMs are kept, and your [contractions](atis-configuration/contractions) are applied to the text.
* To change how the real-world text is processed, see [D-ATIS](atis-configuration/presets#d-atis).

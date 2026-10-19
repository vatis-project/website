---
layout: home
title: Mini-Window
parent: vATIS
nav_order: 5
---

# Mini-Window

The Mini-Window offers a streamlined display of the current ATIS letter for connected ATIS stations, and optionally the observation time, altimeter, and wind. Stations you are hosting will have a cyan ATIS letter, while other stations will be shown in red.

![Mini-Window](/assets/images/MiniWindow.png)

## Window Controls
![Mini-Window Controls](/assets/images/MiniWindowControls.png)

Right-click on the window to open the window controls context menu.

* Click the **three-dots** icon to show or hide the weather data (observation time, altimeter, and wind) next to each station. The weather data is hidden by default, and your choice is remembered.
* Click the **compass** icon to show the wind with magnetic variation applied. This only changes stations that have a magnetic variation configured on the [Wind](atis-configuration/formatting/wind) formatting tab. The compass icon is only shown while the weather data is displayed, so click the **three-dots** icon first if you don't see it.
* Click the **pin** icon to keep the window on top.
* Click the **double arrow** icon to restore the full vATIS window. You can also double-click an empty part of the Mini-Window.

The menu also lists your online stations. Check or uncheck a station to show or hide it in the Mini-Window.

## Voice ATIS Recording Indicator
For stations configured for [Voice Recorded ATIS](voice-record-atis), a small red dot is shown at the left of the station's row when the voice ATIS needs to be recorded again. Hover over it to see "Voice ATIS needs recording".

## Text ATIS Tooltip
Hover over a station's ATIS letter to see its text ATIS.

## Acknowledge ATIS Update
When a new ATIS update is available, the ATIS letter will blink. Click the blinking letter to acknowledge the update. To acknowledge all blinking ATIS letters at once, you can also right-click or middle-click on any blinking letter.

## Filter ATIS Stations
To view only specific online ATIS stations, right-click the window and check or uncheck the stations you want to show or hide. A station that is hidden does not play its ATIS update notification sound, even if the mute options in [User Settings](user-settings) are off.

![Mini-Window Filter](/assets/images/MiniWindowFilterStations.webp)
---
layout: home
title: Sandbox
parent: ATIS Configuration
nav_order: 6
---

# Sandbox

![ATIS Sandbox](/assets/images/Sandbox.png)

The Sandbox feature provides a dedicated testing environment for experimenting with your ATIS configurations without connecting to the network. It still makes online requests where it needs to: fetching a METAR, the **D-ATIS** preset fetching the real-world D-ATIS, an external ATIS generator calling its URL, and text-to-speech audio. Here's how to use it:

1. Fetch the latest METAR or manually input one.
2. Select a Preset.
3. You have the option to customize the Airport Conditions and NOTAMs text if desired. Additionally, you can access the static definitions window by clicking on the corresponding field labels. Any changes you make to these fields can be saved to the Preset.

If you make changes in other tabs of the ATIS configuration, click the **Apply** button and then **Refresh ATIS** to update the Sandbox ATIS with the latest changes.

Each time the ATIS is refreshed, the Sandbox uses a random letter within the station's code range. If the selected preset uses an [external ATIS generator](presets#external-atis-generator), the Airport Conditions and NOTAMs boxes are replaced by a note, because the ATIS comes from the generator.

Click **Refresh ATIS** to generate the text-based ATIS. This action will also generate voice-based ATIS audio if text-to-speech is enabled in your configuration. To listen to the ATIS audio, click the **Listen** button. The audio will play through your default audio device.
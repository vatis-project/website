---
layout: home
title: General Configuration
parent: ATIS Configuration
nav_order: 1
---

# General Configuration

![Compact Window](/assets/images/AtisConfiguration.png)

{: .note-title }
> Note
>
> If you make any changes in the **General** tab and save them, the ATIS will automatically disconnect from the network (if it is currently connected).

To configure an ATIS station, click on the station in the left sidebar.

* **Frequency**: The VHF frequency assigned to the ATIS station.
* **ATIS Type**: The type of ATIS station, which determines how the ATIS callsign will be displayed on the network.
    * **Combined**: Displayed as `XXXX_ATIS`
    * **Departure**: Displayed as `XXXX_D_ATIS`
    * **Arrival**: Displayed as `XXXX_A_ATIS`
* **Code Range**: Allows you to define the ATIS code range for the station. This feature is helpful for restricting the Departure ATIS to a specific range (e.g., `A..N`) and the Arrival ATIS to a different range (e.g., `M..Z`).
* **Text to Speech/Voice Recorded**: This option lets you choose between digitalized (text-to-speech) or manually recorded voice for the ATIS. If "Text to Speech" is selected, you can further specify the desired voice option. The "Default" option uses the voice similar to that of FAA D-ATIS.
* **Use "decimal" terminology in spoken text**: Enabling this option will cause numbers with decimals to be spoken as "decimal" rather than "point." For example, "one three four decimal two five" instead of "one three four point two five."
* **IDS Endpoint**: If your facility is equipped with an Information Display System (IDS) that is compatible with vATIS, you can enter the URL for automatic ATIS information updates. When a URL is specified, vATIS will send an HTTP POST request with a JSON payload similar to the following:
```json
{
    "facility": "KLAX",
    "preset": "NOISE",
    "atisLetter": "L",
    "atisType": "combined",
    "airportConditions": "ILS APP IN PROG RWY 6R OR VCTR FOR VIS APP WILL BE PROVIDED. OPPOSITE DRCTN TFC DEPTG RWY 25R.",
    "notams": "ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS.",
    "timestamp": "11/27/2024 15:39:59"
    "version": "4.1.0-beta.1"
}
```
vATIS includes a signed JWT (JSON Web Token) in the HTTP header of the POST request as an Authorization Bearer token. You can optionally validate requests to your IDS endpoint by verifying the JWT token using the public [JWKS token](https://hub.vatis.app/.well-known/jwks.json).
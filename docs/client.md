## System Requirements
* Windows 10 64-bit (or newer)
* 200 MB free disk space on the drive where application data is stored (usually C:)

## Installation

[Download](https://github.com/vatis-project/vatis/releases/latest) and run the latest installer from the vATIS website. You will be prompted to choose an installation location. **It is recommended that you leave the default location selected to avoid any folder/file permission problems.** When the installation is complete, you will have the option to launch vATIS.

## Terms and Concepts

Before using vATIS, you should familiarize yourself with a few basic terms and concepts.

* **Profile:** A Profile is the container for one or more ATIS Composites.
* **Composite:** Each ATIS station is defined as its own Composite. Within each Composite, you can specify the current airport conditions and other pertinent ATIS information.
* **Preset:** A Preset is used to save the Airport Conditions, NOTAMS and other ATIS settings. A Composite can have one or more saved Presets. For example, you might create a Preset for "WEST OPS" and one for "EAST OPS".

## Profiles

Each time you launch vATIS, a dialog with a list of Profiles. The first time you run vATIS, the list will be empty. Most users will download and import profiles created by the Facility Engineer of their ARTCC.

To open a Profile, double-click the name of the Profile in the list. The Profile dialog will hide and the main vATIS window will appear.

![Settings](media/ProfileDialog.png ':size=345')

**Import Profile**<br/>
To import a vATIS Profile, click the **Import** button. A file browser dialog will show allowing you to browse to the location of the Profile file. Importing a Profile will import the associated Composites and their configured options and settings.

**Create a New Profile**<br/>
To create a new Profile, click the **New** button at the top right of the Profile dialog window. You will be prompted to enter a name for the profile. A Profile can contain one more Composites. For example, you might create a Profile for Los Angeles Center and name it "Los Angeles (ZLA)".

**Export Profile**<br/>
You can export a Profile by highlighting the Profile name in the list and clicking the **Export** button. This function is useful if you (e.g. Facility Engineer) want to share the Profile with other users or if you want to export Profile to make a backup copy.

## Main Window

![Main Window](media/MainWindow_Annotated.png ':size=370')

<span class="circle">1</span> Opens the vATIS [Settings](client?id=settings) window. Within this window, you can set your VATSIM credentials, make the vATIS window stay on top, and enable or disable the ATIS notification sound.

<span class="circle">2</span> Opens the [Profile Configuration](client?id=profile-configuration) window. Within this window, you can create, modify, or delete Composites.

<span class="circle">3</span> The current Zulu (UTC) time.

<span class="circle">4</span> Hides the main vATIS window and opens the "Mini Display" window.

<span class="circle">5</span> The Composites associated with the current Profile. If the ATIS is connected and actively transmitting, the ATIS letter will be displayed next to the station identifier in cyan colored letters. The ATIS letter will blink yellow if there is a new update. The ATIS letter will disappear if the ATIS is not connected to the network.

<span class="circle">6</span> The current ATIS letter. Left-click the ATIS letter to increment to the next letter in sequence. Right-click to go back to the previous letter.

<span class="circle">7</span> The current METAR report.

<span class="circle">8</span> The current wind and pressure setting from the METAR report.

<span class="circle">9</span> A free-form text field used to define current [Airport Conditions](client?id=airport-conditions), such as active runways, approaches in use, etc.

<span class="circle">10</span> A free-form text field used to define [NOTAM](client?id=notams) messages, if any.

<span class="circle">11</span> Manually [Voice Record an ATIS](client?id=manual-voice-recorded-atis) using a microphone device.

<span class="circle">12</span> A dropdown list of all saved [Presets](client?id=presets) for the Composite.

<span class="circle">13</span> This button is used to Connect or Disconnect the ATIS from the network.

## Settings

The Network Settings should be self-explanatory. Choose a Network Server that is geographically closest to your location.

The **Suppress ATIS update notification sound** will disable the aural notification sound when a new ATIS update is available.

The **Keep vATIS window visible** option will keep the vATIS window visible (on top) if checked.

![Settings](media/SettingsWindow.png ':size=609')

## Profile Configuration

![Profile Configuration](media/ProfileConfiguration.png ':size=602')

The Profile Configuration window is where you can add, modify, or delete Composites. The left sidebar is a list of all Composites added to the current Profile. Select a Composite from the list to change its settings. Additionally, you can click the **Manage Composite** button to Copy, Rename or Delete the Composite. 

You can import a legacy vATIS profile (.gz file) by clicking the **Manage Composite** button and choosing the "Import" action. This will import the legacy profile as a new Composite.

!>**A maximum of 15 Composites can be added to a single Profile.**

#### General

![General Configuration](media/TabGeneral.png ':size=332')

The **General** tab contains general configuration options. These options are global to the Composite and are shared with each Preset.

**Frequency** The VHF frequency of the ATIS station.

**ATIS Type** The type of connection for this ATIS. If you choose Departure or Arrival, the callsign will include \_D\_ or \_A\_ (e.g. KATL_D_ATIS).

**Code Range** Allows you to specify the ATIS code range for Departure or Arrival ATIS.

**Official Observation Time** If enabled, if a METAR observation time does not match the specified observation time value, the word "SPECIAL" will be appended to the ATIS.

**Magnetic Variation** If enabled, the wind direction will be adjusted according to the specified magnetic variation value in the text to speech output.

**Text to Speech/Voice Recorded** Specify whether the Composite should digitalize the ATIS or allow it to be manually voice recorded. If Text to Speech is selected, selected the desired text to speech voice.

**IDS Endpoint** The URL endpoint of your facility's IDS system (if one exists). When a new ATIS is produced, vATIS will make a POST request with a JSON payload to this URL to update the ATIS information on the IDS. **Only change this if you know what you're doing.**

!>Breaking Change: The format of the JSON payload has changed from v3. Below is an example JSON payload request that vATIS would POST to the IDS endpoint.

```
{
  "Facility": "KLAX",
  "Preset": "NOISE",
  "AtisLetter": "L",
  "AtisType": "combined",
  "AirportConditions": "ILS APP IN PROG RWY 6R OR VCTR FOR VIS APP WILL BE PROVIDED. OPPOSITE DRCTN TFC DEPTG RWY 25R.",
  "Notams": "ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS.",
  "Timestamp": "04/17/2022 15:39:59"
  "Version": "4.0.0"
}
```

#### Formatting

![Formatting Configuration](media/TabFormatting.png ':size=332')

The Formatting tab allows you to further customize the format of the ATIS. The formatting options are saved to the Composite configuration and are shared with each Preset.

* **Format ATIS using FAA format**: When this option is checked, the ATIS will be formatted using the FAA format. You can uncheck this option to format the ATIS using the standard international/ICAO formatting.

* **Prepend "Notices to Airmen/Air Missions" to spoken NOTAMs**: If this option is checked, the words "Notices to Airmen" or "Notices to Air Missions" (for FAA formatting), will be appended to the NOTAMs text in the spoken voice ATIS.

* **Prepend "flight level" to the spoken transition level altitude**: If this option is checked, the words "flight level" will be prepended to the transition level altitude in the spoken ATIS text (e.g. "transition level **flight level** seven zero").

* **Append "meters/kilometers" to spoken prevailing visibility**: If this option is checked, the word "meters" or "visibility" will be appended to the prevailing visibility in the spoken voice ATIS.

* **Convert cloud layer height to metric**: If this option is checked, the cloud layer height and unit will be converted from feet to meters.

* **Use "decimal" terminology in spoken text**: If this option is checked, the word "decimal" will be used in place of "point" in spoken decimal numbers and frequencies.

* **Prefix temperature/dewpoint with "plus"**: If this option is checked, temperature and dewpoint values will be prefixed with the word "plus" when spoken.

* **Append "zulu" to ATIS observation time**: If this option is checked, the world "zulu" will be appended to the ATIS observation time when spoken.

#### Presets

The **Presets** tab is where you can Add, Copy, Rename or Delete Presets. The textbox below the dropdown list is the ATIS template. When an ATIS is created, the variables will be replaced with actual data. If the Composite is configured to use Text to Speech, the template text will be synthesized and transmitted.

The following variables are available to use in the ATIS template. Variable names can be suffixed with `:VOX`, for example `[WX:VOX]` which will force vATIS to print the voice translated text instead of the raw text value in the text ATIS.

|Variable|Definition|
|---|---|
|`[FACILITY]`|The ATIS facility name (i.e. airport name)|
|`[ATIS_CODE]`, `[ATIS_LETTER]`, `[LETTER]`, `[ID]`|The current ATIS letter|
|`[WX]` OR `[FULL_WX_STRING]`|Inserts the full parsed weather string |
|`[TIME]` or `[OBS_TIME]`|The METAR observation time|
|`[WIND]` or `[SURFACE_WIND]`|The reported surface wind|
|`[RVR]`|The runway visibility range (if any)|
|`[VIS]` or `[PREVAILING_VISIBILITY]`|The prevailing visibility|
|`[PRESENT_WX]` or `[PRESENT_WEATHER]`|The present weather conditions (e.g. rain, snow, hail, etc.)|
|`[CLOUDS]`|The reported cloud conditions|
|`[TEMP]`|The reported temperature|
|`[DEW]`|The reported dew point temperature|
|`[PRESSURE]`|The reported pressure value|
|`[PRESSURE_INHG]`|The reported pressure value represented in inHg|
|`[PRESSURE_HPA]`|The reported pressure value represented in hPa|
|`[TREND]`|TREND forecast from METAR|
|`[ARPT_COND]`|Inserts the text from the Airport Conditions free-form text field, followed by any selected static text options|
|`[NOTAMS]`|Inserts the text from the NOTAMS free-form text field, followed by any selected static text options|
|`[TL]`|Inserts the transition level, based on the ranges configured in **Transition Level** configuration tab (non-US ATIS only).|
|`[CLOSING]`|Inserts an FAA-styled closing statement to the text ATIS and voice ATIS.|

If **Use external ATIS generator (e.g. UniATIS)** is checked, you can configure vATIS to use an external source to generate the ATIS text. Note: You must have a Preset selected before you can configure an external ATIS generator.

* **URL** The URL of the external ATIS generator
* **Arrival Runway** The arrival runway(s). The variable `$arrrwy` can be added to the `URL` to automatically append the Arrival Runway field value
* **Departure Runway** The departure runway(s). The variable `$deprwy` can be added to the `URL` to automatically append the Departure Runway field value
* **Approaches in Use** The approaches in use. The variable `$app` can be added to the `URL` to automatically append the Approaches in Use field value
* **Remarks** Pertinent remarks. The variable `$remarks` can be added to the `URL` to automatically append the Remarks field value

Additional variables include:

* `$metar` The current METAR string
* `$atiscode` The current ATIS letter

![Contractions](media/TabPresetsExternalATIS.png ':size=602')

#### Contractions

The **Contractions** tab is where you can define custom contractions. If you specify a contraction that already exists in the [default contractions](client?id=default-contractions) list, then it will be overridden with your newly created definition.

Contractions are useful for creating acronyms or for tricking the text to speech engine to pronounce words differently.

![Contractions](media/TabContractions.png ':size=390 :class=img-border')

#### Transition Level

![Transition Level](media/TabTransitionLevel.png ':size=390 :class=img-border')

If the Composite is for a non-US airport (e.g. the airport identifier does not begin with a K or P), the Transition Level configuration tab will be shown. This table allows you to define a range of QNH values used to determine the transition level. 

The ATIS template variable **`[TL]`** can be used to populate the transition level in the ATIS. The variable will be read as "transition level (flight level) XX" by the voice synthesizer (where XX is the transition level based on the ranges defined). If the transition level cannot be determined, it will be read as "transition level not determined".

A low and high QNH value is required for each transition level.

## Composites

The main user interface shows each Composite as its own separate tab. If the ATIS is connected, the current ATIS letter will be displayed in a cyan color.

![Composites](media/Composites.png ':size=307')

When a new ATIS update is available, the vATIS client icon will flash in the Windows task bar. A notification sound will also play if you have the notification sound option enabled. The ATIS letter for the respective Composite will blink yellow. To acknowledge the ATIS update, click the respective Composite tab and (left) click the ATIS letter button once to stop the blinking.

![Acknwowledge Update](media/AcknowledgeUpdate.gif ':size=176')

## Airport Conditions

![Airport Conditions](media/AirportConditionDefinitions.png ':size=369')

In addition to the free-form Airport Conditions text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the ARPT COND text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

The **Include before free-form ARPT CONDs** checkbox allows you to prioritize the static messages before the free form text in the text and voice ATIS.

## NOTAMs

![NOTAM Conditions](media/NotamDefinitions.png ':size=369')

In addition to the free-form NOTAMS text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the NOTAMS text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

The **Include before free-form NOTAMs** checkbox allows you to prioritize the static messages before the free form text in the text and voice ATIS.

## Manual Voice Recorded ATIS

![Record ATIS](media/RecordATIS.png ':size=389')

vATIS allows you to manually record an ATIS in the instance where the real-world ATIS isn't digitalized, and you wish to simulate this on VATSIM.

To manually record an ATIS, the Composite must be configured to be voice recorded. See the [Configuration](client?id=configuration) section for details on how to set this option.

1. Connect the ATIS to the network by clicking the **CONNECT** button.
2. Click the **RECORD ATIS** button. A dialog window (pictured above) will appear. Select your preferred microphone device and playback device (used to listen the recording before saving it).
3. Click the **Start Recording** button to begin recording your ATIS. When you are done recording, click the **Stop Recording** button.
4. You can optionally listen to the recording by clicking the **Listen** button.
5. Once you are satisfied, click the **Save** button. The ATIS will begin transmitting on the network.

When a new METAR update is available, you will be notified by the client icon flashing in the taskbar and the ATIS letter blinking yellow. See [ATIS Composites](client?id=atis-composites) section for details on how to acknowledge the update. Follow steps 2-5 to record a new ATIS.

## Software Updates

Each time you launch vATIS, it will check if there is a newer version available. You will be prompted if a new update is available.

If you choose to download the update, vATIS will download the updated installer. When the download is complete, vATIS will close and the installer will open to begin the installation of the new version.

## Text Parsing Rules

You can use the following text parsing rules in the Airport Conditions and NOTAMs free-form textboxes.

**Taxiways**<br/>
To parse taxiway names, you must prepend the acronym **TWY** or **TWYS** in front of the identifier. For example, **`TWY E16`** would be spoken as "taxiway echo sixteen" by the voice synthesizer.

**Runways**<br/>
To parse runway names, you must prepend the acronym **RWY**, **RWYS**, **RUNWAY** or **RUNWAYS** in front of the identifier. For example, **`RWY 25R`** would be spoken as "runway two five right" by the voice synthesizer.

**Numbers**<br/>
To pronounce numbers in group format, prepend an **asterisk (\*)** followed by the number, or wrap the number in braces **`{}`**. For example, **`*5058`** (or **`{5058}`**) would be spoken as "five thousand, fifty-eight" by the voice synthesizer. If the number should be pronounced as a negative value, append a dash after the asterisk. For example, **`*-8`** would be spoken as "minus eight".

**Airport Names**<br/>
To parse airport identifiers to the airport name, prepend a **plus sign (+)** to the ICAO identifier. For example, **`+KLAX`** would be read as "Los Angeles International Airport" by the voice synthesizer.

**Navaids**<br/>
To parse navaid identifiers to their name, prepend a **plus sign (+)** to the navaid identifier. For example, **`+GBN`** would be read as "Gila Bend" by the voice synthesizer.

## Default Contractions

|Contraction|Definition|
|---|---|
|ACFT|AIRCRAFT|
|ADVS|ADVISE|
|ADVSD|ADVISED|
|ADVZY|ADVISORY|
|ADVZYS|ADVISORIES|
|ALS|APPROACH LIGHTING SYSTEM|
|ALT|ALTITUDE|
|ALTS|ALTITUDES|
|APCH|APPROACH|
|APCHS|APPROACHES|
|APP|APPROACH|
|APPR|APPROACH|
|APPRS|APPROACHES|
|APPS|APPROACHES|
|ARPT|AIRPORT|
|ARR|ARRIVAL|
|ARRS|ARRIVALS|
|ATTN|ATTENTION|
|AUTH|AUTHORIZED|
|AVBL|AVAILABLE|
|BA|BRAKING ACTION|
|BAA|BRAKING ACTION ADVISORIES|
|BC|BACKCOURSE|
|BTWN|BETWEEN|
|CAUT|CAUTION|
|CLNC|CLEARANCE|
|CLR|CLEAR|
|CLRD|CLEARED|
|CLSD|CLOSED|
|CLSGN|CALLSIGN|
|CMSN|COMMISSION|
|CMSND|COMMISSIONED|
|CTC|CONTACT|
|CTL|CONTROL|
|CTLD|CONTROLLED|
|DCMSN|DECOMMISSION|
|DCMSND|DECOMMISSIONED|
|DEP|DEPARTURE|
|DEPS|DEPARTURES|
|DEPTG|DEPARTING|
|DIST|DISTANCE|
|DRCTN|DIRECTION|
|DURG|DURING|
|DURN|DURATION|
|E|EAST|
|EFCT|EFFECT|
|EFF|EFFECTIVE|
|ENE|EAST NORTHEAST|
|EQPT|EQUIPMENT|
|ERN|EASTERN|
|ESE|EAST SOUTHEAST|
|EXP|EXPECT|
|EXPT|EXPECT|
|FLT|FLIGHT|
|FREQ|FREQUENCY|
|FT|FEET|
|GND|GROUND|
|GS|GLIDESLOPE|
|HAZ WX INFO|HAZARDOUS WEATHER INFORMATION|
|HDG|HEADING|
|HDGS|HEADINGS|
|HELI|HELICOPTER|
|HS|HOLD SHORT|
|INBD|INBOUND|
|INTXN|INTERSECTION|
|INVOF|IN VICINITY OF|
|LAHSO|LAND AND HOLD SHORT OPERATIONS|
|LDG|LANDING|
|LGT|LIGHT|
|LGTD|LIGHTED|
|LGTS|LIGHTS|
|LLWS|LOW LEVEL WIND SHEAR|
|LLZ|LOCALIZER|
|LOC|LOCALIZER|
|MOD|MODERATE|
|MULTI|MULTIPLE|
|N|NORTH|
|NA|NOT AUTHORIZED|
|NE|NORTHEAST|
|NERN|NORTHEASTERN|
|NNE|NORTH NORTHEAST|
|NNW|NORTH NORTHWEST|
|NOTAM|NOTICE TO AIRMEN|
|NOTAMS|NOTICES TO AIRMEN|
|NRN|NORTHERN|
|NW|NORTHWEST|
|NWRN|NORTHWESTERN|
|OAT|OUTSIDE AIR TEMPERATURE|
|OPER|OPERATE|
|OPS|OPERATIONS|
|OTS|OUT OF SERVICE|
|OUBD|OUTBOUND|
|PAPI|PRECISION APPROACH PATH INDICATOR|
|PIREP|PILOT WEATHER REPORT|
|PRM|PRECISION RUNWAY MONITOR|
|PROC|PROCEDURE|
|PROG|PROGRESS|
|RMNG|REMAINING|
|RMVL|REMOVAL|
|RQST|REQUEST|
|RQSTD|REQUESTED|
|RWY|RUNWAY|
|RWYS|RUNWAYS|
|S|SOUTH|
|SE|SOUTHEAST|
|SERN|SOUTHEASTERN|
|SFC|SURFACE|
|SIMUL|SIMULTANEOUS|
|SRN|SOUTHERN|
|SSE|SOUTH SOUTHEAST|
|SSW|SOUTH SOUTHWEST|
|SVC|SERVICE|
|SVCS|SERVICES|
|SVR|SEVERE|
|SW|SOUTHWEST|
|SWRN|SOUTHWESTERN|
|TFC|TRAFFIC|
|TFR|TEMPORARY FLIGHT RESTRICTION|
|TODA|TAKE OFF DISTANCE AVAILABLE|
|TURB|TURBULENCE|
|TWY|TAXIWAY|
|TWYS|TAXIWAYS|
|UFN|UNTIL FURTHER NOTICE|
|UNCTLD|UNCONTROLLED|
|UNUSBL|UNUSABLE|
|US|UNSERVICEABLE|
|USBL|USABLE|
|VASI|VISUAL APPROACH SLOPE INDICATOR|
|VCNTY|VICINITY|
|VCTR|VECTOR|
|VCTRS|VECTORS|
|VFY|VERIFY|
|VIS|VISUAL|
|W|WEST|
|WNW|WEST NORTHWEST|
|WRN|WESTERN|
|WSW|WEST SOUTHWEST|
|XPDR|TRANSPONDER|
|XPDRS|TRANSPONDERS|
|XPNDR|TRANSPONDER|
|XPNDRS|TRANSPONDERS|
|XTM|EXTREME|
## System Requirements
* Windows 10
* 200 MB  free disk space on the drive where application data is stored (usually C:)

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

<span class="circle">4</span> The Composites associated with the current Profile. If the ATIS is connected and actively transmitting, the ATIS letter will be displayed next to the station identifier in cyan colored letters. The ATIS letter will blink yellow if there is a new update. The ATIS letter will disappear if the ATIS is not connected to the network.

<span class="circle">5</span> The current ATIS letter. Left-click the ATIS letter to increment to the next letter in sequence. Right-click to go back to the previous letter.

<span class="circle">6</span> The current METAR report.

<span class="circle">7</span> The current wind and pressure setting from the METAR report.

<span class="circle">8</span> A free-form text field used to define current [Airport Conditions](client?id=airport-conditions), such as active runways, approaches in use, etc.

<span class="circle">9</span> A free-form text field used to define [NOTAM](client?id=notams) messages, if any.

<span class="circle">10</span> Manually [Voice Record an ATIS](client?id=manual-voice-recorded-atis) using a microphone device.

<span class="circle">11</span> A dropdown list of all saved [Presets](client?id=presets) for the Composite.

<span class="circle">12</span> This button is used to Connect or Disconnect the ATIS from the network.

## Settings

The Network Settings should be self-explanatory. Choose a Network Server that is geographically closest to your location.

The **Suppress ATIS update notification sound** will disable the aural notification sound when a new ATIS update is available.

The **Keep vATIS window visible** option will keep the vATIS window visible (on top) if checked.

![Settings](media/SettingsWindow.png ':size=571 :class=img-border')

## Profile Configuration

![Profile Configuration](media/ProfileConfiguration.png ':size=493 :class=img-border')

The Profile Configuration window is where you can add, modify, or delete Composites. The left sidebar is a list of all Composites added to the current Profile. Select a Composite from the list to change its settings. Additionally, you can click the **Manage Composite** button to Copy, Rename or Delete the Composite. 

You can import a legacy vATIS profile (.gz file) by clicking the **Manage Composite** button and choosing the "Import" action. This will import the legacy profile as a new Composite.

!>**During the testing period, vATIS will be limited to 4 Composites per Profile. This will be increased in the future.**

#### Presets

The **Presets** tab is where you can Add, Copy, Rename or Delete Presets. The textbox below the dropdown list is the ATIS template. When an ATIS is created, the variables will be replaced with actual data. If the Composite is configured to use Text to Speech, the template text will be synthesized and transmitted.

!>**NOTE:** "Advise on initial contact, you have information X" will be automatically appended to the ATIS if the facility identifier begins with K or P (US airports). This will need to be manually added to the ATIS template for non-US ATISs.

The following variables are available to use in the ATIS template:

|Variable|Definition|
|---|---|
|`[FACILITY]`|The ATIS facility name (i.e. airport name)|
|`[ATIS_CODE]` or `[ATIS_LETTER]`|The current ATIS letter|
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
|`[ARPT_COND]`|Inserts the text from the Airport Conditions free-form text field, followed by any selected static text options|
|`[NOTAMS]`|Inserts the text from the NOTAMS free-form text field, followed by any selected static text options|
|`[TL]`|Inserts the transition level, based on the ranges configured in **Transition Level** configuration tab (non-US ATIS only).|

#### Contractions

The **Contractions** tab is where you can define custom contractions. If you specify a contraction that already exists in the [default contractions](client?id=default-contractions) list, then it will be overridden with your newly created definition.

Contractions are useful in tricking the text to speech synthesizer to pronounce words or acronyms differently.

![Contractions](media/TabContractions.png ':size=390 :class=img-border')

#### Configuration

![Contractions](media/TabConfiguration.png ':size=390 :class=img-border')

The **Configuration** tab contains miscellaneous configuration options. These options are global to the Composite and are shared with each Preset.

**Frequency** The VHF frequency of the ATIS station.

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
  "AirportConditions": "ILS APP IN PROG RWY 6R OR VCTR FOR VIS APP WILL BE PROVIDED. OPPOSITE DRCTN TFC DEPTG RWY 25R.",
  "Notams": "ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS.",
  "Timestamp": "04/17/2022 15:39:59"
}
```

#### Transition Level

![Transition Level](media/TabTransitionLevel.png ':size=390 :class=img-border')

If the Composite is for a non-US airport (e.g. the airport identifier does not begin with a K or P), the Transition Level configuration tab will be shown. This table allows you to define a range of QNH values used to determine the transition level. The ATIS template variable **`[TL]`** can be used to populate the transition level in the ATIS. The variable will be read as "transition level flight level XX" by the voice synthesizer (where XX is the transition level based on the ranges defined). If the transition level cannot be determined, it will be read as "transition level not determined".

## Composites

The main user interface shows each Composite as its own separate tab. If the ATIS is connected, the current ATIS letter will be displayed in a cyan color.

![Composites](media/Composites.png ':size=307')

When a new ATIS update is available, the vATIS client icon will flash in the Windows task bar. A notification sound will also play if you have the notification sound option enabled. The ATIS letter for the respective Composite will blink yellow. To acknowledge the ATIS update, click the respective Composite tab and (left) click the ATIS letter button once to stop the blinking.

![Acknwowledge Update](media/AcknowledgeUpdate.gif ':size=176')

## Airport Conditions

![Airport Conditions](media/AirportConditionDefinitions.png ':size=331 :class=img-border')

In addition to the free-form Airport Conditions text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the ARPT COND text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

**You must disconnect and reconnect the ATIS after making changes to the active static messages**. Alternatively, you can click the ATIS letter button to force a new ATIS.

## NOTAMs

![NOTAM Conditions](media/NotamDefinitions.png ':size=331 :class=img-border')

In addition to the free-form NOTAMS text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the NOTAMS text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

**You must disconnect and reconnect the ATIS after making changes to the active static messages**. Alternatively, you can advance the ATIS letter to force a new ATIS to be created.

## Manual Voice Recorded ATIS

![Record ATIS](media/RecordATIS.png ':size=356 :class=img-border')

vATIS allows you to manually record an ATIS in the instance where the real-world ATIS isn't digitalized, and you wish to simulate this on VATSIM.

To manually record an ATIS, the Composite must be configured to be voice recorded. See the [Configuration](client?id=configuration) section for details on how to set this option.

1. Connect the ATIS to the network by clicking the **CONNECT** button.
2. Click the **RECORD ATIS** button. A dialog window (pictured above) will appear. Select your preferred microphone device and playback device (used to listen the recording before saving it).
3. Click the **Start Recording** button to begin recording your ATIS. You can drag the recording window to the side so you can see the METAR and information behind it. When you are done recording, click the **Stop Recording** button.
4. You can optionally listen to the recording by clicking the **Listen** button.
5. Once you are satisfied, click the **Save** button. The ATIS will begin transmitting on the network.

When a new METAR update is available, you will be notified by the client icon flashing in the taskbar and the ATIS letter blinking yellow. See [ATIS Composites](client?id=atis-composites) section for details on how to acknowledge the update. Follow steps 2-5 to record a new ATIS.

## Software Updates

Each time you launch vATIS, it will check if there is a newer version available. You will be prompted if a new update is available.

If you choose to download the update, vATIS will download the updated installer. When the download is complete, vATIS will close and the installer will open to begin the installation of the new version.

## Text Parsing Rules

You can use the following text parsing rules in the Airport Conditions and NOTAMs free-form textboxes.

**Taxiways**<br/>
To parse taxiway names, you must prepend the acronym **TWY** or **TWYS** in front of the identifier. For example, **`TWY E16`** would be read as "taxiway echo sixteen" by the voice synthesizer.

**Runways**<br/>
To parse runway names, you must prepend the acronym **RWY** or **RWYS** in front of the identifier. For example, **`RWY 25R`** would be read as "runway two five right" by the voice synthesizer.

**Numbers**<br/>
To pronounce numbers in group format, prepend an **asterisk (\*)** followed by the number. For example, **`*5058`** would be read as "five thousand, fifty-eight" by the voice synthesizer. If the number should be pronounced as a negative value, append a dash after the asterisk. For example, **`*-8`** would be read as "minus eight".

**Frequencies**<br/>
To correctly read frequencies, they must be typed in the full MHz format. Only frequencies 100.000 to 199.999 MHz will be parsed. For example, **`127.65`** would be read as "one two seven point six five" by the voice synthesizer.

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
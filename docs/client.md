## System Requirements
* Windows 10 64-bit (or newer)
* 200 MB free disk space on the drive where application data is stored (usually C:)

## Installation

[Download](https://github.com/vatis-project/vatis/releases/latest) and run the latest installer from the vATIS website. You will be prompted to choose an installation location. **It is recommended that you leave the default location selected to avoid any folder/file permission problems.** When the installation is complete, you will have the option to launch vATIS.

## Terms and Concepts

Before using vATIS, you should familiarize yourself with a few basic terms and concepts.

* **Profile:** A Profile is the container for one or more ATIS Composites.
* **Composite:** Each ATIS station is defined as its own Composite. Within each Composite, you can specify the current airport conditions and other pertinent ATIS information.
* **Preset:** A Preset is used to save the Airport Conditions, NOTAMS and other ATIS settings. A Composite can have one or more saved Presets. For example, you might create a Preset for "WEST OPS" one for "EAST OPS", etc.

## Profiles

Each time you launch vATIS, a dialog window with a list of Profiles will appear. The first time you run vATIS, the list will be empty. Most users will download and import Profiles created by the Facility Engineer of their ARTCC.

To open a Profile, double-click the name of the Profile in the list. The Profile dialog will hide and the main vATIS window will appear.

![Settings](media/ProfileDialog.png ':size=345')

**Import Profile**<br/>
To import a vATIS Profile, click the **Import** button. A file browser dialog will show allowing you to browse to the location of the Profile file. Importing a Profile will import the associated Composites and their associated options and settings.

**Create a New Profile**<br/>
To create a new Profile, click the **New** button at the top right of the Profile dialog window. You will be prompted to enter a name for the Profile. A Profile can contain one more Composites. For example, you might create a Profile for Los Angeles Center and name it "Los Angeles (ZLA)".

**Export Profile**<br/>
You can export a Profile by highlighting the Profile name in the list and clicking the **Export** button. This function is useful if you want to share the Profile with others or if you want to export Profile to make a backup copy.

## Main Window

![Main Window](media/MainWindow_Annotated.png ':size=370')

<span class="circle">1</span> Opens the vATIS [Settings](client?id=settings) window. The Settings window is where you will save your VATSIM credentials, make the vATIS window stay on top, and toggle the ATIS notification sound.

<span class="circle">2</span> Opens the [Profile Configuration](client?id=profile-configuration) window. This window is where you can create, modify, or delete Composites.

<span class="circle">3</span> The current Zulu (UTC) time.

<span class="circle">4</span> Hides the main vATIS window and opens the "Mini Display" window.

<span class="circle">5</span> The Composites associated with the current Profile. If the ATIS is connected and actively transmitting, the ATIS letter will be displayed next to the station identifier (cyan-colored letter). The ATIS letter will blink yellow if there is a new update.

<span class="circle">6</span> The current ATIS letter. Left-click the ATIS letter to increment to the next letter in sequence. Right-click to go back to the previous letter.

<span class="circle">7</span> The current METAR report.

<span class="circle">8</span> The current surface wind and altimeter from the METAR report.

<span class="circle">9</span> A free-form text field used to define current [Airport Conditions](client?id=airport-conditions), such as active runways, approaches in use, etc.

<span class="circle">10</span> A free-form text field used to define [NOTAM](client?id=notams) messages, if any.

<span class="circle">11</span> Manually [Voice Record an ATIS](client?id=manual-voice-recorded-atis) using a microphone device.

<span class="circle">12</span> A dropdown list of all saved [Presets](client?id=presets) for the Composite.

<span class="circle">13</span> This button is used to Connect or Disconnect the ATIS from the network.

## Mini-Display

The Mini-Display window can be accessed by clicking the "double-headed arrow" icon in the main client window.

![Settings](media/OpenMiniDisplay.png ':size=45')

The Mini-Display window gives you a quick, distraction-free overview of the connected ATIS stations. The main vATIS window can be restored by clicking the "double-headed arrow" icon on the Mini-Display window.

![Settings](media/MiniDisplayWindow.png ':size=225')

You can acknowledge a new ATIS update by clicking the blinking ATIS letter.

![Settings](media/MiniDisplayWindowAcknowledgeUpdate.gif ':size=90')

## Settings

The Network Settings should be self-explanatory. The Network Server dropdown only contains one value ("AUTOMATIC"), which will automatically connect your vATIS session to the best network server based on your geographic location and server availability.

The **Suppress ATIS update notification sound** will disable the aural notification sound when a new ATIS update is available.

The **Keep vATIS window visible** option will keep the vATIS window visible (on top) if checked.

![Settings](media/SettingsWindow.png ':size=607')

## Profile Configuration

![Profile Configuration](media/ProfileConfiguration.png ':size=527')

The Profile Configuration window is where you can add, modify, or delete Composites. The left sidebar is a list of all Composites added to the current Profile. Select a Composite from the list to change its settings. Additionally, you can click the **Manage Composite** button to Copy, Rename or Delete the Composite. 

You can import a legacy vATIS profile (.gz file) by clicking the **Manage Composite** button and choosing the "Import" action. This will import the legacy profile as a new Composite.

## General

![General Configuration](media/TabGeneral.png ':size=390')

The General tab contains general configuration options. These options are global to the Composite and are shared with each Preset.

**Frequency**<br/>
The VHF frequency for the ATIS connection.

**ATIS Type**<br/>
The type of ATIS: Combined, Departure or Arrival. If you choose Departure or Arrival, the callsign will include `_D_` or `_A_` (e.g. `KATL_D_ATIS`).

**Code Range**<br/>
Allows you to specify the ATIS code range for Departure or Arrival ATIS (e.g. restrict Departure ATIS to `A..N` and Arrival ATIS to `M..Z`).

**Magnetic Variation**<br/>
If enabled, the wind direction will be adjusted according to the specified magnetic variation value in the text to speech output.

**Use "decimal" terminology in spoken text**<br/>
If enabled, any numbers with decimals will be spoken as "decimal" instead of "point" (e.g. <code>one three four **decimal** two five</code>).

**Prefix spoken NOTAMs with "Notices to Air Missions"**<br/>
If enabled, the NOTAMs will be prefixed with "Notices to Airmen" in the voice ATIS (e.g. `NOTICES TO AIRMEN, RUNWAY TWO FIVE LEFT CLOSED`). For non-FAA ATIS, the prefix will be "Notices to Airmen".

**Text to Speech/Voice Recorded**<br/>
Specify whether the ATIS should be digitalized (text to speech) or manual voice recorded. If "Text to Speech" is selected, you can choose the desired voice option. The "Default" option is the voice used by FAA D-ATIS.

**IDS Endpoint**<br/>
If your facility has an Information Display System (and is compatible with vATIS), you can specify the URL that vATIS can use to automatically update the ATIS information. If a URL is specified, vATIS will make an HTTP POST request with a JSON payload similar to this:

```json
{
  "facility": "KLAX",
  "preset": "NOISE",
  "atisLetter": "L",
  "atisType": "combined",
  "airportConditions": "ILS APP IN PROG RWY 6R OR VCTR FOR VIS APP WILL BE PROVIDED. OPPOSITE DRCTN TFC DEPTG RWY 25R.",
  "notams": "ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS.",
  "timestamp": "04/17/2022 15:39:59"
  "version": "4.0.0"
}
```
`facility` ... the ATIS facility (airport) identifier<br/>
`preset` ... the name of the active ATIS preset<br/>
`atisLetter` ... the ATIS letter<br/>
`atisType` ... the ATIS connection type; valid values are: `combined`, `arrival` or `departure`<br/>
`airportConditions` ... the airport conditions text<br/>
`notams` ... the NOTAMs text<br/>
`timestamp` ... the timestamp of the ATIS update<br/>
`version` ... the vATIS application version

## Formatting

The Formatting tab is where you customize the format of each component of the ATIS. The formatting options are saved to the Composite configuration and are shared with each Preset.

The following elements can be customized:

* Observation Time
* Surface Wind
* Visibility
* Present Weather
* Clouds
* Temperature
* Dewpoint
* Altimeter
* Closing Statement

Within each element tab, you can customize the Text (what is displayed in the text ATIS) and Voice (what is spoken in the voice ATIS) templates. Each element has specific variables that can be used in both the Text and Voice templates. You can mouse hover over each variable to see a description of what the variable is used for.

## Observation Time
The observation time is the time the METAR report was generated. This element can be injected into the Preset ATIS template by using the `[OBS_TIME]` variable.

`{time}` ... The time value from the METAR (e.g. `0153`)<br/>
`{hour}` ... The hour portion of the time (e.g. `01`)<br/>
`{minute}` ... The hour portion of the time (e.g. `53`)<br/>
`{special}` ... Inserts the word "SPECIAL" (voice ATIS only) if the METAR observation time is different than the routine observation time

![Formatting Configuration](media/TabObservationTime.png ':size=338')

**Routine Observation Time**<br/>
This option allows you to specify the time (minute interval) at which the METAR is normally generated. For example, if the METAR for KLAX is normally updated every hour at 53 minutes, you would enter a value of `53`. If a METAR update is received and the observation time (minute) does not equal this value, then the METAR is considered a "special" update. The `{special}` variable can be used in the Text and Voice template to insert the word "SPECIAL".

## Surface Wind
The surface wind element from the METAR. This element can be injected into the Preset ATIS template by using the `[WIND]` variable.

You can customize the formatting for the following wind types:

* Standard (e.g. 25010KT)
* Standard Gust (e.g. 18015G20KT)
* Variable (e.g. VRB05KT)
* Variable Gust (e.g. VRB05G15KT)
* Variable Direction (e.g. 240V270)
* Calm Wind

`{wind}` ... The complete wind string &ndash; only available for text ATIS (e.g. `25010G15KT V250V280`)<br/>
`{wind_dir}` ... The magnetic direction of the wind (e.g. `25010KT` would yield `250`)<br/>
`{wind_spd}` ... The speed/velocity of the wind (e.g. `25010KT` would yield `10`)<br/>
`{wind_gust}` ... The gust speed/velocity of the wind (e.g. `25010G18KT` would yield `18`)<br/>
`{wind_vmin}` ... The first extreme wind direction (e.g. `250V280` would yield `250`)<br/>
`{wind_vmax}` ... The last extreme wind direction (e.g. `250V280` would yield `280`)<br/>
`{wind_unit}` ... The wind speed unit of measurement (e.g. `25010KT` would yield `KT` and the spoken value would be `KNOTS`)

![Formatting Configuration](media/TabSurfaceWind.png ':size=338')

**Speak leading zero on wind speed**<br/>
If enabled, the leading zero on wind speeds less than 10 will be spoken (e.g. <code>WIND TWO THREE ZERO AT **ZERO** FIVE</code>).

## Visibility

The prevailing visibility element from the METAR. This element can be injected into the Preset ATIS template by using the `[VIS]` variable.

`{visibility}` ... The visibility value (e.g. `10SM`)

![Formatting Configuration](media/TabVisibility.png ':size=338')

<hr/>

**ICAO Formatting**<br/>
The ICAO formatting tab allows you to further customize the prevailing visibility for international stations.

![Formatting Configuration](media/TabVisibilityIcao.png ':size=338')

**Include visibility unit suffix**<br/>
If this option is checked, the unit type will be appended to the visibility value (e.g. <code>FIVE THOUSAND METERS</code>).<br/>
The suffix will automatically transition to "kilometers" based on the `Meters Cutoff` value.

**Meters Cutoff**<br/>
The cutoff value for when to transition to using "kilometers" instead of "meters" suffix in the voice ATIS.

**Visibility Direction**<br/>
The spoken visibility direction for when the visibility is not the same in all directions, for example: `1200SE 6000N`. This table allows you to define how the cardinal directions should be spoken in the voice ATIS.

**Unlimited Visibility**<br/>
The spoken text for when the visibility is `9999`.

## Present Weather

The present weather element from the METAR.

`{weather}` ... The present weather items (e.g. `SHRA BR`)

![Formatting Configuration](media/TabPresentWeather.png ':size=338')

<hr/>

**Intensity/Proximity Descriptors**<br/>
The spoken text for present weather intensity/proximity descriptors.

![Formatting Configuration](media/TabPresentWeatherIntensity.png ':size=338')

<hr/>

**Weather Types**<br/>
Define the METAR weather type codes and their respective spoken voice ATIS string.

![Formatting Configuration](media/TabPresentWeatherTypes.png ':size=338')

<hr/>

**Weather Descriptors**<br/>
Define the METAR weather descriptor codes and their respective spoken voice ATIS string.

![Formatting Configuration](media/TabPresentWeatherDescriptors.png ':size=338')

## Clouds

The cloud layers element from the METAR.

`{clouds}` ... The cloud layers (e.g. `FEW050 SCT100`)

![Formatting Configuration](media/TabClouds.png ':size=338')

**Identify ceiling layer in voice ATIS**<br/>
If this option is checked, the lowest BKN (broken) or OVC (overcast) layer will be prefixed with "ceiling" in the voice ATIS (e.g. `"CEILING ONE THOUSAND FOUR HUNDRED OVERCAST, TWO THOUSAND BROKEN"`).

**Convert cloud layer altitude to metric**<br/>
If this option is checked, the cloud layer altitude (height) will be converted to metric unit in both the voice and text ATIS.

<hr/>

**Cloud Types**<br/>
Define how the cloud types should be spoken in the voice ATIS.

`{altitude}` ... The altitude/height of the cloud layer<br/>
`{convective}` ... If the cloud layer is a convective layer, the convective layer spoken text will be appended (e.g. `SCT250CB`)

![Formatting Configuration](media/TabCloudTypes.png ':size=338')

<hr/>

**Convective Cloud Types**<br/>
Define how the convective cloud types should be spoken in the voice ATIS.

![Formatting Configuration](media/TabConvectiveCloudTypes.png ':size=338')

## Temperature

The temperature element from the METAR.

`{temp}` ... The temperature value (e.g. `05`)

**Prefix positive temperature with "plus" in voice ATIS**<br/>
If checked, positive temperatures will be prefixed with the word "plus" in the voice ATIS (e.g. `"TEMPERATURE PLUS TWO FIVE"`)

**Speak leading zero in voice ATIS**<br/>
If checked, the leading zero will be spoken (e.g. `"TEMPERATURE ZERO SIX"`)

![Formatting Configuration](media/TabTemperature.png ':size=338')

## Dewpoint

The dewpoint element from the METAR.

`{dewpoint}` ... The dewpoint temperature value (e.g. `05`)

![Formatting Configuration](media/TabDewpoint.png ':size=338')

## Altimeter

The altimeter element from the METAR.

`{altimeter}` ... The numeric altimeter value (e.g. `2998` or `1013`)<br/>
`{altimeter|inhg}` ... The numeric altimeter value converted to inHg<br/>
`{altimeter|hpa}` ... The numeric altimeter value converted to hPa<br/>
`{altimeter|text}` ... The altimeter value translated to words (e.g. `TWO NINER NINER TWO`)

![Formatting Configuration](media/TabAltimeter.png ':size=338')

## Closing Statement

The ATIS closing statement message.

`{letter}` ... The current ATIS letter (e.g. `A`)
`{letter|word}` ... The current ATIS letter in word form (e.g. `ALPHA`)

**Automatically include closing statement at the end of the ATIS**<br/>
If checked, the closing statement will be automatically appended to the end of the ATIS without requiring the `[CLOSING]` variable in the ATIS template.

![Formatting Configuration](media/TabClosingStatement.png ':size=338')

## Presets

The **Presets** tab is where you can Add, Copy, Rename or Delete Presets. The textbox below the dropdown list is the ATIS template. When an ATIS is created, the variables will be replaced with actual data. If the Composite is configured to use Text to Speech, the template text will be synthesized and transmitted.

The following variables are available to use in the ATIS template. Variable names can be optionally suffixed with `:VOX` (e.g. `[WX:VOX]`), this will force vATIS to print the voice translated text instead of the raw text value in the text ATIS.

|Variable|Definition|
|---|---|
|`[FACILITY]`|The ATIS facility name (i.e. airport name)|
|`[ATIS_CODE]`<br/>`[ATIS_LETTER]`<br/>`[LETTER]`<br/>`[ID]`|The current ATIS letter|
|`[WX]`<br/>`[FULL_WX_STRING]`|Inserts the weather in standard order:<br/>`Surface Wind`, `Visibility`, `RVR`, `Present Weather`, `Clouds`, `Temperature`, `Dew Point`, `Altimeter` |
|`[OBS_TIME]`<br/>`[TIME]`|The METAR observation time|
|`[WIND]`<br/>`[SURFACE_WIND]`|The reported surface wind|
|`[RVR]`|The runway visibility range (if any)|
|`[VIS]`<br/>`[PREVAILING_VISIBILITY]`|The prevailing visibility|
|`[PRESENT_WX]`<br/>`[PRESENT_WEATHER]`|The present weather conditions (e.g. rain, snow, hail, etc.)|
|`[CLOUDS]`|The reported cloud conditions|
|`[TEMP]`|The reported temperature|
|`[DEW]`|The reported dew point temperature|
|`[PRESSURE]`|The reported pressure value|
|`[TREND]`|TREND forecast from METAR|
|`[ARPT_COND]`|Inserts the text from the Airport Conditions free-form text field, followed by any selected static text options|
|`[NOTAMS]`|Inserts the text from the NOTAMS free-form text field, followed by any selected static text options|
|`[TL]`|Inserts the transition level, based on the ranges configured in **Transition Level** configuration tab (non-US ATIS only).|
|`[CLOSING]`|Inserts the closing statement message|

## External ATIS Generator

**Use external ATIS generator (e.g. UniATIS)**<br/>
If this option is checked, you can configure vATIS to use an external source to generate the ATIS text. Note: You must have a Preset selected before you can configure an external ATIS generator.

* **URL** The URL of the external ATIS generator
* **Arrival Runway** The arrival runway(s). The variable `$arrrwy` can be added to the `URL` to automatically append the Arrival Runway field value
* **Departure Runway** The departure runway(s). The variable `$deprwy` can be added to the `URL` to automatically append the Departure Runway field value
* **Approaches in Use** The approaches in use. The variable `$app` can be added to the `URL` to automatically append the Approaches in Use field value
* **Remarks** Pertinent remarks. The variable `$remarks` can be added to the `URL` to automatically append the Remarks field value

Additional variables include:

* `$metar` The current METAR string
* `$atiscode` The current ATIS letter

![Contractions](media/TabPresetsExternalATIS.png ':size=527')

## Contractions

The **Contractions** tab is where you can define custom contractions. If you specify a contraction that already exists in the [default contractions](client?id=default-contractions) list, then it will be overridden with your newly created definition.

Contractions are useful for creating acronyms or for tricking the text to speech engine to pronounce words differently.

![Contractions](media/TabContractions.png ':size=390')

## Transition Level

![Transition Level](media/TabTransitionLevel.png ':size=390')

This configuration tab is only visible for non-FAA ATIS composites. This table allows you to define a range of QNH values used to determine the transition level.

**Prepend "flight level" to the spoken transition level altitude**<br/>
If this option is checked, the words "flight level" will be prepended to the transition level altitude in the spoken ATIS text (e.g. <code>transition level **flight level** seven zero</code>).

The ATIS template variable `[TL]` can be used to populate the transition level in the ATIS layout template (see [Presets](client?id=presets) section). The variable will be spoken as `"transition level (flight level) XX"`, where `XX` is the transition level based on the ranges defined. If the transition level cannot be determined, it will be spoken as `transition level not determined`.

A low and high QNH value is required for each transition level.

## Composites

The main user interface shows each Composite as its own separate tab. If the ATIS is connected, the current ATIS letter will be displayed in a cyan color.

![Composites](media/Composites.png ':size=307')

When a new ATIS update is available, the vATIS client icon will flash in the Windows task bar. A notification sound will also play if you have the notification sound option enabled. The ATIS letter for the respective Composite will blink yellow. To acknowledge the ATIS update, click the respective Composite tab and (left) click the ATIS letter button once to stop the blinking.

![Acknwowledge Update](media/AcknowledgeUpdate.gif ':size=176')

## Airport Conditions

![Airport Conditions](media/AirportConditionDefinitions.png ':size=367')

In addition to the free-form Airport Conditions text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the ARPT COND text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

**Include before free-form ARPT CONDs**<br/>
If checked, checked Airport Conditions will included <u>before</u> the free-form Airport Conditions text.

## NOTAMs

![NOTAM Conditions](media/NotamDefinitions.png ':size=367')

In addition to the free-form NOTAMS text, you can also define static messages that can be toggled on or off. This is useful for defining messages that you may frequently use but need to the ability to toggle them on or off. These messages are saved with the Composite, so they are available to use with any selected Preset.

To create a new static message, click the NOTAMS text label above the free-form text box. A popup dialog (pictured above) will open allowing you to add, edit or delete existing messages. You can also reorder the messages by selected a message in the list and clicking the Up or Down button. The messages are presented in the ATIS in the order they appear (but only if the message is checked).

**Include before free-form NOTAMs**<br/>
If checked, checked NOTAMs will included <u>before</u> the free-form NOTAMs text.

## Manual Voice Recorded ATIS

![Record ATIS](media/RecordATIS.png ':size=387')

vATIS allows you to manually record an ATIS in the instance where the real-world ATIS isn't digitalized, and you wish to simulate this on VATSIM.

To manually record an ATIS, the Composite must be configured to be voice recorded. See the [Configuration](client?id=configuration) section for details on how to set this option.

1. Connect the ATIS to the network by clicking the **CONNECT** button.
2. Click the **RECORD ATIS** button. A dialog window (pictured above) will appear. Select your preferred microphone device and playback device (used to listen the recording before saving it).
3. Click the **Start Recording** button to begin recording your ATIS. When you are done recording, click the **Stop Recording** button.
4. You can optionally listen to the recording by clicking the **Listen** button.
5. Once you are satisfied, click the **Save** button. The ATIS will begin transmitting on the network.

When a new METAR update is available, you will be notified by the client icon flashing in the taskbar and the ATIS letter blinking yellow. See [ATIS Composites](client?id=atis-composites) section for details on how to acknowledge the update. Follow steps 2-5 to record a new ATIS.

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
## System Requirements

To ensure proper functionality, please ensure that your system meets the following requirements:

* **Operating System**: Windows 10 64-bit (or newer)
* **Free Disk Space**: A minimum of 200 MB on the drive where application data is stored (typically the C: drive)

## Installation

To install vATIS, please follow these steps:

1. Visit the vATIS website and [download](https://github.com/vatis-project/vatis/releases/latest) the latest installer.
2. Run the downloaded installer. During the installation process, you will be prompted to choose an installation location. It is recommended to leave the default location selected to avoid any folder/file permission problems.
3. Once the installation is complete, you will have the option to launch vATIS.

## Terms and Concepts

Prior to utilizing vATIS, it is essential to acquaint yourself with several fundamental terms and concepts.

* **Profile:** A Profile serves as the container for one or more ATIS Composites. It allows you to manage and organize your ATIS configurations effectively.
* **Composite:** Each ATIS station is represented as an individual Composite. Within each Composite, you have the ability to define the current airport conditions and other relevant ATIS information specific to that station.
* **Preset:** A Preset is utilized to save the Airport Conditions, NOTAMs, and other ATIS settings. Within a Composite, you can create and store one or more Presets. For instance, you might establish Presets for different airspace configurations such as "WEST OPS," "EAST OPS," and so on.

## Profiles

When you start vATIS, a dialog window will be displayed, containing a list of Profiles. Initially, the list will be empty upon your first use. Typically, users will obtain and import Profiles that have been created by the Facility Engineer of their ATC facility.

To open a specific Profile, simply double-click on its name in the list. This action will hide the Profile dialog, revealing the main vATIS window for further use.

![Settings](media/ProfileDialog.png ':size=345')

**Import Profile**<br/>
To import a vATIS Profile, simply click on the **Import** button. This will open a file browser dialog, allowing you to navigate to the location where the Profile file is stored. Importing a Profile will bring in all associated Composites, including their respective options and settings.

**Create a New Profile**<br/>
To create a new Profile, click on the **New** button. You will be prompted to enter a name for the Profile. A Profile can consist of one or more Composites. For example, you can create a Profile for Los Angeles Center and name it "Los Angeles (ZLA)".

**Export Profile**<br/>
To export a Profile, select the desired Profile name from the list and click on the **Export** button. This feature is helpful when you want to share the Profile with others or create a backup copy by exporting it to another location.

## Main Window

![Main Window](media/MainWindow_Annotated.png ':size=370')

<span class="circle">1</span> Opens the vATIS [Settings](client?id=settings) window, where you can save your VATSIM credentials, configure the vATIS window to stay on top, and toggle the ATIS notification sound.

<span class="circle">2</span> Opens the [Profile Configuration](client?id=profile-configuration) window. This window is where you can create, modify, or delete Composites.

<span class="circle">3</span> Displays the current Zulu (UTC) time.

<span class="circle">4</span> Hides the main vATIS window and opens the "Mini Display" window.

<span class="circle">5</span> Displays the Composites associated with the current Profile. If the ATIS is connected and actively transmitting, the ATIS letter will be shown next to the station identifier in cyan color. The ATIS letter will blink in yellow to indicate a new update.

<span class="circle">6</span> Indicates the current ATIS letter. Left-clicking the ATIS letter will increment to the next letter in sequence, while right-clicking will go back to the previous letter.

<span class="circle">7</span> Shows the current METAR report.

<span class="circle">8</span> Displays the current surface wind and altimeter information from the METAR report.

<span class="circle">9</span> A free-form text field for defining the current [Airport Conditions](client?id=airport-conditions), such as active runways, approaches in use, etc.

<span class="circle">10</span> A free-form text field for defining any [NOTAM](client?id=notams) messages, if applicable.

<span class="circle">11</span> Allows [manual voice recording](client?id=manual-voice-recorded-atis) of an ATIS using a connected microphone device.

<span class="circle">12</span> Provides a dropdown list of all saved [Presets](client?id=presets) for the Composite.

<span class="circle">13</span> This button is used to connect or disconnect the ATIS from the network.

## Mini-Display

To access the Mini-Display window, simply click on the "double-headed arrow" icon located in the main client window.

![Open Mini-Display Window](media/OpenMiniDisplay.png ':size=45')

The Mini-Display window provides a concise and unobtrusive view of the connected ATIS stations, allowing for a distraction-free overview. To return to the main vATIS window, click the "double-headed arrow" icon on the Mini-Display window.

![Mini-Display Window](media/MiniDisplayWindow.png ':size=225')

To acknowledge a new ATIS update, simply click on the blinking ATIS letter. This action indicates that you have acknowledged the update.

![Mini-Display Window: Acknowledge ATIS Update](media/MiniDisplayWindowAcknowledgeUpdate.gif ':size=90')

## Settings

In the Settings window, you can save your Name, VATSIM ID, and Password, as well as select your Network Rating. The Network Server dropdown menu provides only one option, "AUTOMATIC," which helps to connect your vATIS session automatically to the best network server, taking into account your geographic location and server availability.

Enabling the **Suppress ATIS update notification sound** option will disable the auditory notification sound that plays when a new ATIS update becomes available.

If the **Keep vATIS window visible** option is checked, the vATIS window will remain visible and on top of other windows. This allows for easy access and visibility while using other applications.

![Settings](media/SettingsWindow.png ':size=607')

## Profile Configuration

![Profile Configuration](media/ProfileConfiguration.png ':size=527')

In the Profile Configuration window, you have the ability to add, modify, or delete Composites. The left sidebar provides a list of all the Composites added to the current Profile. By selecting a Composite from the list, you can easily modify its settings. Furthermore, you can click the **Manage Composite** button to perform actions such as Copying, Renaming, or Deleting the Composite.

If you have a legacy vATIS profile in a .gz file format, you can import it by clicking the **Manage Composite** button and selecting the "Import" action. This will import the legacy profile as a new Composite, allowing for easy integration and compatibility.

## General

![General Configuration](media/TabGeneral.png ':size=390')

The General tab encompasses various configuration options that apply globally to the Composite and are shared across all Presets.

**Frequency**<br/>
Specifies the VHF frequency used for the ATIS connection.

**ATIS Type**<br/>
Determines the type of ATIS: Combined, Departure, or Arrival. If Departure or Arrival is selected, the callsign will include `_D_` or `_A_` respectively. For example, `KATL_D_ATIS` for Departure ATIS at Hartsfield-Jackson Atlanta International Airport.

**Code Range**<br/>
Allows you to define the ATIS code range for Departure or Arrival ATIS. This feature enables you to restrict Departure ATIS to a specific range (e.g., `A..N`) and Arrival ATIS to another range (e.g., `M..Z`).

**Use "decimal" terminology in spoken text**<br/>
Enabling this option will result in numbers with decimals being spoken as "decimal" instead of "point". For example, "one three four **decimal** two five".

**Prefix spoken NOTAMs with "Notices to Air Missions"**<br/>
Enabling this option will add the prefix "Notices to Airmen" to the voice ATIS when speaking the NOTAMs. For example, "Notices to Airmen, RUNWAY TWO FIVE LEFT CLOSED". For non-FAA ATIS, the prefix will be "Notices to Airmen".

**Text to Speech/Voice Recorded**<br/>
This option allows you to choose between digitalized (text-to-speech) or manual voice recording for the ATIS. If "Text to Speech" is selected, you can further specify the desired voice option. The "Default" option corresponds to the voice used by FAA D-ATIS.

**IDS Endpoint**<br/>
If your facility is equipped with an Information Display System that is compatible with vATIS, you can enter the URL for automatic ATIS information updates. When a URL is specified, vATIS will initiate an HTTP POST request with a JSON payload similar to the following:

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

The Formatting tab provides the ability to personalize the format of each component of the ATIS. These formatting options are saved to the Composite configuration and are shared across all Presets.

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

Within each element tab, you can modify the Text (displayed in the text ATIS) and Voice (spoken in the voice ATIS) templates. Each element has specific variables that can be utilized in both the Text and Voice templates. By hovering your mouse over each variable, you can view a description of its purpose and usage.

## Observation Time
The observation time refers to the moment when the METAR report was generated. To include this element in the Preset ATIS template, you can utilize the `[OBS_TIME]` variable.

`{time}` ... Represents the time value from the METAR (e.g. `0153`)<br/>
`{hour}` ... Indicates the hour portion of the time (e.g. `01`)<br/>
`{minute}` ... Indicates the minute portion of the time (e.g. `53`)<br/>
`{special}` ... Inserts the word "SPECIAL" (voice ATIS only) if the METAR observation time differs from the routine observation time.

![Formatting Configuration](media/TabObservationTime.png ':size=338')

**Routine Observation Time**<br/>
The Routine Observation Time setting enables you to specify the minute interval at which the METAR report is typically generated. For instance, if the METAR for KLAX is regularly updated every hour at `53` minutes, you would enter the value 53. If the METAR station routinely updates multiple times within an hour, you can enter the interval values separated by a comma, such as `15,45`.

In the event that a METAR update is received and the minute of observation time does not match this specified value, it is considered a "special" update. You can utilize the `{special}` variable in both the Text and Voice templates to include the word "SPECIAL".

## Surface Wind
The Surface Wind element represents the wind information obtained from the METAR report. To include this element in the Preset ATIS template, you can use the `[WIND]` variable.

You have the flexibility to customize the formatting for various wind types, including:

* Standard wind (e.g. 25010KT)
* Standard wind with gusts (e.g. 18015G20KT)
* Variable wind (e.g. VRB05KT)
* Variable wind with gusts (e.g. VRB05G15KT)
* Wind with variable direction (e.g. 240V270)
* Calm wind

`{wind}` ... The complete wind string, only available for text ATIS (e.g. `25010G15KT V250V280`)<br/>
`{wind_dir}` ... The magnetic direction of the wind (e.g. `25010KT` would yield `250`)<br/>
`{wind_spd}` ... The speed/velocity of the wind (e.g. `25010KT` would yield `10`)<br/>
`{wind_gust}` ... The gust speed/velocity of the wind (e.g. `25010G18KT` would yield `18`)<br/>
`{wind_vmin}` ... The first extreme wind direction (e.g. `250V280` would yield `250`)<br/>
`{wind_vmax}` ... The last extreme wind direction (e.g. `250V280` would yield `280`)<br/>
`{wind_unit}` ... The wind speed unit of measurement (e.g. `25010KT` would yield `KT` and the spoken value would be `KNOTS`)

![Formatting Configuration](media/TabSurfaceWind.png ':size=338')

**Speak leading zero on wind speed**<br/>
When this option is enabled, the leading zero on wind speeds less than 10 will be spoken. For example, if the wind speed is `05`, it will be pronounced as `"ZERO FIVE"` instead of just `"FIVE"`.

**Magnetic Variation**<br/>
When enabled, the wind direction in the text-to-speech output will be adjusted based on the specified magnetic variation value. This ensures accurate wind direction information is provided.

## Visibility

The prevailing visibility element represents the visibility value obtained from the METAR report. To include this element in the Preset ATIS template, you can use the `[VIS]` variable.

`{visibility}` ... The visibility value (e.g. `10SM`)

![Formatting Configuration](media/TabVisibility.png ':size=338')

<hr/>

**ICAO Formatting**<br/>
The ICAO Formatting tab provides additional customization options for the prevailing visibility specifically tailored for international stations.

![Formatting Configuration](media/TabVisibilityIcao.png ':size=338')

**Include visibility unit suffix**<br/>
When this option is enabled, the unit type will be added to the visibility value, such as `"FIVE THOUSAND METERS"`. The suffix will automatically change to `"kilometers"` based on the specified `"Meters Cutoff"` value.

**Meters Cutoff**<br/>
The cutoff value determines when to switch from using the "meters" suffix to "kilometers" in the voice ATIS.

**9999 (Voice)**<br/>
The text spoken when the visibility is reported as `9999`.

**9999 (Text)**<br/>
The text shown in the text ATIS when the visibility is reported as `9999`.

**Visibility Direction**<br/>
This setting defines how the visibility directions should be spoken in the voice ATIS when the visibility is different in various directions, for example: `1200SE 6000N`. Use this table to specify the spoken text for cardinal directions.

## Present Weather

The present weather condition element extracted from the METAR report.

`{weather}` ... The present weather items (e.g. `SHRA BR`)

![Formatting Configuration](media/TabPresentWeather.png ':size=338')

<hr/>

**Intensity/Proximity Descriptors**<br/>
The spoken text representing intensity/proximity descriptors for present weather conditions.

![Formatting Configuration](media/TabPresentWeatherIntensity.png ':size=338')

<hr/>

**Weather Types**<br/>
Specify the METAR weather type codes and their corresponding spoken voice ATIS strings.

![Formatting Configuration](media/TabPresentWeatherTypes.png ':size=338')

<hr/>

**Weather Descriptors**<br/>
Specify the METAR weather descriptor codes and their corresponding spoken voice ATIS strings.

![Formatting Configuration](media/TabPresentWeatherDescriptors.png ':size=338')

## Clouds

This element represents the cloud layers information obtained from the METAR reports.

`{clouds}` ... The cloud layers (e.g. `FEW050 SCT100`)

![Formatting Configuration](media/TabClouds.png ':size=338')

**Identify ceiling layer in voice ATIS**<br/>
When enabled, the lowest BKN (broken) or OVC (overcast) cloud layer will be introduced with the term "ceiling" in the voice ATIS. For example, it will be spoken as `"CEILING ONE THOUSAND FOUR HUNDRED OVERCAST, TWO THOUSAND BROKEN."`

**Convert cloud layer altitude to metric**<br/>
If this option is selected, the altitude (height) of the cloud layer will be converted to the metric unit in both the voice and text ATIS.

**Undetermined (Voice)**<br/>
The text spoken if the cloud altitude (height) is undetermined.

**Undetermined (Text)**<br/>
The text shown in the text ATIS if the cloud altitude (height) is undetermined.

<hr/>

**Cloud Types**<br/>
Specify how the cloud types should be articulated in the voice ATIS.

`{altitude}` ... Represents the altitude or height of the cloud layer.<br/>
`{convective}` ... If the cloud layer is a convective layer, the spoken text for the convective layer will be added (e.g. `SCT250CB`)

![Formatting Configuration](media/TabCloudTypes.png ':size=338')

<hr/>

**Convective Cloud Types**<br/>
Specify how the convective cloud types should be articulated in the voice ATIS.

![Formatting Configuration](media/TabConvectiveCloudTypes.png ':size=338')

## Temperature

The temperature element from the METAR.

`{temp}` ... The temperature value (e.g. `05`)

**Prefix positive temperature with "plus" in voice ATIS**<br/>
When enabled, positive temperatures will be prefixed with the word "plus" in the voice ATIS. For example, `"TEMPERATURE PLUS TWO FIVE"`.

**Speak leading zero in voice ATIS**<br/>
When enabled, the leading zero will be spoken in the voice ATIS. For example, `"TEMPERATURE ZERO SIX"`.

![Formatting Configuration](media/TabTemperature.png ':size=338')

## Dewpoint

The dewpoint element from the METAR.

`{dewpoint}` ... The dewpoint temperature value (e.g. `05`)

![Formatting Configuration](media/TabDewpoint.png ':size=338')

## Altimeter

The altimeter element from the METAR.

`{altimeter}` ... The numeric altimeter value (e.g. `2998` or `1013`)<br/>
`{altimeter|inhg}` ... The numeric altimeter value converted to inches of mercury (inHg)<br/>
`{altimeter|hpa}` ... The numeric altimeter value converted to hectopascals (hPa)<br/>
`{altimeter|text}` ... The altimeter value translated to words (e.g. `TWO NINER NINER TWO`)

![Formatting Configuration](media/TabAltimeter.png ':size=338')

## Closing Statement

The ATIS closing statement message.

`{letter}` ... The current ATIS letter (e.g. `A`)<br/>
`{letter|word}` ... The current ATIS letter in word form (e.g. `ALPHA`)

**Automatically include closing statement at the end of the ATIS**<br/>
If enabled, the closing statement will be automatically added to the end of the ATIS without requiring the `[CLOSING]` variable in the ATIS template.

![Formatting Configuration](media/TabClosingStatement.png ':size=338')

## Transition Level

This formatting tab is specifically visible for non-FAA ATIS composites. It allows you to establish a range of QNH values to determine the transition level. The ATIS template variable `[TL]` can be used to populate the transition level in the ATIS layout template (see [Presets](client?id=presets) section).

`{trl}` ... The numerical value of the transition level altitude, for example, `65`<br/>
`{trl|text}` ... The transition level altitude expressed in word form, such as `"SIX FIVE"`

![Formatting Configuration](media/TabTransitionLevelTemplate.png ':size=338')

In the Transitions Level table, you can specify the minimum and maximum QNH values that are utilized to determine the transition level altitude. It is necessary to provide both the low and high QNH values.

![Formatting Configuration](media/TabTransitionLevels.png ':size=338')

## Presets

The **Presets** tab allows you to manage your presets by adding, copying, renaming, or deleting them. The text box below the dropdown list is where you can customize the ATIS template. When an ATIS is generated, the variables will be replaced with actual data. If the Composite is configured to use Text to Speech, the template text will be synthesized and transmitted.

You can use the following variables in the ATIS template. If you want to use the voice translated text instead of the raw text value in the text ATIS, you can optionally suffix the variable name with `:VOX` (e.g., `[WX:VOX]`).

|Variable|Definition|
|---|---|
|`[FACILITY]`|The name of the ATIS facility (airport name)|
|`[ATIS_CODE]`<br/>`[ATIS_LETTER]`<br/>`[LETTER]`<br/>`[ID]`|The current ATIS letter code|
|`[WX]`<br/>`[FULL_WX_STRING]`|Inserts the weather elements in the standard order:<br/>`Surface Wind`, `Visibility`, `RVR`, `Present Weather`, `Clouds`, `Temperature`, `Dew Point`, `Altimeter` |
|`[OBS_TIME]`<br/>`[TIME]`|	The observation time of the METAR|
|`[WIND]`<br/>`[SURFACE_WIND]`|The reported surface wind|
|`[RVR]`|The runway visibility range (if available)|
|`[VIS]`<br/>`[PREVAILING_VISIBILITY]`|The prevailing visibility|
|`[PRESENT_WX]`<br/>`[PRESENT_WEATHER]`|The present weather conditions (e.g., rain, snow, hail, etc.)|
|`[CLOUDS]`|The reported cloud conditions|
|`[TEMP]`|The reported temperature|
|`[DEW]`|The reported dew point temperature|
|`[PRESSURE]`|The reported pressure value|
|`[TREND]`|The TREND forecast from the METAR|
|`[ARPT_COND]`|Inserts the text from the free-form Airport Conditions field, followed by any selected static text options|
|`[NOTAMS]`|Inserts the text from the free-form NOTAMS field, followed by any selected static text options|
|`[TL]`|Inserts the transition level based on the configured ranges in the **Transition Level** formatting tab (non-US ATIS only)|
|`[CLOSING]`|Inserts the closing statement message|

## External ATIS Generator

**Use external ATIS generator (e.g. UniATIS)**<br/>
When this option is enabled, you can configure vATIS to utilize an external source for generating the ATIS text. Please note that you need to have a Preset selected before configuring an external ATIS generator.

* **URL** The URL of the external ATIS generator.
* **Arrival Runway** The arrival runway(s). You can include the variable `$arrrwy` in the URL to automatically append the value of the Arrival Runway field.
* **Departure Runway** The departure runway(s). You can include the variable `$deprwy` in the URL to automatically append the value of the Departure Runway field.
* **Approaches in Use** The approaches currently in use. You can include the variable `$app` in the URL to automatically append the value of the Approaches in Use field.
* **Remarks** Pertinent remarks. You can include the variable `$remarks` in the URL to automatically append the value of the Remarks field.

Additional variables include:

* `$metar` The current METAR string
* `$atiscode` The current ATIS letter

![Contractions](media/TabPresetsExternalAtis.png ':size=390')

## Contractions

The **Contractions** tab allows you to define personalized contractions. If you specify a contraction that already exists in the [default contractions](client?id=default-contractions) list, your new definition will overwrite it. Contractions serve various purposes, such as creating acronyms or modifying the pronunciation of words when using the text-to-speech engine.

![Contractions](media/TabContractions.png ':size=390')

## Sandbox

The Sandbox feature provides an offline testing environment for your ATIS configuration. To test a configuration, follow these steps:

1. Enter or retrieve a METAR.
2. Select an ATIS letter and a Preset.
3. You have the option to customize the Airport Conditions and NOTAMs text if desired. Additionally, you can access the static definitions window by clicking on the corresponding field labels. This allows you to enable or disable predefined definitions. Please keep in mind that any modifications made to the Airport Conditions or NOTAMs will not be saved to the Composite profile.

Note: If you make modifications in other tabs of the ATIS configuration, remember to click the "Apply" button followed by the "Refresh ATIS" button to update the sandbox ATIS with the latest changes.

To generate the text-based ATIS, simply click the "Refresh ATIS" button. This action will also trigger the generation of voice-based ATIS audio if the configuration is set to use text-to-speech. To listen to the ATIS audio, click the "Play Voice ATIS" button, and the audio will be played through your default audio device.

![ATIS Sandbox](media/TabSandbox.png ':size=525')

## Composites

Each Composite is displayed as a separate tab in the main user interface. When the ATIS is connected, the current ATIS letter is highlighted in cyan color, making it easy to identify.

![Composites](media/Composites.png ':size=307')

When a new ATIS update is ready, the vATIS client icon in the Windows taskbar will flash, drawing your attention. If you have enabled notification sounds, you will also hear a notification sound. Additionally, the ATIS letter for the corresponding Composite will blink in yellow. To acknowledge the ATIS update, simply click the Composite tab and left-click the ATIS letter button once to stop the blinking.

![Acknwowledge Update](media/AcknowledgeUpdate.gif ':size=176')

## Airport Conditions

![Airport Conditions](media/AirportConditionDefinitions.png ':size=367')

In addition to the free-form Airport Conditions text, you have the option to define static messages that can be toggled on or off. These static messages can be helpful when you frequently use certain predefined messages and need the flexibility to enable or disable them as needed. These messages are saved within the Composite, so they can be used with any selected Preset.

To create a new static message, simply click on the `ARPT COND` label above the free-form text box for Airport Conditions. This will open a popup dialog (as shown in the image above), where you can add, edit, or delete existing messages. You can also reorder the messages by selecting a message from the list and using the Up or Down buttons. The messages will be presented in the ATIS in the order they appear, but only if the corresponding message is checked.

**Include before free-form ARPT CONDs**<br/>
If checked, checked Airport Conditions will included <u>before</u> the free-form Airport Conditions text.

## NOTAMs

![NOTAM Conditions](media/NotamDefinitions.png ':size=367')

In addition to the free-form NOTAMS text, you have the option to define static messages that can be toggled on or off. These static messages are useful for frequently used messages that you may need to enable or disable as required. They are saved within the Composite, making them available for use with any selected Preset.

To create a new static message, simply click on the `NOTAMS` label above the free-form text box for NOTAMS. This will open a popup dialog (as shown in the image above), where you can add, edit, or delete existing messages. You can also reorder the messages by selecting a message from the list and using the Up or Down buttons. The messages will be presented in the ATIS in the order they appear, but only if the corresponding message is checked.

**Include before free-form NOTAMs**<br/>
If checked, checked NOTAMs will included <u>before</u> the free-form NOTAMs text.

## Manual Voice Recorded ATIS

![Record ATIS](media/RecordATIS.png ':size=387')

vATIS offers the option to manually record an ATIS in cases where the real-world ATIS is not digitalized and you want to simulate it on VATSIM.

To manually record an ATIS, ensure that the Composite is configured for voice recording. Refer to the [Configuration](client?id=configuration) section for instructions on how to enable this option.

1. Connect the ATIS to the network by clicking the **CONNECT** button.
2. Click the **RECORD ATIS** button. This will open a dialog window (as shown in the image above) where you can select your preferred microphone device and playback device (used to listen to the recording before saving).
3. Click the **Start Recording** button to begin recording your ATIS. When you have finished recording, click the **Stop Recording** button.
4. You have the option to listen to the recording by clicking the **Listen** button.
5. Once you are satisfied with the recording, click the **Save** button. The ATIS will then start transmitting on the network.

When a new METAR update becomes available, you will receive a notification through the flashing client icon in the taskbar and the blinking yellow ATIS letter. Refer to the [ATIS Composites](client?id=atis-composites) section for instructions on acknowledging the update. To record a new ATIS, follow steps 2 to 5 again.

## Text Parsing Rules

The following text parsing rules can be used in the free-form textboxes for Airport Conditions and NOTAMs:

**Taxiways**<br/>
To parse taxiway names, you need to include the acronym `TWY` or `TWYS` before the identifier. For example, using `TWY E16` will be pronounced as `"taxiway echo sixteen"` by the voice synthesizer.

**Runways**<br/>
To parse runway names, you need to include the acronym `RWY`, `RWYS`, `RUNWAY`, or `RUNWAYS` before the identifier. For example, using `RWY 25R` will be pronounced as `"runway two five right"` by the voice synthesizer. 

Alternatively, you can prefix the runway identifier with a caret symbol (`^`) and the voice synthesizer will pronounce the runway correctly. For example, `^25R` would be read as `"TWO FIVE RIGHT"`.

**Numbers**<br/>
To pronounce numbers in group format, prepend an asterisk (`*`) followed by the number, or enclose the number in braces `{}`. For example, `*5058` (or `{5058}`) will be pronounced as `"five thousand, fifty-eight"` by the voice synthesizer. If the number should be pronounced as a negative value, add a dash after the asterisk. For example, `*-8` will be pronounced as `"minus eight"`.

**Airport Names**<br/>
To parse airport identifiers into the airport name, prepend a plus sign (`+`) before the ICAO identifier. For example, `+KLAX` will be read as `"Los Angeles International Airport"` by the voice synthesizer.

**Navaids**<br/>
To parse navaid identifiers into their names, prepend a plus sign (`+`) before the navaid identifier. For example, `+GBN` will be read as `"Gila Bend"` by the voice synthesizer.

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
---
layout: page
title: Release Notes
nav_order: 5
---

# Release Notes
The latest changes in vATIS. The full history is in the [changelog on GitHub](https://github.com/vatis-project/vatis/blob/main/CHANGELOG.md).

## v4.1.0-beta.20
### Added
- Added a JSON-only `disconnectIfUnrecorded` option to automatically disconnect a recorded voice ATIS if it hasn't been recorded within 5 minutes of connecting.
- Added support for double-clicking the main window to open the mini-window.
- Added a `--import-profile` command-line argument to import a profile from a file path.
- Added a `syncAtisLetter` property to the `configureAtis` WebSocket message.
- Added support for the `setAtisLetter` WebSocket message and broadcasting connection errors to all WebSocket clients.
- Added options to speak wind speed in group format and use digit formatting for wind speed in text templates.
- Added a negative prefix option for temperature and dewpoint text templates.
- Added per-variable text and voice formatting options for altimeter, temperature, and dewpoint.
- Added text ATIS variables for visibility direction, RVR tendency, and convective clouds.
- Added customizable visibility unit words, a fraction voice table, and cloud altitude formatting.
- Added customizable spoken phrases and text for runway visual range.
- Added custom text and voice formatting for CAVOK.
- Added custom separators for airport conditions and NOTAMs.
- Added an "Include" option for static airport conditions and NOTAMs, allowing entries to appear only when specific ATC stations are online or offline (e.g., `LAX_TWR`, `EPWW_*_CTR`).
- Added conditional weather rules for static airport conditions and NOTAMs, allowing entries to appear only when METAR conditions match a specified expression (e.g., `ceiling < 200ft AND (rvr < 550m OR visibility < 100m)`).
- Added runway condition reporting from METAR runway state groups.
- Added remark wind information to the ATIS.
- Added an `[AUTO]` variable for automatic observations, a `[METAR]` variable for raw METAR data, a per-preset threshold QFE variable, and a `{feet}` cloud token.
- Added digit-count formatting for the transition level variable.
- Added an Undetermined Cloud type for cloud layers with unknown heights.
- Added an option to randomize the ATIS letter on connect.
- Added an option to apply a contraction to all ATIS stations.
- Added a profile option to alternate between voices.
- Added support for WAV voice packs in stitched voice ATIS.
- Added automatic loading of native D-ATIS. Thanks to Leftos and Josh G. for their work on this.
- Added a voice ATIS recording indicator and magnetic wind toggle to the mini-window.
- Added a keyboard shortcut to open the application data folder.
- Added underlining for contractions and speech tokens in the ATIS editors.
- Added the airport name to the Record ATIS script.
- Added the ability to override the METAR of a connected ATIS by right-clicking the METAR box.
- Added regex pattern replacements with functions (`$group`, `$digits`, `$spell`, `$phonetic`) for modifying written and spoken ATIS.
- Added a text/voice script toggle to the Record ATIS dialog.
- Added support for visibility in kilometers in the METAR decoder.

### Changed
- Improved application startup and profile loading performance.
- Updated the application icon.
- Standardized scrollbar styling throughout the application.
- Updated button icons to use SVG assets.
- Improved taxiway and runway identifier parsing for spoken ATIS.
- Included the full text ATIS in the IDS JSON and added an empty update on disconnect.
- Updated network traffic encoding to Latin-1.
- Preserved user-edited profile names during automatic profile updates.
- Improved error reporting when navdata downloads fail.
- Redesigned the release notes window to organize changes into titled sections.
- Updated Windows machine ID handling to remove whitespace and null terminators.

### Fixed
- Fixed an error dialog appearing on Linux when a desktop service, such as the global menu or input method, is unavailable.
- Fixed tooltips closing unexpectedly in dialog windows on macOS.
- Fixed dialogs drifting off-center from their parent windows when resized.
- Fixed AtisHub connecting without a VATSIM token and subscription errors going unnoticed.
- Fixed integration with vatSys.
- Fixed forced disconnect logic.
- Fixed the ATIS being republished and re-subscribed after an automatic AtisHub reconnect.
- Fixed TREND information being omitted from the ATIS when the METAR contains an RMK section, and incorrect TREND parsing with multiple present weather groups.
- Fixed METAR decoding when an unavailable group follows visibility or when an RVR value is unavailable.
- Fixed directional minimum visibility in text and voice ATIS.
- Fixed a race condition in `getStations` after re-entering a profile.
- Fixed repeated microphone permission prompts on macOS.
- Fixed message box and modal dialog centering and height issues.
- Fixed popping noises at the start and end of sandbox audio playback.
- Fixed the sandbox ATIS refresh not selecting a random letter from the configured code range.
- Fixed ATIS letter input and unintended letter shifting while typing.
- Fixed window position restoration when opening the application.
- Fixed local development configurations for VS Code and Rider.

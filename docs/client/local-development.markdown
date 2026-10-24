---
layout: home
title: Local Development
parent: vATIS
nav_order: 13
---

# Local Development

{: .warning-no-title }
> **For Developers Only**
>
> This information is intended for developers only. If you're not familiar with programming or using IDEs, then this page is not for you.

vATIS supports local development, allowing you to debug the application without connecting to the live VATSIM network or ATIS hub. The vATIS Visual Studio solution includes a dedicated DevServer project that enables you to:

- Connect an ATIS and publish the ATIS code locally for your development purposes (visible only to you).
- Simulate a mock FSD connection, requiring no actual connection to the VATSIM FSD server.
- Fetch the most recent METAR data from the VATSIM METAR repository.

This setup provides a self-contained environment for testing and debugging vATIS.

## How to Use
To begin, clone the vATIS GitHub repository to your local machine. The vATIS solution file comes preconfigured with development profiles for Visual Studio, JetBrains Rider, and Visual Studio Code.

`git clone https://github.com/vatis-project/vatis.git`

### Visual Studio

1. Open the vATIS.slnx
2. Select the "Local Dev" startup item.
3. Click the Start button. This will launch vATIS in debug mode and start the localhost dev server in a separate console window.

![VisualStudio](/assets/images/VisualStudio_LaunchProfile.png)

{: .note-title }
> Prerequisite
>
> The Visual Studio launch profile is supported only for versions 17.11 and newer. Ensure that the "Enable Multi Launch Profiles" feature is enabled. To enable it, navigate to Tools > Options > Preview Features and toggle the checkbox for "Enable Multi Launch Profiles".

### Rider

1. Open the vATIS.slnx
2. From the **Run / Debug Configurations** dropdown, select "Local Dev".
3. This will launch vATIS in debug mode and start the localhost dev server in a separate process.

![Rider](/assets/images/Rider_DevProfile.png)

### Visual Studio Code

1. Open the cloned repository folder in Visual Studio Code. The editor will attempt to automatically configure the project.
2. Press **F5** to start vATIS and the development server.

If the **C# Dev Kit** extension is not already installed, VSCode will prompt you to install it.

![Install Extension](/assets/images/VSCode_InstallExtension.png)

If you encounter the error shown below when starting the project, try restarting Visual Studio Code. If the error persists after restarting, it likely means the required C# extension was not installed correctly. To fix this, manually install the [C# Dev Kit extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit) and restart VSCode.

![Task Error](/assets/images/VSCode_TaskError.png)


## Development Server Web UI
The Development Server Web UI provides tools to mock and force METAR updates for a connected vATIS client, and to choose which controllers are online, making it easier to simulate and test ATIS generation.

### Accessing the Web UI
You can access the Development Server Web UI in any browser by navigating to: [`http://127.0.0.1:5500`](http://127.0.0.1:5500).

![Web UI](/assets/images/DevWebUI.png)

### Fetching a METAR
To fetch the latest METAR:
1. Enter the station's identifier in the input field.
2. Click the "Fetch METAR" button. This retrieves the most recent METAR from the VATSIM METAR feed.

### Modifying a METAR
To modify and update a METAR:
1. Input a METAR manually or fetch the most recent METAR.
2. Adjust the METAR text as needed.
3. Click the "Update METAR" button.

This action sends the modified METAR to the connected vATIS client, simulating a received METAR update and triggering an ATIS update.

### Online Controllers
The dev server also hosts a local copy of the VATSIM data feed at `http://127.0.0.1:5500/datafeed`. When vATIS runs in development mode it reads this feed instead of the real one, so you can test [Conditional Messages](/docs/client/conditional-messages) that depend on which controllers are online without anyone being logged on.

1. Enter a callsign in the **Online Controllers** section of the Web UI and click **Add**. The facility is taken from the end of the callsign: `_DEL`, `_GND`, `_RMP`, `_TWR`, `_APP`, `_DEP`, `_CTR` or `_FSS`. A callsign that ends in anything else is treated as an observer.
2. Click **Remove** next to a callsign to take that controller offline, or **Clear all** to take everyone offline.

The feed starts empty, so nobody is online until you add someone. vATIS reads the feed every 3 seconds in development mode, so changes show up within a few seconds. Observers, which include callsigns that do not end in one of those suffixes, are ignored by vATIS, as they are on the real network.

To use a different feed, such as a JSON file you serve yourself, set the `VATIS_DATA_URL` environment variable to its URL before starting vATIS. It works with or without development mode.

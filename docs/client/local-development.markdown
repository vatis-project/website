---
layout: home
title: Local Development
parent: vATIS
nav_order: 15
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
The vATIS solution file comes preconfigured with development profiles for Visual Studio, JetBrains Rider, and VSCode.

### VisualStudio

1. Select the "Local Dev" startup item.
2. Click the Start button. This will launch vATIS in debug mode and start the localhost dev server in a separate console window.

![VisualStudio](/assets/images/VisualStudio_LaunchProfile.png)

{: .note-title }
> Prerequisite
>
> The Visual Studio launch profile is supported only for versions 17.11 and newer. Ensure that the "Enable Multi Launch Profiles" feature is enabled. To enable it, navigate to Tools > Options > Preview Features and toggle the checkbox for "Enable Multi Launch Profiles".

### Rider

1. From the **Run / Debug Configurations** dropdown, select "Local Dev".
2. This will launch vATIS in debug mode and start the localhost dev server in a separate process.

![Rider](/assets/images/Rider_DevProfile.png)

### VSCode

### Manually Configure
To manually configure vATIS to connect to the local dev server, simply set the environment variable `ENV=DEV` and launch both the vATIS and DevServer projects.
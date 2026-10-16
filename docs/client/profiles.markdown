---
layout: home
title: Profiles
parent: vATIS
nav_order: 2
---

# Profiles
When you launch vATIS, a dialog window will appear displaying a list of Profiles. If this is your first time using vATIS, the list will initially be empty. Typically, users obtain and import Profiles provided by the Facility Engineer of their ATC facility.

To open a Profile, select it and click **Open** or double-click its name in the list. The Profile dialog will then close, and the main vATIS window will appear.

![Profile Dialog](/assets/images/ProfileDialog.png){:width="50%"}

## Creating a Profile
To create a Profile, click the **New** button on the Profiles window.<br/>
Enter a name for the Profile and click **OK**.

## Launching a Profile
Profiles are launched by selecting the Profile's name and clicking **Open** or by double-clicking the Profile's name. Refer to the [Launch vATIS Profiles via Command Line](#launch-vatis-profile-via-command-line) section for details on how to programmatically launch a vATIS profile using the command line.

## Importing and Exporting Profiles
You can import a Profile by clicking the **Import** button in the Profiles window. Once imported, the Profile will appear in the list.

To export a Profile, select the one you want to export and click the **Export** button. If any of the profile's stations use a [WAV voice pack](atis-configuration/voice-packs#sharing-profiles-that-use-voice-packs), the export is a `.zip` file that also contains the clips the profile uses.

## Renaming a Profile
To rename a Profile, select the one you want to rename and click the **Rename** button. A dialog window will open allowing you to specify the new profile name.

## Deleting a Profile
To delete a Profile, select the one you want to delete and click the **Delete** button.

{: .warning }
Deleting a Profile is irreversible.

## Launch vATIS Profile via Command Line
You can launch a vATIS profile directly from the Command Line or Terminal by using the `--profile` argument.

For example: `vATIS.exe --profile 3068994d-f5a0-46db-a5d1-9b0fb8e67cc5`

### Finding the Profile ID

The profile ID can be located in the application data folder (see the [FAQ](/docs/faq/#where-is-the-vatis-app-data) for the folder path, or press **Ctrl+Shift+O**, **Cmd+Shift+O** on macOS, in the main window or the Profiles window to open it). Profiles are stored in the Profiles folder, and the file names represent the profile IDs.

To identify which profile corresponds to a specific profile name:
1. Open the Profiles folder.
2. Use a text editor to open a profile file.
3. Check the contents to match the profile name to its ID.

## Import and Launch a Profile File via Command Line
Use the `--import-profile` argument to import a profile from a file and launch it right away. Provide the path to the profile JSON file.

For example: `vATIS.exe --import-profile C:\Profiles\ZLA.json`

This works differently from the **Import** button:

* The profile keeps the ID stored in the file, so it replaces an installed profile that has the same ID. The **Import** button always creates a new profile with a new ID.
* Only a profile JSON file is accepted. The **Import** button also accepts the `.zip` file exported for a profile that uses voice packs.
* If the import fails, vATIS shows the Profiles window instead.

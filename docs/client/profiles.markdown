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

To export a Profile, select the one you want to export and click the **Export** button.

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

The profile ID can be located in the application data folder (refer to the section above for folder paths). Profiles are stored in the Profiles folder, and the file names represent the profile IDs.

To identify which profile corresponds to a specific profile name:
1. Open the Profiles folder.
2. Use a text editor to open a profile file.
3. Check the contents to match the profile name to its ID.
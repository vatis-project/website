---
layout: page
title: FAQ
nav_order: 8
---

# Facility Engineer

## Where is the vATIS App Data?

#### Windows:
`C:\Users\<USER>\AppData\Local\org.vatsim.vatis` or `%localappdata%\org.vatsim.vatis`

#### macOS:
`~/Library/Application Support/org.vatsim.vatis`

#### Linux:
`~/.local/share/org.vatsim.vatis`

{: .note-title }
> Linux Users
>
> You may have to enable hidden files/folders to see the `.local` folder

## Launch vATIS Profile via Command Line
You can launch a vATIS profile directly from the Command Line or Terminal by using the `--profile` argument.

For example: `vATIS.exe --profile 3068994d-f5a0-46db-a5d1-9b0fb8e67cc5`

### Finding the Profile ID

The profile ID can be located in the application data folder (refer to the section above for folder paths). Profiles are stored in the Profiles folder, and the file names represent the profile IDs.

To identify which profile corresponds to a specific profile name:
1. Open the Profiles folder.
2. Use a text editor to open a profile file.
3. Check the contents to match the profile name to its ID.
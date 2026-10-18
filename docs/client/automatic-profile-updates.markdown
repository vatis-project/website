---
layout: page
title: Automatic Profile Updates
parent: vATIS
nav_order: 13
---

# Automatic Profile Updates

Facilities can enable automatic profile updates for their users. To enable this functionality, you need to update the profile JSON before publishing it on your website.

{: .important-title }
> Important
>
> Any local changes made to the profile will be overwritten when the profile is updated. The exceptions are the profile name and the voice pack choices: if a user renames the profile, the name they chose is kept, and stations keep their selected WAV voice pack.

To enable the automatic update functionality, add the following two properties to the profile JSON file:

```json
{
  "updateUrl": "https://example.com/vatis/profiles/vATIS-Profile.json",
  "updateSerial": 2024121601,
}
```

The updated profile will look something like this:

```json
{
  "name": "Profile Name",
  "id": "3068994d-f5a0-46db-a5d1-9b0fb8e67cc5",
  "updateUrl": "https://example.com/vatis/profiles/vATIS-Profile.json",
  "updateSerial": 2024121601,
  "stations": []
}
```

### Update URL
The `updateUrl` property specifies the location where the profile file is hosted. If user's profile includes this URL, vATIS will compare the locally installed version with the version available at the specified URL. The file must be publicly accessible in order for vATIS to download it.

{: .note-title }
> Note
>
> The `updateUrl` is requested with a `ts` query parameter that includes a timestamp to ensure the file isn't cached. For example:
>
> `https://example.com/vatis/profiles/vATIS-Profile.json?ts=1742437799`

### Update Serial
The `updateSerial` property is a version identifier based on a date stamp. vATIS installs the profile it downloads only when its `updateSerial` is higher than the one in the installed profile (or when the installed profile has none). The format of this value should be **YYYYMMDD##**, where **##** is a number between **00** and **99**. This format allows for multiple updates on the same day in case of corrections or additional changes.

### When updates are checked
vATIS checks for profile updates each time it starts, and again after a profile is imported. An update is installed automatically, without asking the user. If the check fails, for example because the URL is not found or the file is not valid, the installed profile is left as it is and the problem is only written to the log.

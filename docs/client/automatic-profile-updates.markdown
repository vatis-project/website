---
layout: page
title: Automatic Profile Updates
parent: vATIS
nav_order: 13
---

# Automatic Profile Updates

Facilities can enable automatic profile updates for their users. To enable this functionality, you need to update the profile JSON before publishing it on your website.

Add the following two properties to the profile JSON file:

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

### Update Serial
The `updateSerial` property is a version identifier based on a date stamp. Incrementing this version number forces vATIS to install the new profile version. The format of this value should be **YYYYMMDD##**, where **##** is a number between **00** and **99**. This format allows for multiple updates on the same day in case of corrections or additional changes.
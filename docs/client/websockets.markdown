---
layout: home
title: WebSocket API
parent: vATIS
nav_order: 14
---

# WebSocket API

vATIS provides a websocket interface at `ws://127.0.0.1:49082/` to receive ATIS updates and interact with vATIS.

For an example of using the WebSocket interface see the [Stream Deck actions for vATIS project](https://github.com/neilenns/streamdeck-vatis). TypeScript [type definitions for the messages](https://github.com/neilenns/streamdeck-vatis/blob/main/src/interfaces/messages.ts) are also available in that project.

## Incoming messages

The following messages can be sent to vATIS to trigger state changes or to request state information.

### `getAtis`

Requests the current ATIS for a specific station or all stations in the loaded profile. The response is
an [`atis`](#atis) message for each matching station.

#### Message Properties

| Property | Description | Type | Notes |
|-|-|-|-|
| `id` | The unique ID of the station to get the ATIS for. | string |
| `atisType` | The station type to return. This enables requesting the specific `Departure` or `Arrival` ATIS for stations that publish separate ATIS information for arrivals and departures. | [atisType](#atistype) | Optional. Defaults to `Combined`. Only supported when the `station` property is set. |
| `station` | The identifier of the station to get the ATIS for. | string |

> **Note:** If `id` and `station` are omitted, the current ATIS for all stations in the loaded profile will be returned.

#### Example Messages

**Request the ATIS for all stations in the current profile**

```json
{
    "type": "getAtis"
}
```

**Request the ATIS for a specific station using the unique station ID**

```json
{
    "type": "getAtis",
    "value": {
        "id": "9d79f025-cb2e-485c-93a3-7d1b566d4afb"
    }
}
```

**Request the ATIS for a specific station that publishes a combined ATIS**

```json
{
    "type": "getAtis",
    "value": {
        "station": "KPDX"
    }
}
```

**Request the departure ATIS for a specific station that publishes a split ATIS**

```json
{
    "type": "getAtis",
    "value": {
        "atisType": "Departure",
        "station": "KPDX"
    }
}
```

---

### `acknowledgeAtisUpdate`

Acknowledges the ATIS update for a specific station or all stations, clearing the `isNewAtis` flag
and turning off the flashing new ATIS letter in vATIS for the station(s).

The following value properties are supported:

| Property | Description | Type | Notes |
|-|-|-|-|
| `id` | The unique ID of the station to acknowledge. | string |
| `atisType` | The station type to acknowledge. This enables acknowledging the specific `Departure` or `Arrival` ATIS for stations that publish separate ATIS information for arrivals and departures. | [atisType](#atistype) | Optional. Defaults to `Combined`. Only supported when the `station` property is set. |
| `station` | The identifier of the station to acknowledge. | string |

> **Note:** If `id` and `station` are omitted, all new ATISes in the loaded profile will be acknowledged.

#### Example Messages

**Acknowledge the ATIS update for all stations in the current profile**

```json
{
    "type": "acknowledgeAtisUpdate"
}
```

**Acknowledge the ATIS update for a specific station using the unique station ID**

```json
{
    "type": "acknowledgeAtisUpdate",
    "value": {
        "id": "9d79f025-cb2e-485c-93a3-7d1b566d4afb"
    }
}
```

**Acknowledge the ATIS update for a specific station that publishes a combined ATIS**

```json
{
    "type": "acknowledgeAtisUpdate",
    "value": {
        "station": "KPDX"
    }
}
```

**Acknowledge the ATIS update for a specific station that publishes a split ATIS**

```json
{
    "type": "acknowledgeAtisUpdate",
    "value": {
        "atisType": "Departure",
        "station": "KPDX"
    }
}
```

---

### `getProfiles`

Requests a list of all installed profiles. The response returns a collection of [`profiles`](#profiles).

```json
{
    "type": "getProfiles"
}
```

---

### `getActiveProfile`

Requests the active profile. The response returns an [`activeProfile`](#activeprofile) message.

```json
{
    "type": "getActiveProfile"
}
```

---

### `getStations`

Requests a list of stations in the currently loaded profile. The response returns a collection of [`stations`](#stations).

```json
{
    "type": "getStations"
}
```

---

### `getContractions`

Requests the contractions for a specific ATIS station, or all stations. The response returns a [`contractions`](#contractions) message.

#### Example Messages

**Get contractions for all stations in the loaded profile**

```json
{
    "type": "getContractions"
}
```

**Get contractions for a specific station using the unique station ID**

```json
{
    "type": "getContractions",
    "value": {
        "id": "9d79f025-cb2e-485c-93a3-7d1b566d4afb"
    }
}
```

**Get contractions for a specific station that publishes a combined ATIS**

```json
{
    "type": "getContractions",
    "value": {
        "station": "KLAX"
    }
}
```

**Get contractions for a specific station that publishes a split ATIS**

```json
{
    "type": "getContractions",
    "value": {
        "station": "KLAX",
        "atisType": "Departure"
    }
}
```

---

### `loadProfile`

Loads the specified profile by its unique ID. If no profile is found with the given `id`, the request is ignored, and no response is returned.

You can retrieve available profile IDs by sending a [`getProfiles`](#getprofiles) request.

```json
{
    "type": "loadProfile",
    "value": {
        "id": "1410d902-7b75-4157-b6a7-a124e532fd95"
    }
}
```

---

### `configureAtis`

Configures the specified ATIS station in the currently loaded profile. If the station doesn't exist or the preset is invalid, the request is ignored, and no response is returned.

You can retrieve available stations presets by sending a [`getStations`](#getstations) request.

The following value properties are supported:

| Property | Description | Type | |
| - | - | - | - |
| `station` | The station identifier (e.g. `KMIA`) | `string` |
| `id` | The unique station ID | `string` |
| `atisType` | The ATIS type. | [AtisType](#atistype) |
| `preset` | The ATIS preset to load | `string` | Required |
| `airportConditionsFreeText` | The free-text airport conditions | `string` | Optional |
| `notamsFreeText` | The free-text NOTAMs | `string` | Optional |


> **Notes:**  
> - You must provide **either** `station` **or** `id`, but **not both**.
> - `atisType` is required only when using `station` (not needed with `id`).  
> - `airportConditionsFreeText` and `notamsFreeText` are optional. Any provided text will overwrite any text in the preset, but the changes will not be permanently saved.

#### Example Messages

**Configure ATIS by station identifier and type**

```json
{
    "type": "configureAtis",
    "value": {
        "station": "KMIA",
        "atisType": "Departure",
        "preset": "D-ATIS",
        "airportConditionsFreeText": "DEPG RWYS 8L, 8R, 9, 12. RWY 8L, RWY 8R FREQ 118.3 RWY 9, RWY 12 FREQ 123.9.",
        "notamsFreeText": "ATTENTION NORTH DEPARTURES, NORTH DEPARTURE FREQUENCY IS 126.85."
    }
}
```

**Configure ATIS by unique station ID**

```json
{
    "type": "configureAtis",
    "value": {
        "id": "478ad86d-edd0-47b1-972a-f68345fd3f3f",
        "preset": "D-ATIS",
        "airportConditionsFreeText": "CTC CD IF UNABLE. RWY 26R, RWY 26L FREQ 118.3 RWY 27, RWY 30 FREQ 123.9.",
        "notamsFreeText": "BIRDS INVOF MIA. ALL ACFT READ BACK ALL HOLD SHRT INSTRUCTIONS AND ASSIGNED ALT."
    }
}
```

---

### `connectAtis`

Connects the specified ATIS station to the network. If the station does not exist, the request is ignored, and no response is returned. 

If the ATIS is successfully connected, an [`atis`](#atis) message response will be received.

To retrieve available stations, send a [`getStations`](#getstations) request.

#### Message Properties

| Property | Description | Type |
| - | - | - |
| `id` | The unique station ID | `string` |
| `station` | The station identifier (e.g. `KMIA`) | `string` |
| `atisType` | The ATIS type. | [AtisType](#atistype) |

> **Note:** You must provide **either** `id` **or** `station` and `atisType`.  

#### Example Messages

**Connect ATIS by station identifier and type**

```json
{
    "type": "connectAtis",
    "value": {
        "station": "KMIA",
        "atisType": "Departure"
    }
}
```

**Connect ATIS by unique station ID**

```json
{
    "type": "connectAtis",
    "value": {
        "id": "478ad86d-edd0-47b1-972a-f68345fd3f3f"
    }
}
```

---

### `disconnectAtis`

Disconnects the specified ATIS station to the network. If the station does not exist, the request is ignored, and no response is returned. 

If the ATIS is successfully disconnected, an [`atis`](#atis) message response will be received.

To retrieve available stations, send a [`getStations`](#getstations) request.

#### Message Properties

| Property | Description | Type |
| - | - | - |
| `id` | The unique station ID | `string` |
| `station` | The station identifier (e.g. `KMIA`) | `string` |
| `atisType` | The ATIS type. | [AtisType](#atistype) |

> **Note:**  You must provide **either** `id` **or** `station` and `atisType`.  

#### Example Messages

**Disconnect ATIS by station identifier and type**

```json
{
    "type": "disconnectAtis",
    "value": {
        "station": "KMIA",
        "atisType": "Departure"
    }
}
```

**Disconnect ATIS by unique station ID**

```json
{
    "type": "disconnectAtis",
    "value": {
        "id": "478ad86d-edd0-47b1-972a-f68345fd3f3f"
    }
}
```

---

### `quit`

Disconnects all active ATIS connections and gracefully shuts down the application process. No response is returned.

```json
{
    "type": "quit"
}
```

## Outgoing messages

The following messages are sent by vATIS to connected clients.

### `atis`

Sent to a specific client in response to a [`getAtis`](#getatis) message, or to all connected clients whenever a property on an
ATIS changes. The following value properties are sent:

| Property | Description | Type |
| - | - | - |
| `id` | The unique ID for the station | `string` |
| `station` | The identifier for the station. | `string` |
| `atisType` | The ATIS type. | [AtisType](#atistype) |
| `networkConnectionStatus` | The status of the station's network connection. | [NetworkConnectionStatus](#networkconnectionstatus) |
| `atisLetter` | The current ATIS letter. | `string` |
| `textAtis` | The text version of the ATIS, if available. | `string` |
| `airportConditions` | The airport conditions | `string` |
| `notams` | The NOTAMs | `string` |
| `isNewAtis` | True if the ATIS is new and has not been acknowledged by the user. | `boolean` |
| `metar` | The unparsed METAR for the station. | `string` |
| `wind` | The current surface wind. | `string` |
| `altimeter` | The formatted altimeter reading for the station. | `string` |
| `pressure` | The current pressure, as a whole number (e.g. `2990`). | [Value](#value) |
| `ceiling` | The current lowest cloud layer that is broken or overcast. If there is no ceiling then this property is not returned. | [Value](#value) | 
| `prevailingVisibility` | The current visibility. | [Value](#value) |

Example message:

```json
{
    "type": "atis",
    "value": {
        "id": "668dd798-38ff-4111-87bf-88cdbe09aece",
        "station": "KLAX",
        "atisType": "Combined",
        "networkConnectionStatus": "Connected",
        "atisLetter": "Q",
        "textAtis": "KLAX ATIS INFO Q 1253Z. 00000KT 10SM FEW014 OVC016 17/13 A2998 (TWO NINER NINER EIGHT). INST APCHS AND RNAV RNP APCHS IN PROG RWY 24R AND RWY 25L, OR VCTR FOR VISUAL APCH WILL BE PROVIDED, SIMUL VISUAL APCHS TO ALL RWYS ARE IN PROG. SIMUL INSTR DEPARTURES IN PROG RWYS 24 AND 25. NOTAMS... CALL FOR PUSHBACK ONLY REQUIRED ONTO A TAXIWAY. ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS. ...ADVS YOU HAVE INFO Q",
        "airportConditions": "INST APCHS AND @RNAV RNP APCHS IN PROG RWY 24R AND RWY 25L, OR VCTR FOR VISUAL APCH WILL BE PROVIDED, SIMUL VISUAL APCHS TO ALL RWYS ARE IN PROG. SIMUL INSTR DEPARTURES IN PROG RWYS 24 AND 25.",
        "notams": "CALL FOR PUSHBACK ONLY REQUIRED ONTO A TAXIWAY. ASDE-X SYSTEM IN USE. ACTIVATE TRANSPONDER WITH MODE C ON ALL TWYS AND RWYS. READBACK ALL RWY HOLD SHORT INSTRUCTIONS.",
        "isNewAtis": false,
        "metar": "KLAX 261253Z 00000KT 10SM FEW014 OVC016 17/13 A2998 RMK AO2 SLP152 T01670128",
        "wind": "00000KT",
        "altimeter": "A2998",
        "pressure": {
            "actualValue": 2998,
            "actualUnit": "MercuryInch"
        },
        "ceiling": {
            "actualValue": 16,
            "actualUnit": "Feet"
        },
        "prevailingVisibility": {
            "actualValue": 10,
            "actualUnit": "StatuteMile"
        }
    }
}
```

---

### `profiles`

Sent to a specific client in response to a [`getProfiles`](#getprofiles) message, or to all connected clients. The message includes a collection of profiles, with the following properties:

| Property | Description | Type |
| - | - | - |
| `id` | The unique ID for the profile | `string` |
| `name` | The name of the profile | `string` |

#### Example Message

```json
{
    "type": "profiles",
    "profiles": [
        {
            "id": "1410d902-7b75-4157-b6a7-a124e532fd95",
            "name": "Los Angeles ARTCC (ZLA)"
        },
        {
            "id": "7dc2457f-e14c-4d07-a736-b96a276666e1",
            "name": "Miami ARTCC (ZMA)"
        },
        {
            "id": "1310f8e5-89e7-4263-9d5d-b151cf443a95",
            "name": "ZSE"
        }
    ]
}
```

---

### `stations`

Sent to a specific client in response to a [`getStations`](#getstations) message, or to all connected clients. The message includes a collection of stations, with the following properties:

| Property | Description | Type |
| - | - | - |
| `id` | The unique ID for the station | `string` |
| `name` | The name of the profile | `string` |
| `atisType` | The ATIS type | [AtisType](#atistype) |
| `presets` | A collection of ATIS preset names | `string[]` (array of strings) |

#### Example Message

```json
{
    "type": "stations",
    "stations": [
        {
            "id": "9d79f025-cb2e-485c-93a3-7d1b566d4afb",
            "name": "KBUR",
            "atisType": "Combined",
            "presets": [
                "33/26 (26/33)",
                "NORMAL (8/15)",
                "NORMAL IMC (8/15)",
                "NORTH (8/33)",
                "STRAIGHT 33 (33)"
            ]
        },
        {
            "id": "00cfd104-2bd1-45ec-b5be-731953e52526",
            "name": "KLAS",
            "atisType": "Combined",
            "presets": [
                "CONFIG 1 (19/26)",
                "CONFIG 2 (1/8)",
                "CONFIG 3 (1/26)",
                "CONFIG 4 (8/19)"
            ]
        }
    ]
}
```

---

### `activeProfile`

Sent to a specific client in response to a [`getActiveProfile`](#getactiveprofile) message. The message includes information about the active profile with the following properties:

| Property | Description | Type |
| - | - | - |
| `id` | The unique ID for the profile | `string` |
| `name` | The name of the profile | `string` |

#### Example Message

```json
{
    "type": "activeProfile",
    "id": "bf94118a-37c1-4573-99b0-66059f096663",
    "name": "Los Angeles ARTCC (ZLA)"
}
```

---

### `contractions`

Sent to a specific client in response to a [`getContractions`](#getcontractions) message. The message includes a collection of stations with the following properties:

| Property | Description | Type |
| - | - | - |
| `id` | The unique ID for the station | `string` |
| `name` | The name of the station | `string` |
| `atisType` | The ATIS type | [AtisType](#atistype) |
| `contractions` | A dictionary collection of contractions | `dictionary` |

The contraction dictionary is composed of key/value pairs. Each key represents a contraction variable name, and each value includes the corresponding text and voice replacement definitions.

#### Example Message

```json
{
    "type": "contractions",
    "stations": [
        {
            "id": "cefc39ea-6f17-418e-b2cb-f8bf03e0de7b",
            "name": "Los Angeles",
            "atisType": "Combined",
            "contractions": {
                "RNAV": {
                    "text": "RNAV",
                    "voice": "R NAV"
                },
                "SUMMR": {
                    "text": "SUMMR",
                    "voice": "SUMMER"
                },
                "LADYJ": {
                    "text": "LADYJ",
                    "voice": "LADY JAY"
                }
            }
        }
    ]
}
```

## Types

The following types are used in message properties.

### `NetworkConnectionStatus`

Represents the current state of the station's network connection. Values are:

* `Connected`
* `Connecting`
* `Disconnected`
* `Observer`

### `AtisType`

Indicates whether the ATIS is combined, arrival, or departure. Values are:

* `Arrival`
* `Combined`
* `Departure`

### `Value`

Indicates a value and the value's unit.

| Property | Description | Type |
| - | - | - | 
| actualValue | The value. | `Number` | 
| actualUnit | The unit. | [`Unit`](#unit) |

### `Unit`

Describes the unit for a given value. The possible values are:

- `Degree`
- `DegreeCelsius`
- `Feet`
- `HectoPascal`
- `KilometerPerHour`
- `Knot`
- `MercuryInch`
- `Meter`
- `MeterPerSecond`
- `StatuteMile`
- `UnknownUnit`
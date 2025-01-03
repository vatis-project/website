---
layout: home
title: WebSocket API
parent: vATIS
nav_order: 14
---

# WebSocket API

vATIS provides a websocket interface at `ws://127.0.0.1:49082/` to receive ATIS updates and interact with vATIS.
For an example of using the WebSocket interface see the [Stream Deck actions for vATIS project](https://github.com/neilenns/streamdeck-vatis).
TypeScript [type definitions for the messages](https://github.com/neilenns/streamdeck-vatis/blob/main/src/interfaces/messages.ts) are also available in that project.

## Outgoing messages

The following messages are sent by vATIS to connected clients.

### `atis`

Sent to a specific client in response to a `getAtis` message, or to all connected clients whenever a property on an
ATIS changes. The following value properties are sent:

| Property | Description | Type |
| - | - | - |
| altimeter | The formatted altimeter reading for the station. | string |
| atisLetter | The current ATIS letter. | string |
| atisType | The ATIS type. | [AtisType](#atistype) |
| isNewAtis | True if the ATIS is new and has not been acknowledged by the user. | boolean |
| metar | The unparsed METAR for the station. | string |
| networkConnectionStatus | The status of the station's network connection. | [NetworkConnectionStatus](#networkconnectionstatus) |
| pressureUnit | The unit the pressure is in. | [PressureUnit](#pressureunit) |
| pressureValue | The current pressure value as a whole number. | number |
| station | The identifier for the station. | string |
| textAtis | The text version of the ATIS, if available. | string |

Example message:

```javascript
{
    "type": "atis",
    "value": {
        "networkConnectionStatus": "Connected",
        "station": "KPDX",
        "atisType": "Combined",
        "atisLetter": "A",
        "metar": "METAR KPDX 310153Z 00000KT 10SM FEW027 BKN041 BKN065 07/04 A3038 RMK AO2 SLP285 T00720039",
        "wind": "00000KT",
        "altimeter": "A3038",
        "pressureUnit": "MercuryInch",
        "pressureValue": 3038,
        "isNewAtis": false
    }
}
```

## Incoming messages

The following messages can be sent to vATIS to trigger state changes or to request state information.

### `getAtis`

Requests the current ATIS for a specific station or all stations in the loaded profile. The response is
an [`atis`](#atis) message for each matching station.

The following value properties are supported:

| Property | Description | Type |
| atisType | The station type to return. Optional, if omitted defaults to `Combined`. Only supported when the `station` property is set. This enables requesting the specific `Departure` or `Arrival` ATIS for stations that publish separate ATIS information for arrivals and departures. | [atisType](#atistype) |
| station | The identifier of the station to get the ATIS for. Optional. If omitted the current ATIS for all stations in the loaded profile will be returned. | string |

Example message to request the ATIS for all stations in the current profile:

```javascript
{
    "type": "getAtis"
}
```

Example message to request the ATIS for a specific station that publishes a combined ATIS:

```javascript
{
    "type": "getAtis",
    "value": {
        "station": "KPDX"
    }
}
```

Example message to request the departure ATIS for a specific station that publishes a split ATIS:

```javascript
{
    "type": "getAtis",
    "value": {
        "atisType": "Departure"
        "station": "KPDX",
    }
}
```

### `acknowledgeAtisUpdate`

Acknowledges the ATIS update for a specific station or all stations, clearing the `isNewAtis` flag
and turning off the flashing new ATIS letter in vATIS for the station(s).

The following value properties are supported:

| Property | Description | Type |
| atisType | The station type to acknowledge. Optional, if omitted defaults to `Combined`. Only supported when the `station` property is set. This enables acknowledging the specific `Departure` or `Arrival` ATIS for stations that publish separate ATIS information for arrivals and departures. | [atisType](#atistype) |
| station | The identifier of the station to acknowledge. Optional. If omitted all stations in the loaded profile will have the new ATIS acknowledged. | string |

Example message to acknowledge the ATIS update for all stations in the current profile:

```javascript
{
    "type": "acknowledgeAtisUpdate"
}
```

Example message to acknowledge the ATIS update for a specific station that publishes a combined ATIS:

```javascript
{
    "type": "acknowledgeAtisUpdate",
    "value": {
        "station": "KPDX"
    }
}
```

Example message to acknowledge the ATIS update for a specific station that publishes a split ATIS:

```javascript
{
    "type": "acknowledgeAtisUpdate",
    "value": {
        "atisType": "Departure"
        "station": "KPDX",
    }
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

### `PressureUnit`

Indicates the unit used for the pressure. Values are:

* `hPa`
* `MercuryInch`

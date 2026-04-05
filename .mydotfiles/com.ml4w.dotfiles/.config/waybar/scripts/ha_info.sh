#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

TEMP=$(hass-cli --no-headers --columns=STATE=state \
state get sensor.bedroom_temp_sensor_temperature | tr -d ' ')

HUM=$(hass-cli --no-headers --columns=STATE=state \
state get sensor.bedroom_temp_sensor_humidity | tr -d ' ')

#DOOR=$(hass-cli --no-headers --columns=STATE=state \
#state get binary_sensor.front_door | tr -d ' ')

TOOLTIP="Temp: ${TEMP}°C\rHumidity: ${HUM}%"

echo "{\"text\":\"\",\"tooltip\":\"$TOOLTIP\"}"


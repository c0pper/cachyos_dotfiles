#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

#hass-cli state get sensor.bedroom_temp_sensor_temperature | jq -r '.state'

hass-cli --no-headers --columns=STATE=state state get sensor.bedroom_temp_sensor_temperature


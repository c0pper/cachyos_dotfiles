#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

hass-cli service call homeassistant.toggle \
--arguments entity_id=input_boolean.ac_power

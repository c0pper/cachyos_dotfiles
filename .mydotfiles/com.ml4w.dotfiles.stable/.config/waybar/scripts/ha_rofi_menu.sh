#!/bin/bash
source ~/.config/waybar/scripts/ha_env.sh

# Get sensor info
TEMP=$(hass-cli --no-headers --columns=STATE=state state get sensor.bedroom_temp_sensor_temperature)
HUM=$(hass-cli --no-headers --columns=STATE=state state get sensor.bedroom_temp_sensor_humidity)

# Prepare menu items
MENU=$(printf "Temperature: %s°C\nHumidity: %s%%\nToggle Bedroom Light\nToggle Mood Light" "$TEMP" "$HUM")

# Show menu with rofi in dmenu mode
CHOICE=$(echo -e "$MENU" | rofi -dmenu -p "Home Assistant Info")

# Handle selection
case "$CHOICE" in
    "Toggle Bedroom Light")
        ~/.config/waybar/scripts/ceiling_light_bedroom_toggle.sh
        ;;
    "Toggle Mood Light")
        ~/.config/waybar/scripts/mood_lights_bedroom_toggle.sh
        ;;
#    *)
#        notify-send "Home Assistant" "$CHOICE"
#        ;;
esac


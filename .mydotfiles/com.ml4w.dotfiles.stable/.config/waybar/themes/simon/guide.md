Create a small env file and **source it in every script**.

This avoids exporting variables globally and keeps the token local to the Waybar scripts.

---

# 1. Create an environment file

`~/.config/waybar/scripts/ha_env.sh`

```bash
#!/bin/bash

export HASS_SERVER="https://homeassistant.local:8123"
export HASS_TOKEN="YOUR_LONG_LIVED_TOKEN"
```

Permissions (recommended):

```
chmod 600 ~/.config/waybar/scripts/ha_env.sh
```

---

# 2. Source it in every script

Example: temperature script

`ha_temp.sh`

```bash
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

hass-cli state get sensor.living_room_temperature | jq -r '.state'
```

Waybar config stays the same:

```json
"custom/ha-temp": {
  "exec": "~/.config/waybar/scripts/ha_temp.sh",
  "interval": 60,
  "format": "🌡 {}°C"
}
```

---

# 3. Example control script

Toggle light.

`light_toggle.sh`

```bash
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

hass-cli service call light.toggle entity_id=light.living_room
```

Waybar:

```json
"custom/ha-light": {
  "format": "💡",
  "on-click": "~/.config/waybar/scripts/light_toggle.sh"
}
```

---

# 4. Scene script

`scene_movie.sh`

```bash
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

hass-cli service call scene.turn_on entity_id=scene.movie
```

---

# 5. Cleaner helper (optional)

To avoid repeating the `source` logic in every script, create a wrapper.

`ha_exec.sh`

```bash
#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/ha_env.sh"

hass-cli "$@"
```

Then scripts become tiny:

```
ha_exec.sh service call light.toggle entity_id=light.living_room
```

or

```
ha_exec.sh state get sensor.living_room_temperature
```

---

# 6. Security note

Never make the env file world readable.

```
chmod 600 ha_env.sh
```

because it contains your Home Assistant token.

---

If you want, I can also show a **very clean Waybar setup where the icon changes color automatically depending on the Home Assistant state** (for example lights icon turns yellow if lights are on, grey if off). It looks much nicer in Hyprland bars.

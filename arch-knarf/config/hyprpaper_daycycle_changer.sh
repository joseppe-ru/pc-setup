#!/bin/bash

# initialize (make shure that Hyprland is running)
WAIT_UNTIL_SEK=10
ELAPSED=0

while [ $ELAPSED -lt $WAIT_UNTIL_SEK ] && [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; do
  sleep 1
  ELAPSED=$(($ELAPSED + 1))
done

if [ -z "$HYPRLAND_INSTANCE_SIGNATURE" ]; then
  exit 2
fi

BASE_DIR="/home/hyprjo/Pictures/Wallpapers"

# Eingebauter Test (nimmt Testzeit aus Argumenten Liste)
if [[ $# -eq 1 ]]; then
  HOUR=$(($1 % 24))
  TEST=1
else
  HOUR=$(date +%H)
  TEST=0
fi

# Dezimal convertion
HOUR=$((10#$HOUR))

if [ "$HOUR" -ge 5 ] && [ "$HOUR" -lt 6 ]; then
  FILE="1_dawn.jpg"
elif [ "$HOUR" -ge 6 ] && [ "$HOUR" -lt 8 ]; then
  FILE="2_sunrise.jpg"
elif [ "$HOUR" -ge 8 ] && [ "$HOUR" -lt 10 ]; then
  FILE="3_early_morning.jpg"
elif [ "$HOUR" -ge 10 ] && [ "$HOUR" -lt 12 ]; then
  FILE="4_day.jpg"
elif [ "$HOUR" -ge 12 ] && [ "$HOUR" -lt 16 ]; then
  FILE="5_golden_hour.jpg"
elif [ "$HOUR" -ge 16 ] && [ "$HOUR" -lt 20 ]; then
  FILE="6_sunset.jpg"
elif [ "$HOUR" -ge 20 ] && [ "$HOUR" -lt 22 ]; then
  FILE="7_dusk.jpg"
else
  FILE="0_night.jpg"
fi

PIC_PATH="$BASE_DIR/$FILE"

# Test aususwertung
if [[ "$TEST" -eq 1 ]]; then
  echo "-----Testergebnisse:-----"
  echo "===========|=============="
  echo "Stunde:    | $HOUR"
  echo "Bild:      | $FILE" | sed 's/\.jpg$//'
  echo "Bild-Pfad: | $PIC_PATH"
fi

hyprctl hyprpaper preload "$PIC_PATH"
hyprctl hyprpaper wallpaper "HDMI-A-1, $PIC_PATH"

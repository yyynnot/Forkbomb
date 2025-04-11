#!/bin/bash

# Fake System Crash Prank (GUI Only)
# Shows escalating warnings ending with "Just kidding!"

# Initial warning
zenity --warning \
  --title="⚠️ CRITICAL ERROR ⚠️" \
  --text="Virus detected: Trojan.53fnot.virus\nMemory corruption at 0x$RANDOM" \
  --width=400 &

sleep 2

# Fake scan with progress bar
(
  for i in {1..100}; do
    echo "$i"
    sleep 0.05
    if [ $i -eq 30 ]; then
      echo "# Found 127 infected files"
    elif [ $i -eq 70 ]; then
      echo "# SYSTEM COMPROMISED! Quarantine failing..."
    fi
  done
) | zenity --progress \
  --title="🚨 SYSTEM SCAN 🚨" \
  --text="Scanning for threats..." \
  --percentage=0 \
  --auto-close

# Final countdown
for i in {5..1}; do
  zenity --info \
    --title="⏳ SYSTEM FAILURE IN $i" \
    --text="<span size='xx-large'>$i</span>" \
    --width=300 \
    --timeout=1 &
  sleep 1
done

# "Crash" screen
zenity --error \
  --title="💀 DEVICE IS DESTROYED 💀" \
  --text="<span size='large'>CRITICAL_PROCESS_DIED\n\nJust kidding! 😊</span>" \
  --width=500 &

# Play error sound if available
if command -v paplay &>/dev/null; then
  paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga &
fi

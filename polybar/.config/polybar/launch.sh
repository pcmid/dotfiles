#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
for m in $(xrandr -q | grep "connected"  | awk '{print $1}')
do
    MONITOR=$m polybar --reload nord-modules &
done

echo "Bars launched..."

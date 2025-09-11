#!/usr/bin/env bash

# A Polybar ki-be kapcsoló szkriptje
# Ellenőrzi, hogy a Polybar fut-e, és vagy leállítja, vagy elindítja.

BAR_PID="/tmp/polybar.pid"

# Ellenőrizzük, hogy fut-e már a polybar
if pgrep -x polybar >/dev/null; then
    # Fut → leállítjuk és visszaállítjuk a paddingot
    killall -q polybar > /dev/null 2>&1
    rm -f "$BAR_PID"
    ratpoison -c "set padding 0 0 0 0"
    ratpoison -c "set border 0"
else
    # Nincs futásban → elindítjuk és beállítjuk a paddingot
    ratpoison -c "set padding 0 28 0 0"
    ratpoison -c "set border 3"
    polybar &
    echo $! > "$BAR_PID"
fi

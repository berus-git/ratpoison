#!/usr/bin/env bash

ratpoison -c 'set winfmt %g %n %t'
windows=$(ratpoison -c windows)
current_ws=$(ratpoison -c 'getenv wspl')
N=4
declare -A has_windows
while read -r line; do
  group=$(echo "$line" | awk '{print $1}')
  has_windows[$group]=1
done <<< "$windows"
for i in $(seq 1 $N); do
  group=$((i - 1))
  if [ "$i" = "$current_ws" ]; then
    echo -n "%{A1:rpws $i:}%{F#ffffff}%{B#777777} $i %{F-}%{B-}%{A}"
  else
    echo -n "%{A1:rpws $i:}%{F#777777}%{B#282a36} $i%{F-} %{A}"
  fi
done

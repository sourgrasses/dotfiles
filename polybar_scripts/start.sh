#!/usr/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g')
polybar jenn &

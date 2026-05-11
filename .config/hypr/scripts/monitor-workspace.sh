#!/usr/bin/env bash

n="$1"
action="${2:-focus}"
monitor_id=$(hyprctl activeworkspace -j | jq -r '.monitorID')
workspace=$(( monitor_id * 10 + n ))

if [[ "$action" == "move" ]]; then
	hyprctl dispatch movetoworkspace "${workspace}"
else
	hyprctl dispatch workspace "${workspace}"
fi

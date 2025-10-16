#!/bin/sh

echo "[$(date +%Y%m%d%H%M%S)] loaded ~/.xinitrc" >> ~/.mylog

[[ -f $HOME/.xprofile ]] && . "${HOME}/.xprofile"

exec dwm

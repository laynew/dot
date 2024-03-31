#!/bin/sh

. $HOME/.xprofile
[ -z "$(which autorefreshstatus)" ] &&  autorefreshstatus &
exec dwm


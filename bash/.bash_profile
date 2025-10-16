#
# ~/.bash_profile
#

echo "[$(date +%Y%m%d%H%M%S)] loaded ~/.bash_profile" >> ~/.mylog

[[ -f  ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

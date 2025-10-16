#
# ~/.profile
#

echo "[$(date +%Y%m%d%H%M%S)] loaded ~/.profile" >> ~/.mylog

#quit if not tty. ensures only loaded once in login shell
[[ ! $(tty) =~ '/dev/tty' ]] && echo "[$(date +%Y%m%d%H%M%S)] skip ~/.profile, not a tty" >> ~/.mylog && return

# Load and save ssh-agent config if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
	ssh_agent="$(ssh-agent -s)"
	echo "$ssh_agent" > "$HOME/.ssh-agent-env"
fi

[[ -f $HOME/.ssh-agent-env ]] && . "$HOME/.ssh-agent-env"

export EDITOR=vim

[[ -d $HOME/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"

[[ -d $HOME/.local/bin/status-bar ]] && export PATH="$HOME/.local/bin/status-bar:$PATH"


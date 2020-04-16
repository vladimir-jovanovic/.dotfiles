#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$HOME/.local/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export LC_ALL=en_US.UTF-8

# Default programs:
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
export FILE="f"
export PROGRAM_LAUNCHER="rofi -modi drun,run -show drun -show-icons"

export SUDO_ASKPASS="$HOME/.local/bin/askpass"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && XDG_VTNR -eq 1 ]]; then
	exec startx
fi


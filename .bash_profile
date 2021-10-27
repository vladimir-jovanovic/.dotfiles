#
# ~/.bash_profile
#

#[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$HOME/.local/bin:/usr/lib/jvm/java-8-openjdk/jre/bin/:$HOME/.config/rofi/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export LC_ALL=en_US.UTF-8

# Default programs:
export DESKTOP_SESSION="bspwm"
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
export PROGRAM_LAUNCHER="launcher_misc"
export COMMAND_LAUNCHER="launcher_text"
export POWERMENU="powermenu"

export SUDO_ASKPASS="$HOME/.local/bin/askpass"

#disable dotnet telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && XDG_VTNR -eq 1 ]]; then
	exec startx
fi


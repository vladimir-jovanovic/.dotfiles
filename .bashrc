#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\$ '
echo -ne "\033[5 q"

alias ls='ls --color=auto'
alias smloadr='smloadr -q "MP_320" -p ~/Music/ $1'
alias yttowav='youtube-dl -x --audio-format wav --audio-quality 0 $1'
alias poweroff='sudo poweroff $@'
alias suspend='sudo suspend $@'
alias reboot='sudo reboot $@'

# fff CD on exit script
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

#fff customization
export FFF_LS_COLORS=1
export FFF_CD_ON_EXIT=1		#enables CD on exit
export FFF_KEY_CHILD1=";"	#move to child dir
export FFF_KEY_PARENT1="l"	#move to parent dir
export FFF_MARK_FORMAT=" %f*"	#marked item string
export FFF_OPENER="xdg-open"	#file opener

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.config/rofi/bin:$PATH"


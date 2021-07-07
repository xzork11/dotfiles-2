[[ $- != *i* ]] && return

neofetch

autoload -U colors && colors	# Load colors

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000

export HISTFILE=~/.cache/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE


# ==============================================================================

# Prompt: SPACESHIP

SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    exec_time     # Execution time
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL="❭"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_DIR_PREFIX="in "
SPACESHIP_DIR_SUFFIX=" "
SPACESHIP_TIME_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_VI_MODE_SHOW=false

autoload -U promptinit; promptinit
prompt spaceship

# ===============================================================================

# TAB completion from Brodie
autoload -U compinit
zstyle ':completion:*' menu select
# Case insensitive auto-completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' gain-privileges 1

zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' special-dirs false

bindkey -v
export KEYTIMEOUT=1

# Edit line in vim buffer ctrl-v
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line
# Enter vim buffer from normal mode
autoload -U edit-command-line && zle -N edit-command-line && bindkey -M vicmd "^v" edit-command-line

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char


# Change cursor shape for different vi modes.
function zle-keymap-select {
    case $KEYMAP in
	vicmd) echo -ne '\e[1 q';;      # block
	viins|main) echo -ne '\e[5 q';; # beam
    esac
}

# ci", ci', ci`, di", etc
autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
    for c in {a,i}{\',\",\`}; do
	bindkey -M $m $c select-quoted
    done
done

# ci{, ci(, ci<, di{, etc
autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
	bindkey -M $m $c select-bracketed
    done
done

zle -N zle-keymap-select
zle-line-init() {
zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# ================================================================================

#PLUGINS

export ZSH_PLUGINS_DIR=/home/akshettrj/.config/pluginsZsh

for customPlugin in $ZSH_PLUGINS_DIR/*
do
    source "$customPlugin/main.zsh"
done


# =================================================================================
# GENERAL SHELL CONFIGS

export SHELL_CONFIG_DIR=~/.config/shellconfig

for customConfig in $SHELL_CONFIG_DIR/*
do
    source "$customConfig"
done


# ================================================================================

# Some Key bindings
bindkey '^R' history-incremental-pattern-search-backward
bindkey -s '^s' " fixcur\n keyboardFix\nfix_wacom\n"
bindkey -s '^l' " clear\n"
bindkey -s '^f' " fzf\n"
WORDCHARS=''

# Directories Hack
setopt auto_cd

stty stop undef		# Disable ctrl-s to freeze terminal.
setopt COMPLETE_ALIASES


# Change directories using lf (file manager)
lfcd() {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
	dir="$(cat "$tmp")"
	rm -f "$tmp" >/dev/null
	[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

#================================================

for Dir in /home/akshettrj/.scripts/*
do
    export PATH=$PATH:$Dir
done

/home/akshettrj/.scripts/sound/updatePulseAudioSink 2>/dev/null

# Directly starts the X-server upon login on tty1

if [[ "$(tty)" = "/dev/tty1" ]]; then
    clear
    # echo "Select your Window Manager/Desktop Environment"
    # echo "1. bspwm"
    # echo "2. csgo"
    # read "choice?Enter your choice: "
    # if [[ "$choice" = "2" ]]; then
	# pgrep bspwm || startx $HOME/.config/X11/Xinitrc_bspwm_csgo
    # else
    pgrep bspwm || startx $HOME/.config/X11/Xinitrc_bspwm
    # fi
fi

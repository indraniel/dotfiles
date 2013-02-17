# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# gvim alias
# (http://askubuntu.com/questions/132977/how-to-get-global-application-menu-for-gvim)
alias gvim='UBUNTU_MENUPROXY= gvim'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# new $PS1 prompt approach (2006-12-13)
# Taken from "http://www.linuxquestions.org/questions/showthread.php?t=449425"

# Color Variables for Prompt
GRAD1='\333\262\261\260'
GRAD2='\260\261\262\333'
YLOBRN='\[\033[01;33;43m\]'
WHTBRN='\[\033[01;37;43m\]'
REDBRN='\[\033[01;31;43m\]'
BLUBRN='\[\033[01;34;43m\]'
GRNBRN='\[\033[00;32;43m\]'
REDBLK='\[\033[00;31;40m\]'
PPLBLK='\[\033[01;35;40m\]'
WHTBLK='\[\033[01;37;40m\]'
NONE='\[\033[00m\]'
HBLK='\[\033[00;30;30m\]'
HBLU='\[\033[01;34;34m\]'

BLU='\[\033[01;34m\]'
YEL='\[\033[01;33m\]'
WHT='\[\033[01;37m\]'
PRPL='\[\033[00;35m\]'
RED='\[\033[01;31m\]'
GRN='\[\033[01;32m\]'
GRAY='\[\033[01;30m\]'
PINK='\[\033[01;35m\]'
NORM='\[\033[01;00;0m\]'
CYAN='\[\033[01;36m\]'


export GRAD1 GRAD2 YLOBRN WHTBRN REDBRN GRNBRN REDBLK PPLBLK WHTBLK NONE HBLU BLU YEL WHT PRPL RED GRN GRAY NORM CYAN BLUBRN HBLK PINK


#PS1="$CYAN[\s]$YEL[\t] $GRN\u$YEL@$BLU\h $WHT[\w]\$$NONE $NORM" 
#PS1="$CYAN[\t]$GRN\u$BLU@$BLU\h $RED[\w]$NORM\$ " 
PS1="$CYAN\!:$GRN\u$BLU@$BLU\h $RED[\w]$NORM\$ "

# enable the less command to display colors
LESS="-eiMXR"
export LESS

# set the window title
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'

#export PATH=/home/me/udacity/cs253/google/google_appengine:/home/me/epd_free-7.3-2-rh5-x86/bin:$PATH
export PATH=/home/me/udacity/cs253/google/google_appengine:$PATH

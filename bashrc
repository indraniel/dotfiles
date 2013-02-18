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

# enable branch notification niceties on the prompt
if [ -f /usr/share/git-core/contrib/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/git-prompt.sh
elif [ -f /opt/local/share/git-core/git-prompt.sh ]; then
    source /opt/local/share/git-core/git-prompt.sh
elif [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
else
fi

# setup the prompt
if [ "$color_prompt" = yes ]; then
    PS1='╭─\[$(tput -T xterm sgr0)\]( \[$(tput -T xterm setaf 4)\]\w\[$(tput -T xterm setaf 1)\]$(__git_ps1 " (%s)")\[$(tput -T xterm sgr0)\] as \[$(tput -T xterm setaf 2)\]\u\[$(tput -T xterm sgr0)\] at \[$(tput -T xterm setaf 6)\]\h\[$(tput -T xterm sgr0)\] )
    ╰─\[$(tput -T xterm bold)\]\[$(tput -T xterm setaf 1)\]$\[$(tput -T xterm sgr0)\] '
else
    PS1='\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable the less command to display colors
LESS="-eiMXR"
export LESS

# set the window title
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/$HOME/~}\007"'

# customize the PATH
export PATH=/home/me/udacity/cs253/google/google_appengine:$PATH

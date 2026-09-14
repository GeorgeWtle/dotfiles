# ~/.bashrc: executed by bash(1) for non-login shells.
# Squelette (/etc/skel/.bashrc) mis a jour par PUPPET
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
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
    alias ls='ls --color=auto -p'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='/bin/ls -l --color=auto'
alias la='ls -A'
alias l='ls -CF'
alias vi='/bin/vim -X'
alias vim='/bin/vim -X'
alias rvim='/bin/rvim -X'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Things I added with Pascal when comming to LOCEAN
########################################################################################
export LOGSPIRIT=gwhittle # global variable
export LOGLOCEAN=gwhittle # global variable

export SPIRIT1="${LOGSPIRIT}@spirit1.ipsl.fr:/home/${LOGSPIRIT}"
export SPIRIT2="${LOGSPIRIT}@spirit2.ipsl.fr:/home/${LOGSPIRIT}"

export SPIRITX1="${LOGSPIRIT}@spiritx1.ipsl.fr:/home/${LOGSPIRIT}"
export SPIRITX2="${LOGSPIRIT}@spiritx2.ipsl.fr:/home/${LOGSPIRIT}"
#
export LSTORE="/net/pyxis/data/varclim/${LOGLOCEAN}"
#
export SSCRATCH="/scratchu/${LOGSPIRIT}"
export SSTORE="/data/${LOGSPIRIT}"

###################################
# Parallel processing with OpenMP #
###################################
#
# Change stacksize limit to avoid core dump with fortran programs
#
ulimit -s unlimited
#
# Set number of threads for OMP parallel programs
#
export OMP_NUM_THREADS=2
#
# Change stacksize of threads for OMP parallel programs
#
export OMP_STACKSIZE=100M
#
# Allow/disable nested parallelism
#
unset OMP_NESTED
#export OMP_NESTED=FALSE
export OMP_MAX_ACTIVE_LEVELS=1
#

alias h='history'
alias ferm='chmod 755'
alias ouvr='chmod 777'
alias w+='chmod go+w'
alias w-='chmod go-w'
alias x-='chmod -x'
alias x+='chmod +x'
alias r+='chmod go+r'
alias r-='chmod go-r'
#
alias cw="cd $LSTORE"
alias ct="cd $LSTORE"
alias cs="cd $LSTORE"
#
#
# Basic FTP commands
alias fcerbere="sftp cerbere"
alias fdepotweb="sftp depotweb"
alias fcallisto="sftp callisto"
alias fnemesis="sftp nemesis"
alias fzeus="sftp zeus"

alias fspirit1="sftp spirit1"
alias fspirit2="sftp spirit2"
alias fspiritx1="sftp spiritx1"
alias fspiritx2="sftp spiritx2"
#

# My personnal options (GEORGE)
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/bin/bin:$PATH"

GHOME='home/gwhittle'
GDATA='data/gwhittle'
GSCRA='scratchu/gwhittle'

alias vi='nvim'
alias l='ls -l --color=auto -p'
alias cl='clear'
alias qs='squeue -a|grep whittle'
alias cdphd='cd ~/Documents/phd_repo'
alias checksave='ls /svH/'
alias go='du -h | sort -h'
alias pdfspirit1='scp gwhittle@spirit1.ipsl.fr:/home/gwhittle/myscripts/phd/pdf/* ~/Documents/my_phd_repo/pdf/'
alias jp='jupyter-notebook'
alias nvim-ks='NVIM_APPNAME="nvim-kickstart" nvim'
alias uproxy='unset http_proxy && unset https_proxy && unset GIT_SSL_CAINFO && echo "Proxy disabled."'
uproxy
alias bashrcc='nvim ~/.bashrc'
alias bashrcs='source ~/.bashrc'
# alias nvimc='(cd ~/.config/nvim && nvim init.lua)'
alias nvimc='(cd ~/dotfiles/.config/nvim && nvim init.lua)'
alias tmuxc='nvim ~/.config/tmux/tmux.conf'
alias treec="tree | xsel --clipboard --input"
alias dea='deactivate'
alias viphd='cdphd && avenv && vi .'

# CDO
timespan () {
  cdo showtimestamp $1 | tr ' ' '\n' | sed '/^$/d' | awk 'NR==1{first=$0} {last=$0} END{print "From:", first; print "To:  ", last}'
}
# TMUX
# alias px='tmux new -A -s main'
# if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
#     px
# fi

px() {
    if tmux has-session -t main 2>/dev/null; then
	tmux send-keys -t main:pxpret1out 'clear; ls' C-m
        tmux select-window -t main:pxpret1out
        tmux attach -t main
	#        tmux attach -t main
	# tmux select-window -t main:pxpret1out 'clear; ls; exec bash'
    else
        tmux new-session -d -s main -n pxpret1out
        tmux new-window -t main -n spirit1 'ssh -Y gwhittle@spirit1.ipsl.fr; exec bash'
	tmux select-window -t main:pxpret1out
        tmux attach -t main
    fi
}

# if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
#     px
# fi

# SSH - for connection to remote servers
# Meteo-France
alias amacs='ssh -l whittleg sxamacs' # connect to sxamacs server
# IPSL
alias spirit1='ssh -Y gwhittle@spirit1.ipsl.fr' # connect to spirit server
alias spirit2='ssh -Y gwhittle@spirit2.ipsl.fr' # connect to spirit server
alias spiritX1='ssh -Y gwhittle@spiritx1.ipsl.fr' # connect to spirit X server
# LOCEAN
alias cerbere='ssh gwhittle@cerbere' # connect to cerbere server
alias rcallisto="ssh -Y callisto"
alias rnemesis="ssh -Y nemesis"
alias rzeus="ssh -Y zeus"
# CCSR
alias climate7="ssh -Y george.whittle@climate7.aori.u-tokyo.ac.jp"
alias climatea="ssh -Y george.whittle@climatea.aori.u-tokyo.ac.jp"

fs1 () {
  mkdir -p "$(dirname "$2")"
  scp -r "gwhittle@spirit1.ipsl.fr:$1" "$2"	
}

ts1 () {
  scp -r "$1" "gwhittle@spirit1.ipsl.fr:$2"
}

avenv () {
  source .venv/bin/activate
}

cx () {
  cd "$@" && ls;
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

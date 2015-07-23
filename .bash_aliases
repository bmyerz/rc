# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

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

# assume these work on MacOSX
if [[ "$(uname)" == "Darwin" ]]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi




# my stuff
#alias a='screen -e^aA -dR'
#alias a='screen -dR'
alias vif='$HOME/utilities/vimfour.sh'
alias gsh='$HOME/utilities/gitstatustop.sh'
alias dis='$HOME/utilities/disasm.sh'
alias vi='vim'
alias lsc='ls *.c *.cpp *.h *.hpp'
alias ls='ls -G' # color
alias s3='sqlite3'
alias tmux='tmux -2'
alias a='tmux attach'
alias diff='colordiff'
# have less obey color escapes
alias less='less -R'
# if ... screen size change tmux -2 attach -d,  which detaches others
alias rm='rm -i'




# python
alias autopep8='autopep8 --in-place'

# extended regular expressions
alias sed='sed -E'
alias grep='egrep'


# Mac text editors
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias macvim=/Applications/MacVim.app/Contents/MacOS/MacVim


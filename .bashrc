# Use z.sh
. ~/z.sh

# Vim mode in bash
set -o vi

# Find and replace text in multiple files,
# honor gitignore.
# Usage: kae oldPattern newPattern
kae ()
{
  git grep --name-only $1 | xargs sed -i "s/$1/$2/"
}

alias ~='cd ~'
alias gst='git status'

# Change Prompt
export PS1="____________________________________________________________\n| \[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\] @ \[\033[1;35m\]\w\[\033[0m\]\n| 🐡 💨  "
export PS2="| 🐡 💨  "

# MAKE TERMINAL BETTER
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'

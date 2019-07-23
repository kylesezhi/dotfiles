# Vim mode in bash
set -o vi

# Find and replace text in multiple files,
# honor gitignore.
# Usage: kae oldPattern newText
kae () { git grep --name-only $1 | xargs sed -i "s/$1/$2/"; }

# Change Prompt
emoji="| ⭐  "
export PS1="____________________________________________________________\n| \[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\] @ \[\033[1;35m\]\w\[\033[0m\]\n$emoji"
export PS2="$emoji"

# MAKE TERMINAL BETTER
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias ~='cd ~'
alias gst='git status'
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd: Makes new Dir and jumps inside

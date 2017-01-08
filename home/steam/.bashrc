# configure PS1 command prompt
PS1="\e[0;32m\]\u@\h \w >\e[0m\] "

# no double entries in the shell history
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# do not overwrite files when redirecting output by default.
set -o noclobber

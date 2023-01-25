# Add ~/.bin to the front of the PATH.
export PATH="${HOME}/.bin:${PATH}"

# Use Vim as the default editor.
export EDITOR="nvim"

# Use US English as the default language for internationalized programs.
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Omit duplicate commands from the history file.
export HISTCONTROL=ignoredups

# Increase the maximum size of the history file to 16^4 entries.
export HISTSIZE="65536";
export HISTFILESIZE="${HISTSIZE}";

# Make ANSI colors easily available from other scripts and processes.
export COLOR_RESET=$(tput sgr0)
export COLOR_BLACK=$(tput setaf 0)
export COLOR_RED=$(tput setaf 1)
export COLOR_GREEN=$(tput setaf 2)
export COLOR_YELLOW=$(tput setaf 3)
export COLOR_BLUE=$(tput setaf 4)
export COLOR_MAGENTA=$(tput setaf 5)
export COLOR_CYAN=$(tput setaf 6)
export COLOR_WHITE=$(tput setaf 7)

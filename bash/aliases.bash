# Allow sudo to be used with aliases.
alias sudo="sudo "

if ls --color > /dev/null 2>&1
then
    colorflag="--color"
else
    colorflag="-G"
fi

# Always use color output when listing directory contents.
alias ls="ls ${colorflag}"

# List directory contents in long format.
alias la="ls -lA ${colorflag}"

# Prefer Neovim over Vim.
alias vim="nvim"

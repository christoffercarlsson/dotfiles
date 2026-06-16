# Show the current working directory and Git repository status in the prompt.
git_ps1_branch_name() {
    git symbolic-ref --quiet --short HEAD 2>/dev/null ||
        git rev-parse --short HEAD 2>/dev/null ||
        echo "[unknown]"
}

git_ps1_inside_work_tree() {
    [[ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]]
}

git_ps1_update_index() {
    git update-index --really-refresh -q &>/dev/null
}

git_ps1_staged_changes() {
    ! git diff --quiet --ignore-submodules --cached
}

git_ps1_stashed_files() {
    git rev-parse --verify refs/stash &>/dev/null
}

git_ps1_unstaged_changes() {
    ! git diff-files --quiet --ignore-submodules --
}

git_ps1_untracked_files() {
    [[ -n "$(git ls-files --others --exclude-standard)" ]]
}

git_ps1_status() {
    local s=""
    git_ps1_update_index
    git_ps1_staged_changes && s+="+"
    git_ps1_unstaged_changes && s+="*"
    git_ps1_stashed_files && s+='$'
    git_ps1_untracked_files && s+="%%"
    print -n -- "$s"
}

git_ps1() {
    git_ps1_inside_work_tree || return
    local s
    s=$(git_ps1_status)
    [[ -n "$s" ]] && s=" $s"
    print -n -- " ($(git_ps1_branch_name)$s)"
}

setopt PROMPT_SUBST

PROMPT='
%F{blue}%~%f%F{yellow}$(git_ps1)%f
> '
PROMPT2="> "

path=("$HOME/.bin" $path)

alias ls="ls --color"
alias la="ls -ahl"

[ -f ~/.zsh.local ] && source ~/.zsh.local

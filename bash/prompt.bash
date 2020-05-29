# Show the current working directory and Git repository status in the prompt.
# If connected via SSH, also show the current user and host name.
git_ps1_branch_name() {
  git symbolic-ref --quiet --short HEAD 2> /dev/null || \
  git rev-parse --short HEAD 2> /dev/null || \
  echo "[unknown]"
}

git_ps1_inside_work_tree() {
  [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]
}

git_ps1_update_index() {
  git update-index --really-refresh -q &> /dev/null
}

git_ps1_staged_changes() {
  ! git diff --quiet --ignore-submodules --cached
}

git_ps1_stashed_files() {
  git rev-parse --verify refs/stash &> /dev/null
}

git_ps1_unstaged_changes() {
  ! git diff-files --quiet --ignore-submodules --
}

git_ps1_untracked_files() {
  [ -n "$(git ls-files --others --exclude-standard)" ]
}

git_ps1_status() {
  local s=""
  if git_ps1_inside_work_tree
  then
    git_ps1_update_index
    if git_ps1_staged_changes
    then
      s="$s+";
    fi
    if git_ps1_unstaged_changes
    then
      s="$s*";
    fi
    if git_ps1_stashed_files
    then
      s="$s$";
    fi
    if git_ps1_untracked_files
    then
      s="$s%";
    fi
  fi
  echo "$s"
}

git_ps1() {
  local s=""
  if git_ps1_inside_work_tree
  then
    s=$(git_ps1_status)
    [ -n "$s" ] && s=" $s"
    printf "$1" "$(git_ps1_branch_name)$s"
  fi
}

export PS2="> "

PS1="\n"
if [[ "$SSH_TTY" ]]
then
  PS1+="$COLOR_GREEN\u@\h$COLOR_RESET: "
fi
PS1+="$COLOR_BLUE\$PWD$COLOR_RESET\$(git_ps1 ' ($COLOR_YELLOW%s$COLOR_RESET)')\n\$PS2"

export PS1

#!/usr/bin/env bash

DOTFILES_DIRECTORY="${HOME}/.dotfiles"
DOTFILES_REMOTE="https://github.com/christoffercarlsson/dotfiles.git"
DOTFILES_REMOTE_SSH="git@github.com:christoffercarlsson/dotfiles.git"

OS="$(uname)"

e_header() {
  printf "\n%s\n" "$@"
}

e_error() {
  printf "$(tput setaf 1)Error:$(tput sgr0) %s\n\n" "$@"
}

e_success() {
  printf "$(tput setaf 2)✓$(tput sgr0) %s\n\n" "$@"
}

e_done() {
  e_success "Done"
}

e_warning() {
  printf "$(tput setaf 3)Warning:$(tput sgr0) %s\n\n" "$@"
}

abort() {
  e_error "$@"
  exit 1
}

seek_confirmation() {
  printf "\n"
  e_warning "$@"
  read -p "Continue? (y/N) "
  printf "\n"
}

is_confirmed() {
  [[ "${REPLY}" =~ ^[Yy]$ ]]
}

is_macos() {
  [[ "${OS}" == "Darwin" ]]
}

cmd_exists() {
  command -v $1 &> /dev/null
}

check_os_requirements() {
  if ! cmd_exists "git"
  then
    abort "This script requires Git to be installed."
  fi
}

check_existing_dotfiles() {
  if [[ -d ${DOTFILES_DIRECTORY} ]]
  then
    seek_confirmation "This may overwrite your existing dotfiles."
    if ! is_confirmed
    then
      exit 0;
    fi
    rm -rf ${DOTFILES_DIRECTORY}
  fi
}

append_path() {
  cat "${DOTFILES_DIRECTORY}/${1}" >> "${HOME}/${2}"
}

copy_path() {
  cp -fR "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirror_path() {
  ln -nfs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

install_homebrew() {
  if is_macos
  then
    e_header "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    e_done
  fi
}

# Bash configuration
setup_bash() {
  mirror_path "bash/aliases.bash" ".bash_aliases"
  mirror_path "bash/exports.bash" ".bash_exports"
  mirror_path "bash/options.bash" ".bash_options"
  mirror_path "bash/prompt.bash"  ".bash_prompt"
  copy_path   "bash/profile.bash" ".bash_profile"
  source "${HOME}/.bash_profile"
}

# EditorConfig
setup_editorconfig() {
  mirror_path "editorconfig/editorconfig" ".editorconfig"
}

# Add scripts to the PATH
setup_scripts() {
  mirror_path "scripts" ".bin"
}

# Git configuration
setup_git() {
  mirror_path "git/gitattributes" ".gitattributes"
  mirror_path "git/gitconfig"     ".gitconfig"
  mirror_path "git/gitignore"     ".gitignore"
}

# GnuPG configuration
setup_gpg() {
  append_path "gpg/gpg-profile.bash" ".bash_profile"
  copy_path   "gpg/gpg-agent.conf"   ".gnupg/gpg-agent.conf"
  echo "pinentry-program $(command -v pinentry)" >> "${HOME}/.gnupg/gpg-agent.conf"
}

# NPM configuration
setup_npm() {
  mirror_path "npm/npmrc" ".npmrc"
}

# Neovim configuration
setup_neovim() {
  mirror_path "neovim" ".config/nvim"
}

# Tmux configuration
setup_tmux() {
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm" --depth 1
  mirror_path "tmux/tmux.conf" ".tmux.conf"
}

# iTerm2 configuration
setup_iterm2() {
  copy_path "iterm2/com.googlecode.iterm2.plist" "Library/Preferences/com.googlecode.iterm2.plist"
}

update_homebrew() {
  e_header "Updating Homebrew..."
  brew update --force &> /dev/null
  # Opt-out of Homebrew analytics
  brew analytics off &> /dev/null
  e_done
}

install_apps() {
  e_header "Installing apps..."
  mirror_path "homebrew/Brewfile" ".Brewfile"
  brew bundle install --global --cleanup --no-lock
  e_done
}

setup_apps() {
  if cmd_exists "brew"
  then
    update_homebrew
    if is_macos
    then
      install_apps
      setup_iterm2
    fi
  fi
}

download_dotfiles() {
  e_header "Downloading dotfiles..."
  git clone --recurse-submodules ${DOTFILES_REMOTE} ${DOTFILES_DIRECTORY} &> /dev/null
  e_done
}

setup_config() {
  e_header "Configuring dotfiles..."
  setup_bash
  setup_editorconfig
  setup_git
  setup_gpg
  setup_npm
  setup_scripts
  setup_neovim
  setup_tmux
  e_done
}

install_starship() {
  e_header "Installing Starship..."
  curl -sS https://starship.rs/install.sh | sh
  e_done
}

install_nvm() {
  e_header "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  e_done
}

update_git_remote_url() {
  (cd ${DOTFILES_DIRECTORY}; git remote set-url origin ${DOTFILES_REMOTE_SSH})
}

install_dotfiles() {
  check_os_requirements
  check_existing_dotfiles
  install_homebrew
  download_dotfiles
  setup_config
  setup_apps
  install_starship
  install_nvm
  update_git_remote_url
  e_success "Restart your terminal for the changes to take effect"
}

install_dotfiles

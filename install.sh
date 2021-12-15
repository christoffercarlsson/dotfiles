#!/usr/bin/env bash

DOTFILES_DIRECTORY="${HOME}/.dotfiles"
DOTFILES_REMOTE="https://github.com/christoffercarlsson/dotfiles.git"

OS="$(uname)"

e_header() {
  printf "\n%s\n" "$@"
}

e_error() {
  printf "$(tput setaf 1)Error:$(tput sgr0) %s\n" "$@"
}

e_success() {
  printf "$(tput setaf 2)✓$(tput sgr0) %s\n" "$@"
}

e_done() {
  e_success "Done"
}

e_warning() {
  printf "$(tput setaf 3)Warning:$(tput sgr0) %s\n" "$@"
}

abort() {
  e_error "$@"
  exit 1
}

seek_confirmation() {
  printf "\n"
  e_warning "$@"
  read -p "Continue? (y/n) " -n 1
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
  if is_macos 
  then
    # Add Homebrew's executable directory to the front of the PATH.
    PATH="/usr/local/bin:/opt/homebrew/bin:${PATH}"
    if ! cmd_exists "brew"
    then
      abort "This script requires Homebrew to be installed."
    fi
  fi
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

copy_path() {
  cp -fR "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

mirror_path() {
  ln -Fhfs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

# Bash configuration
setup_bash() {
  mirror_path "bash/aliases.bash"       ".bash_aliases"
  mirror_path "bash/bashrc.bash"        ".bashrc"
  mirror_path "bash/exports.bash"       ".bash_exports"
  mirror_path "bash/options.bash"       ".bash_options"
  mirror_path "bash/profile.bash"       ".bash_profile"
  mirror_path "bash/prompt.bash"        ".bash_prompt"
  copy_path   "bash/profile-local.bash" ".bash_profile_local"
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

# Hyper configuration
setup_hyper() {
  mirror_path "hyper/hyper.js" ".hyper.js"
}

# NPM configuration
setup_npm() {
  mirror_path "npm/npmrc" ".npmrc"
}

# Vim configuration
setup_vim() {
  if ! [[ -d "${HOME}/.vim" ]]
  then
    mkdir "${HOME}/.vim"
  fi
  mirror_path "vim/bundle"         ".vim/bundle"
  mirror_path "vim/gvimrc.vim"     ".gvimrc"
  mirror_path "vim/nerdtreeignore" ".nerdtreeignore"
  mirror_path "vim/vimrc.vim"      ".vimrc"
}

update_homebrew() {
  e_header "Updating Homebrew..."
  brew update --force &> /dev/null
  # Opt-out of Homebrew analytics
  brew analytics off &> /dev/null
  e_done
}

install_apps() {
  e_header "Installing apps (your password may be required)..."
  mirror_path "macos/Brewfile" ".Brewfile"
  brew bundle install --global --cleanup --no-lock &> /dev/null
  e_done
}

setup_gpg_ssh() {
  local gnupg_home="${HOME}/.gnupg"
  if ! [[ -d ${gnupg_home} ]]
  then
    mkdir ${gnupg_home}
  fi
  copy_path "gpg/gpg-agent.conf" ".gnupg/gpg-agent.conf"
  echo "pinentry-program $(brew --prefix)/bin/pinentry-mac" >> "${gnupg_home}/gpg-agent.conf"
  cat "${DOTFILES_DIRECTORY}/gpg/gpg-profile.bash" >> "${HOME}/.bash_profile_local"
}

setup_macos() {
  update_homebrew
  install_apps
  setup_gpg_ssh
}

download_dotfiles() {
  e_header "Downloading dotfiles..."
  git clone --recurse-submodules ${DOTFILES_REMOTE} ${DOTFILES_DIRECTORY} &> /dev/null
  e_done
}

setup_config() {
  e_header "Configuring dotfiles..."
  setup_bash
  setup_scripts
  setup_editorconfig
  setup_hyper
  setup_npm
  setup_vim
  setup_git
  e_done
}

install_dotfiles() {
  check_os_requirements
  check_existing_dotfiles
  download_dotfiles
  setup_config
  if is_macos
  then
    setup_macos
  fi
  e_header "Dotfiles has been successfully installed! You may need to restart your system."
}

install_dotfiles

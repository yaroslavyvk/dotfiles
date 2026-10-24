#!/bin/bash
# Existing files and symlinks are moved to a private backup directory.
set -euo pipefail
profile_dir="$(cd -- "$(dirname -- "$0")" && pwd)"
if [[ ${1:-} != --apply || $# != 1 ]]; then
  echo "Usage: bash work-macos/install.sh --apply"
  echo "Links Zsh, Ghostty and Starship configs into HOME, backing up existing files."
  exit 1
fi
if [[ -n ${ZDOTDIR:-} && $ZDOTDIR != "$HOME" ]]; then
  echo "Existing ZDOTDIR: $ZDOTDIR"
  echo "Run with: env -u ZDOTDIR bash work-macos/install.sh --apply"
  echo "Remove any external ZDOTDIR override before opening a new shell."
  exit 1
fi
backup_dir="$HOME/.local/state/dotfiles-backups/$(date +%Y%m%d-%H%M%S)-$$"
mkdir -p "$backup_dir"
chmod 700 "$backup_dir"
link_config() {
  local source_path="$1" relative_path="$2" target_path="$HOME/$2"
  mkdir -p "$(dirname -- "$target_path")"
  if [[ -e $target_path || -L $target_path ]]; then
    mkdir -p "$backup_dir/$(dirname -- "$relative_path")"
    mv -- "$target_path" "$backup_dir/$relative_path"
  fi
  ln -s -- "$source_path" "$target_path"
  echo "Linked $target_path"
}
link_config "$profile_dir/zsh/.zshenv" .zshenv
link_config "$profile_dir/zsh/.zprofile" .zprofile
link_config "$profile_dir/zsh/.zshrc" .zshrc
link_config "$profile_dir/ghostty/config" .config/ghostty/config
link_config "$profile_dir/starship/starship.toml" .config/starship/starship.toml
link_config "$profile_dir/ghostty/config" "Library/Application Support/com.mitchellh.ghostty/config.ghostty"
echo "Backups: $backup_dir"
echo "Open a new Ghostty window to load the profile."

#!/bin/bash
# Explicit network/install step. Normal editor startup does not bootstrap plugins.
set -euo pipefail
profile_dir="$(cd -- "$(dirname -- "$0")" && pwd)"
if [[ -n ${XDG_CONFIG_HOME:-} && $XDG_CONFIG_HOME != "$HOME/.config" ]]; then
  echo "This installer expects the default XDG_CONFIG_HOME ($HOME/.config)." >&2
  exit 1
fi
if [[ -n ${NVIM_APPNAME:-} && $NVIM_APPNAME != nvim ]]; then
  echo "Unset NVIM_APPNAME before installing this profile." >&2
  exit 1
fi
if [[ $(cd "$HOME/.config/nvim" && pwd -P) != "$profile_dir/nvim" ]]; then
  echo "Apply work-macos/install.sh first; refusing to install into another Neovim config." >&2
  exit 1
fi
command -v nvim >/dev/null
command -v git >/dev/null
lazy_dir="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/lazy/lazy.nvim"
# Bootstrap revision matches lazy-lock.json.
lazy_commit=85c7ff3711b730b4030d03144f6db6375044ae82
if [[ ! -d $lazy_dir ]]; then
  git clone --filter=blob:none --no-checkout https://github.com/folke/lazy.nvim.git "$lazy_dir"
  git -C "$lazy_dir" fetch origin "$lazy_commit"
  git -C "$lazy_dir" checkout --detach "$lazy_commit"
fi
if [[ $(git -C "$lazy_dir" rev-parse HEAD 2>/dev/null || true) != "$lazy_commit" ]]; then
  if [[ -n $(git -C "$lazy_dir" status --porcelain) ]]; then
    echo "Existing lazy.nvim checkout has local changes; inspect it before continuing." >&2
    exit 1
  fi
  git -C "$lazy_dir" fetch origin "$lazy_commit"
  git -C "$lazy_dir" checkout --detach "$lazy_commit"
fi
NVIM_WORK_INSTALL=1 nvim --headless '+Lazy! restore' '+lua for n,p in pairs(require("lazy.core.config").plugins) do if not (vim.uv or vim.loop).fs_stat(p.dir) then vim.api.nvim_err_writeln("Missing plugin: " .. n); vim.cmd("cquit 1") end end' +qa
echo "Plugins installed. Open nvim and run :checkhealth."
echo "Optional parsers: :TSInstall bash c lua markdown markdown_inline python query vim vimdoc"

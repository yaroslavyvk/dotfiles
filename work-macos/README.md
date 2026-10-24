# Minimal macOS work terminal

Standalone profile: Ghostty (Catppuccin Mocha, MesloLGS Nerd Font Mono),
Starship, eza, Autojump, Zsh Git/Docker aliases and completions.
No Oh My Zsh, plugin manager, history sync or automatic tmux startup.
Git completion uses Zsh; Docker completion uses the installed Docker CLI.
Docker itself is not installed by this profile.

Starship uses the full personal Catppuccin Mocha configuration: OS, username,
directory, Git branch/status, Kubernetes context/namespace, Docker context, time
and a second prompt line. It contains no custom command modules. Kubernetes and
Docker information comes from the work machine's configuration; no personal
contexts or credentials are included. Context names will be visible on screen.
The Node.js/Python/Java module settings are preserved, but those modules are not
referenced by the prompt format, matching the original configuration.

## Install

Use your company-approved installation channel. The following assumes Homebrew
is already installed and permitted. Review the Brewfile and configs first.

```sh
git clone --branch feat/work-macos-terminal YOUR_REPOSITORY_URL dotfiles
cd dotfiles
brew bundle --file=work-macos/Brewfile
bash work-macos/install.sh --apply
bash work-macos/setup-nvim.sh
```

Keep the repository at this location: installed configs are symlinks to it.
The installer replaces seven target files/directories/symlinks and prints the backup path.
It does not install packages, start services, change the default shell, or migrate
personal history and credentials. Existing history remains local and unchanged.
It does not modify other startup files such as `.zlogin`: review those separately
if applying this profile to an existing environment.

If ZDOTDIR is already set, follow the installer's message and remove any external
override. The new `.zshenv` selects HOME for subsequent Zsh startup files.
Open a new Ghostty window after installation. If your default shell is not Zsh,
select it using your approved terminal/system settings.

## Commands

- `j name`: jump to a previously visited directory (Autojump learns as you cd).
- `ls`, `ll`, `la`, `lg`: eza listings; `command ls` uses the original command.
- `g`, `gs`, `gd`, `ga`, `gc`, `gl`, `gp`, `gco`: Git shortcuts.
- `d`, `dc`, `up`, `down`, `build`, `logs`: Docker/Compose shortcuts.
- Tab: completions; `..` / `...`: parent directories.

History is stored locally by Zsh. A leading space excludes a command from saved
history, but is not a substitute for keeping secrets out of command arguments.
Autojump also stores visited directory information locally.

## Updates and rollback

Review repository changes before pulling: configs load executable shell code.
The Brewfile lists package names, not immutable versions; use company-managed
versions and updates when reproducibility is required.

To roll back, remove only the symlinks created by this installer and move the
matching files from its printed backup directory to their original paths.
Files absent before installation have no backup. Keep the backup until verified.

## Neovim / AstroNvim work profile

Preserves Catppuccin Mocha, Space leader, personal buffer mappings (`th`, `tl`,
`tj`, `tk`, `td`), Neo-tree, Telescope, Leap, smart-splits, which-key, Gitsigns,
completion/snippets, scrolling and Helm file support. Uses AstroNvim's default
Heirline statusline instead of loading two competing statuslines.

The Brewfile installs Neovim, ripgrep, fd, Lua language server, Pyright, Ruff
and StyLua. Mason and its integrations, Discord Presence, DAP and neoconf are
disabled. Automatic format-on-save and session autosaving are disabled;
formatting and session saving remain available manually. Standard Neovim local
state (history, undo, swap) can still be written; this is not a no-persistence mode.

Run `setup-nvim.sh` explicitly after applying the profile. This downloads executable
plugin code from GitHub at revisions pinned from the personal lockfile. No security
audit of those revisions is implied. Regular startup does not bootstrap missing
plugins, check updates, download blink binaries or install external tools.
Lua matching is used for completion, avoiding blink's Rust binary download.
Project `.lazy.lua`, exrc/modelines and LuaRocks package installation are disabled.

Treesitter parser installation is explicit. In Neovim, after reviewing the list:

```vim
:TSInstall bash c lua markdown markdown_inline python query vim vimdoc
```

This downloads/builds parsers and may require Apple's Command Line Tools.
No parsers are copied from the personal machine. Until installed, ordinary syntax
highlighting is available but Treesitter features may be limited. Parser binaries
and brew package versions are not fixed by the plugin lockfile.

Check `:checkhealth`, `:LspInfo` (inside a Lua/Python file), `:Telescope find_files`
and `:Telescope live_grep`. Python diagnostics use Pyright/Ruff; formatting is
manual. No tests or project programs are automatically run by this profile.

### Optional Robot Framework

The existing personal Python virtualenv is deliberately not referenced. Obtain
`robotframework_ls` through your company's approved Python package source and
environment. Put its executable on PATH, or add the following to the work Zsh
config with the actual absolute path, then restart Neovim:

```sh
export ROBOTFRAMEWORK_LS="/absolute/path/to/approved/venv/bin/robotframework_ls"
```

The server is enabled only when this executable exists. The base Brewfile does
not install it: Robot Framework itself and its language server are different
packages. Helm syntax support also does not install or run Helm automatically.

### Controlled updates

The initial plugin revisions match the existing personal installation; they are
not a claim that every revision has the latest security fixes. Review changes,
update both commit overrides/lockfile together, test in isolation, then deploy.
The lazy.nvim bootstrap commit in `setup-nvim.sh` must match `lazy-lock.json`.
Do not use `:Lazy sync` as an unattended work-machine update mechanism.

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
```

Keep the repository at this location: installed configs are symlinks to it.
The installer replaces the six target files/symlinks and prints the backup path.
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

# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each top-level directory is a stow package mirroring the layout of `$HOME`:

```
dotfiles/
├── alacritty/.config/alacritty/   # Alacritty terminal config (Dracula Pro theme)
├── nvim/.config/nvim/             # Neovim config (git submodule)
└── tmux/.config/tmux/             # tmux config + sessionizer script
```

- **alacritty** — `alacritty.toml`, importing the Dracula Pro color scheme from `alacritty-master/`. Expects the `GeistMono Nerd Font`.
- **nvim** — pulled in as a git submodule from [nvim-config](https://github.com/ayrtonguttier/nvim-config).
- **tmux** — `tmux.conf` (vi keys, prefix `C-f`, mouse on, Tokyo Night status bar) and `sessionizer`, an `fzf`-based project switcher bound to `C-f`.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [fzf](https://github.com/junegunn/fzf) and [bat](https://github.com/sharkdp/bat) (used by the tmux sessionizer)
- A Nerd Font (e.g. GeistMono Nerd Font) for Alacritty

## Installation

```bash
git clone --recurse-submodules git@github.com:ayrtonguttier/dotfiles.git ~/personal/dotfiles
cd ~/personal/dotfiles

# symlink whichever packages you want into $HOME
stow alacritty
stow nvim
stow tmux
```

If you already cloned without `--recurse-submodules`, run:

```bash
git submodule update --init --recursive
```

To remove a package's symlinks:

```bash
stow -D <package>
```

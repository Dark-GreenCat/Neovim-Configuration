# Neovim Qt + Neovim Configuration

This is `nvim-qt` and `nvim` configuration created by `Dark-GreenCat`

> The default locations are:
> - Windows: `~\AppData\Local\nvim` (`%LOCALAPPDATA%\nvim`)

## 1. Setup Guide

### 1.1. Install Vim Plug

- Run `1_install_vim_plug.ps1` in Powershell
- Run `:PlugInstall` inside Neovim

### 1.2. Install binary executable tools

Telescope:

- `choco install fd`
- `choco install ripgrep`

Mason:

- Run `:Mason` and install `clangd`, `clang-format`

### 1.3. Modify plugins

vim-battery:

- In path file `battery.vim\autoload\battery.vim` replace the function `graph()` with:

```vim
function! battery#graph() abort
  let backend = battery#backend()
  let width = len(g:battery#graph_indicators)
  let index = float2nr(floor((backend.value / 100.0) * (width - 1)))
  return g:battery#graph_indicators[index]
endfunction
```

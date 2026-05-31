# Neovim Configuration

A clean, native Neovim configuration using `vim.pack` (built-in package manager, Neovim ≥ 0.12).

## Requirements

- **Neovim ≥ 0.12** (for `vim.pack`)
- **[Nerd Font](https://www.nerdfonts.com/)** — required for file icons in Oil and other UI elements (e.g. JetBrains Mono Nerd Font, FiraCode Nerd Font). Must be set as the font in your terminal emulator.

> 📖 See **[CHEATSHEET.md](CHEATSHEET.md)** for a full overview of keybindings.

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── nvim-pack-lock.json       # Plugin versions (lockfile)
├── README.md
├── lua/
│   ├── config/
│   │   ├── globals.lua       # Global variables (mapleader, etc.)
│   │   ├── options.lua       # Neovim options
│   │   ├── keymap.lua        # Custom keymaps
│   │   ├── autocmd.lua       # Custom autocommands
│   │   ├── lsp.lua           # LSP setup (Mason + vim.lsp.enable)
│   │   └── dap.lua           # DAP setup (nvim-dap + php-debug-adapter)
│   └── plugins/
│       ├── mason.lua         # Plugin declaration: Mason + LSP
│       ├── dap.lua           # Plugin declaration: nvim-dap + nvim-dap-ui + mason-nvim-dap
│       ├── nvim-treesitter.lua # Plugin declaration: Treesitter
│       ├── telescope.lua     # Plugin declaration: Telescope
│       ├── which-key.lua     # Plugin declaration: Which-key
│       ├── lualine.lua       # Plugin declaration: Statusline
│       ├── mini-icons.lua    # Plugin declaration: Icons
│       ├── oil.lua           # Plugin declaration: Oil file explorer
│       ├── render-markdown.lua # Plugin declaration: Markdown preview
│       └── tokyonight.lua    # Plugin declaration: Colorscheme
└── lsp/
    ├── lua_ls.lua            # Lua LSP configuration
    ├── phpactor.lua          # PHP LSP configuration
    └── rust_analyzer.lua     # Rust LSP configuration
```

## Plugins

| Plugin | Purpose |
|---|---|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indentation, code folding based on syntax tree |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Manages LSP server binaries |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between Mason and Neovim's native `vim.lsp` |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Predefined LSP server configurations |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility library (dependency for Telescope) |
| [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | FZF sorter for Telescope |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keybinding popup |
| [mini.icons](https://github.com/echasnovski/mini.icons) | Icon provider for file explorers and UI |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File explorer (edit filesystem as a buffer) |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) | Debug Adapter Protocol client |
| [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) | UI for nvim-dap (breakpoints, stack trace, watches) |
| [nvim-nio](https://github.com/nvim-neotest/nvim-nio) | Async IO library for Neovim (dependency for nvim-dap-ui) |
| [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) | Bridge between Mason and nvim-dap |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline with Git branch, diagnostics, file info |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Inline Markdown rendering in buffers |

## LSP Servers

The LSP configuration uses **Neovim's native LSP API** (`vim.lsp.config` / `vim.lsp.enable`, introduced in Neovim 0.11).

### Installation

LSP servers are automatically installed by **Mason** (controlled via `ensure_installed` in `lua/config/lsp.lua`).

### Current LSP Servers

| Server | Language | Config file |
|---|---|---|
| `lua_ls` | Lua | `lsp/lua_ls.lua` |
| `phpactor` | PHP | `lsp/phpactor.lua` |
| `rust_analyzer` | Rust | `lsp/rust_analyzer.lua` |

### Configuration

Each LSP server has its own file in `lsp/<name>.lua` that returns a table with the server configuration. It is enabled via `vim.lsp.enable("<name>")` in `lua/config/lsp.lua`. The `settings` in the file replace what would otherwise go in a `.luarc.json`.

Adding a new language:

1. Create a file `lsp/<server>.lua` (e.g. `lsp/rust_analyzer.lua`)
2. Add the server to `ensure_installed` in `lua/config/lsp.lua`
3. Add `vim.lsp.enable("<server>")` in `lua/config/lsp.lua`

### Example: rust-analyzer

```lua
-- lsp/rust_analyzer.lua
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
}
```

```lua
-- In lua/config/lsp.lua:
-- ensure_installed = { "lua_ls", "rust_analyzer" }
-- vim.lsp.enable("rust_analyzer")
```

## Debugging (PHP)

Debugging uses **nvim-dap** with **Xdebug** for PHP.

### Installation

1. **Xdebug** (PHP-side): Install and configure Xdebug on your system:
   ```bash
   # Via pecl
   pecl install xdebug
   # Or via apt
   sudo apt install php-xdebug
   ```
   Configure in `php.ini`:
   ```ini
   xdebug.mode=debug
   xdebug.start_with_request=yes
   xdebug.client_host=127.0.0.1
   xdebug.client_port=9003
   ```

2. **php-debug-adapter** is automatically installed by Mason via `ensure_installed` in `lua/config/dap.lua`.

### Usage

| Key | Action |
|---|---|
| `<F5>` | Start/continue debugging |
| `<F8>` | Step over |
| `<F7>` | Step into |
| `<S-F8>` | Step out |
| `<Leader>db` | Toggle breakpoint |
| `<Leader>dB` | Set conditional breakpoint |
| `<Leader>dc` | Run to cursor |
| `<Leader>dq` | Disconnect debugger |
| `<Leader>dQ` | Close debug adapter |

Start Xdebug (e.g. via browser/CLI with `XDEBUG_SESSION=1`), then press `<F5>` in Neovim to connect.

## Tree-sitter

`nvim-treesitter` provides syntax-based highlighting and indentation (better than Neovim's regex-based highlighting). Add new languages to `ensure_installed` in `lua/plugins/nvim-treesitter.lua`.

## Package Management

- **Add a plugin:** Call `vim.pack.add()` in a file under `lua/plugins/`
- **Update plugins:** Run `:lua vim.pack.update()` or uncomment the line in `init.lua`
- **Lockfile:** `nvim-pack-lock.json` pins plugin versions

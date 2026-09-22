# 🚀 Personal Neovim Configuration

A clean, modular, and high-performance Neovim configuration powered by [`lazy.nvim`](https://github.com/folke/lazy.nvim), featuring [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) with LazyVim-style keybindings, native Neovim 0.11+ LSP setup for TypeScript & Vue, and modern editing utilities.

---

## 📂 File Structure

```text
~/.config/nvim
├── init.lua                 # Main entry point (loads lua/config/lazy.lua)
├── lazy-lock.json           # Lockfile tracking exact plugin commit versions
├── README.md                # Configuration & Keybinding documentation
└── lua/
    ├── config/
    │   ├── lazy.lua         # lazy.nvim bootstrap, leader keys, & settings
    │   └── options.lua      # Editor options (relative numbers, etc.)
    └── plugins/
        ├── fzf-lua.lua      # fzf-lua fuzzy finder & LazyVim-like keybindings
        └── spec1.lua        # LSP, completion, UI, editing, & utility plugins
```

---

## ⚙️ Leader Keys

* **`<leader>`**: `Space` (`" "`)
* **`<localleader>`**: `\` (`"\\"`)

---

## ⌨️ Keybindings Cheatsheet

### 🔍 File & Buffer Pickers (`fzf-lua`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader><space>` | `n` | Find Files (Root Dir) | `FzfLua files` |
| `<leader>,` | `n` | Switch Buffer | `FzfLua buffers sort_mru=true sort_lastused=true` |
| `<leader>/` | `n` | Live Grep (Root Dir) | `FzfLua live_grep` |
| `<leader>:` | `n` | Command History | `FzfLua command_history` |
| `<leader>fb` | `n` | Buffers List | `FzfLua buffers` |
| `<leader>fc` | `n` | Find Neovim Config File | `FzfLua files (cwd = config)` |
| `<leader>ff` | `n` | Find Files (Root Dir) | `FzfLua files` |
| `<leader>fg` | `n` | Find Git Files | `FzfLua git_files` |
| `<leader>fr` | `n` | Recent Files (Oldfiles) | `FzfLua oldfiles` |

---

### 🔎 Search (`<leader>s`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>sg` | `n` | Grep / Live Grep | `FzfLua live_grep` |
| `<leader>sw` | `n` | Search Word under cursor | `FzfLua grep_cword` |
| `<leader>sw` | `v` | Search Visual Selection | `FzfLua grep_visual` |
| `<leader>sb` | `n` | Search Buffer Lines | `FzfLua lines` |
| `<leader>sc` | `n` | Search Command History | `FzfLua command_history` |
| `<leader>sC` | `n` | Search Commands | `FzfLua commands` |
| `<leader>sd` | `n` | Document Diagnostics | `FzfLua diagnostics_document` |
| `<leader>sD` | `n` | Workspace Diagnostics | `FzfLua diagnostics_workspace` |
| `<leader>ss` | `n` | Goto LSP Document Symbols | `FzfLua lsp_document_symbols` |
| `<leader>sS` | `n` | Goto LSP Workspace Symbols | `FzfLua lsp_live_workspace_symbols` |
| `<leader>sh` | `n` | Search Help Pages | `FzfLua help_tags` |
| `<leader>sH` | `n` | Search Highlight Groups | `FzfLua highlights` |
| `<leader>sj` | `n` | Search Jump List | `FzfLua jumps` |
| `<leader>sk` | `n` | Search Key Maps | `FzfLua keymaps` |
| `<leader>sl` | `n` | Search Location List | `FzfLua loclist` |
| `<leader>sm` | `n` | Search Marks | `FzfLua marks` |
| `<leader>sM` | `n` | Search Man Pages | `FzfLua manpages` |
| `<leader>sq` | `n` | Search Quickfix List | `FzfLua quickfix` |
| `<leader>sR` | `n` | Resume Last Picker | `FzfLua resume` |

---

### 🐙 Git Integration (`<leader>g`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>gc` | `n` | Git Commits | `FzfLua git_commits` |
| `<leader>gs` | `n` | Git Status | `FzfLua git_status` |
| `<leader>gb` | `n` | Git Branches | `FzfLua git_branches` |
| `<leader>gS` | `n` | Git Stash | `FzfLua git_stash` |

---

### 🎨 UI & Colorschemes

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>uC` | `n` | Colorschemes (Live Preview) | `FzfLua colorschemes` |

---

### ⚡ Inside the `fzf-lua` Modal Window

| Key | Action |
| :--- | :--- |
| `<Ctrl-q>` | Send all matching results to the Neovim Quickfix list |
| `<Ctrl-u>` / `<Ctrl-d>` | Scroll results list half-page up / down |
| `<Ctrl-f>` / `<Ctrl-b>` | Scroll preview window down / up |
| `<Ctrl-x>` | Quick jump to item |
| `<F1>` | Toggle interactive help menu for current picker |

---

### 🛠️ Editing & Utility Keybindings

| Keybinding | Mode | Plugin | Description |
| :--- | :---: | :--- | :--- |
| `J` | `n` | [`treesj`](https://github.com/Wansmer/treesj) | Toggle splitting / joining code blocks (functions, objects, arrays) |
| `<C-a>` | `n` | [`dial.nvim`](https://github.com/monaqa/dial.nvim) | Intelligent increment (numbers, booleans, dates, constants) |
| `<C-x>` | `n` | [`dial.nvim`](https://github.com/monaqa/dial.nvim) | Intelligent decrement |

---

## 🧩 Installed Plugins Overview

| Category | Plugin | Purpose |
| :--- | :--- | :--- |
| **Package Manager** | [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) | Fast, modern plugin management |
| **Fuzzy Finder** | [`ibhagwan/fzf-lua`](https://github.com/ibhagwan/fzf-lua) | Blazing fast search for files, grep, git, and symbols |
| **LSP** | [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) | Native Neovim LSP configurations |
| | [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim) | Package manager for LSP servers, DAP servers, linters, and formatters |
| | [`williamboman/mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between `mason.nvim` and `nvim-lspconfig` |
| **Autocompletion** | [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) | Extensible completion engine with buffer and LSP sources |
| **Code Editing** | [`Wansmer/treesj`](https://github.com/Wansmer/treesj) | Tree-sitter powered split/join for code structures |
| | [`monaqa/dial.nvim`](https://github.com/monaqa/dial.nvim) | Enhanced increment/decrement tool |
| **Notes & Docs** | [`nvim-neorg/neorg`](https://github.com/nvim-neorg/neorg) | Modern organization, note-taking, and task tracking tool (`.norg` files) |
| **UI & Icons** | [`folke/which-key.nvim`](https://github.com/folke/which-key.nvim) | Displays popup with available keybindings |
| | [`stevearc/dressing.nvim`](https://github.com/stevearc/dressing.nvim) | Improves default `vim.ui.input` and `vim.ui.select` |
| | [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) | Filetype icons |
| **Performance** | [`dstein64/vim-startuptime`](https://github.com/dstein64/vim-startuptime) | Measure and profile startup time (`:StartupTime`) |

---

## 🛠️ Language Server Protocol (LSP) Configuration

The configuration uses Neovim 0.11+ native LSP integration with automatic Mason installation:

* **TypeScript / JavaScript**: `ts_ls` (configured with `@vue/typescript-plugin` to enable full TypeScript support inside Vue single-file components)
* **Vue 3**: `vue_ls` (`@vue/language-server`)

To manage or install additional language servers:
```vim
:Mason
```

---

## 📋 System Requirements & Recommended Tools

For the best experience, the following external tools are recommended:

* **Ripgrep** (`rg`): Used for ultra-fast grep searches (`brew install ripgrep`)
* **FD** (`fd`): Fast alternative to `find` (`brew install fd`)
* **Nerd Font**: For icons in files and UI (e.g., *JetBrainsMono Nerd Font*)

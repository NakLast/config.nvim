# 💤 config.nvim

A modern, fast, and feature-rich Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/) and [lazy.nvim](https://github.com/folke/lazy.nvim). Configured for high-productivity development across Python, TypeScript/JavaScript, Go, .NET, Docker, SQL, and more.

---

## ✨ Features

- **⚡ Fast Startup & Lazy Loading**: Managed by [lazy.nvim](https://github.com/folke/lazy.nvim).
- **🎨 Aesthetics**: [Catppuccin](https://github.com/catppuccin/nvim) with transparent background support.
- **📁 Snacks Explorer & UI**: [snacks.nvim](https://github.com/folke/snacks.nvim) with a right-aligned file explorer and centered floating terminal.
- **💬 Quiet & Clean Notifications**: [noice.nvim](https://github.com/folke/noice.nvim) filtering duplicate/unhelpful LSP popups with bordered doc popups.
- **🧠 Full-Featured Language Support**:
  - **Python**: Pyright with automatic `.venv` root resolution, formatting with Black, and `venv-selector`.
  - **Web / Frontend**: TypeScript, Prettier, ESLint, Tailwind CSS, and OXC.
  - **Systems & Backend**: Go, .NET (OmniSharp extended LSP), Docker, SQL ([vim-dadbod](https://github.com/tpope/vim-dadbod) & UI).
  - **Markup & Config**: Markdown (live preview & rendered view), TOML, JSON with SchemaStore.
- **⏱️ Activity Tracking**: [vim-wakatime](https://github.com/wakatime/vim-wakatime) for automated coding metrics.
- **🤖 AI Integration**: Integrated Antigravity AI assistant keybindings.
- **📋 Enhanced Editing**: Yank history ([yanky.nvim](https://github.com/gbprod/yanky.nvim)), incremental rename ([inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)), and mini-hipatterns.

---

## 📋 Prerequisites

Before installing, ensure your environment has the following tools installed:

### 1. Core Requirements
- **Neovim** >= `0.10.0` (Recommended) or >= `0.9.0`
- **Git** >= `2.19.0`
- **A [Nerd Font](https://www.nerdfonts.com/)** (v3.0+) (e.g., *JetBrainsMono Nerd Font*, *FiraCode Nerd Font*)
- **C Compiler & Build Tools**: `gcc`, `clang`, or `build-essential` (needed for compiling Treesitter parsers)

### 2. Search & External Tools
- `ripgrep` (`rg`) - Fast file search and grep
- `fd` / `fdfind` - Fast directory traversal
- `lazygit` (optional, recommended for terminal git integration)

### 3. Language Runtimes & Package Managers
- **Node.js** >= `18.0.0` & `npm` (required for many Mason LSPs/formatters such as Prettier, ESLint, Pyright)
- **Python 3** & `pip` / `python3-venv` (for Python formatting and language servers)

---

### Package Manager Quick Install

#### Ubuntu / Debian
```bash
sudo apt update
sudo apt install -y neovim git ripgrep fd-find build-essential python3 python3-venv python3-pip nodejs npm

# Symlink fdfind to fd if needed:
mkdir -p ~/.local/bin
ln -sf $(which fdfind) ~/.local/bin/fd
```

#### Arch Linux
```bash
sudo pacman -S neovim git ripgrep fd base-devel python nodejs npm lazygit
```

#### macOS (Homebrew)
```bash
brew install neovim git ripgrep fd node python lazygit
```

---

## 🚀 Installation & Setup

### 1. Backup Existing Configuration (Recommended)

If you have an existing Neovim configuration, back it up along with its state and cache:

```bash
# Backup existing config and state directories
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### 2. Clone the Repository

Clone this repository to your Neovim configuration directory:

```bash
git clone https://github.com/NakLast/config.nvim.git ~/.config/nvim
```

### 3. Launch Neovim

```bash
nvim
```

On first launch:
1. `lazy.nvim` will automatically bootstrap and install all configured plugins.
2. Treesitter parsers will download and compile.
3. Mason will automatically install pre-configured language servers, linters, and formatters.

### 4. Verify Health

Once the initial installation finishes, run the health check:

```vim
:checkhealth
```

Resolve any missing dependencies reported by the health check.

---

## ⌨️ Custom Keybindings

In addition to standard [LazyVim keymaps](https://www.lazyvim.org/keymaps), this configuration includes the following custom bindings:

### Window Management & Splits
| Key | Mode | Description |
| --- | --- | --- |
| `ss` | Normal | Split window horizontally (`:split`) |
| `sv` | Normal | Split window vertically (`:vsplit`) |

### Buffer & Text Operations
| Key | Mode | Description |
| --- | --- | --- |
| `<C-a>` | Normal | Select all text in the current buffer (`gg<S-v>G`) |

### AI Assistant (Antigravity)
| Key | Mode | Description |
| --- | --- | --- |
| `<leader>ag` | Normal | Toggle Antigravity assistant panel |
| `<leader>aa` | Visual | Send current selection to Antigravity |
| `<Esc><Esc>` | Terminal | Exit terminal mode to normal mode |

### Navigation & Explorer (Snacks.nvim)
| Key | Mode | Description |
| --- | --- | --- |
| `<leader>e` | Normal | Toggle file explorer (docked right) |
| `<leader><space>` | Normal | Find files (Snacks picker) |
| `<leader>/` | Normal | Live Grep (Snacks picker) |

*(Note: Leader key is set to `<Space>`. Press `<leader>` and pause to view the interactive [which-key](https://github.com/folke/which-key.nvim) menu).*

---

## 📁 Repository Structure

```text
~/.config/nvim
├── init.lua                 # Entrypoint (bootstraps lazy.nvim)
├── lazyvim.json             # Enabled LazyVim extras and version info
├── lazy-lock.json           # Pinned plugin commits for reproducible setups
├── stylua.toml              # Lua code formatting configuration
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Custom autocommands (e.g. spellcheck on git/markdown)
    │   ├── keymaps.lua      # Custom key mappings (splits, select-all, etc.)
    │   ├── lazy.lua         # lazy.nvim setup, options, and color scheme defaults
    │   └── options.lua      # General vim options (undercurl terminal codes, etc.)
    └── plugins/
        ├── antigravity.lua  # Antigravity AI companion configuration
        ├── colorsheme.lua   # Catppuccin theme customization (transparency)
        ├── noice.lua        # UI notification filters and LSP borders
        ├── python.lua       # Pyright LSP and .venv environment config
        ├── ui.lua           # Snacks.nvim explorer and floating terminal setup
        └── wakatime.lua     # WakaTime automated coding metrics
```

---

## 🧩 Managing Plugins & Extras

### Managing Installed Plugins
- Open plugin manager: `:Lazy`
- Update all plugins: `:Lazy update`
- Clean unused plugins: `:Lazy clean`

### Enabling / Disabling Language Extras
LazyVim extras can be toggled interactively without modifying code:
- Open extras manager: `:LazyExtras`
- Navigate with `j`/`k` and press `x` to toggle extras on/off.

### Managing Language Servers & Tools (Mason)
- Open Mason UI: `:Mason`
- Update all tools: `:MasonUpdate`

---

## 🔧 Notes & Troubleshooting

- **Python Virtualenv**: Pyright is configured to automatically discover `.venv` at project root. Activate your virtualenv or create it as `.venv` in your project folder (`python3 -m venv .venv`).
- **Antigravity Plugin**: If using `lua/plugins/antigravity.lua`, verify that the path in `dir = "~/Documents/work/antigravity.nvim"` points to your local clone or repository.
- **Terminal Undercurl**: `lua/config/options.lua` defines undercurl escape codes (`&t_Cs` and `&t_Ce`). Make sure your terminal emulator (e.g., Kitty, WezTerm, Alacritty, Ghostty) supports undercurl for diagnostic underlines.
- **WakaTime API Key**: On first file save, `vim-wakatime` will prompt for your WakaTime API key if not already saved in `~/.wakatime.cfg`.

---

## 📄 License

This configuration is open-source. Feel free to fork and customize to your needs!

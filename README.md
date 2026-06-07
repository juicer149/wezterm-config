# wezterm

Minimal, modular WezTerm configuration.

WezTerm is treated as a rendering layer:

```text
OS / DPI
↓
WezTerm
↓
tmux
↓
shell
↓
editor
```

WezTerm owns rendering. Workflow belongs to tmux, the shell, and the editor.

---

## Structure

```text
wezterm/
├── wezterm.lua
├── appearance/
│   ├── init.lua
│   ├── config.lua
│   └── themes/
│       ├── registry.lua
│       ├── builtin.lua
│       └── custom.lua
├── fonts.lua
├── keys.lua
└── README.md
```

---

## Modules

### `wezterm.lua`

Entry point. Composition only.

```lua
local config = {}

local appearance = require "appearance.init"
local fonts      = require "fonts"
local keys       = require "keys"

appearance.apply(config)
fonts.apply(config)
keys.apply(config)

return config
```

### `appearance/`

Owns rendering policy and color themes.

```text
appearance/init.lua             public appearance API
appearance/config.lua           selected theme + rendering policy
appearance/themes/registry.lua  collects and applies themes
appearance/themes/builtin.lua   aliases for built-in WezTerm themes
appearance/themes/custom.lua    user-defined color schemes
```

Theme selection lives in:

```lua
-- appearance/config.lua
M.theme = "sepia_dim"
```

Available themes:

```text
light
dark
belafonte
birds
ciapre
sepia
sepia_dim
```

### `fonts.lua`

Owns typography:

```text
font family
font size
line height
glyph rendering
```

### `keys.lua`

Owns terminal-level keybindings.

It is intentionally minimal. Keybindings should live here only when they cannot be handled better by tmux, the shell, or the editor.

---

## Usage

Symlink this directory into WezTerm’s config path:

```bash
ln -s ~/dev/env/terminal/wezterm ~/.config/wezterm
```

Reload:

```bash
wezterm cli reload-configuration
```

or restart WezTerm.

---

## `bat`

Recommended `bat` config:

```text
--theme="ansi"
--style="numbers,changes"
```

Put it in:

```bash
~/.config/bat/config
```

This makes `bat` follow the WezTerm ANSI palette instead of applying an unrelated syntax theme.

---

## Principles

```text
wezterm.lua      composition
appearance/      rendering + colors
fonts.lua        typography
keys.lua         terminal keybindings
```

Keep WezTerm quiet and predictable.

No runtime theme switching.
No workflow management.
No tab/pane logic.
No project-specific behavior.

If complexity grows, move it to the layer that owns it:

```text
tmux      sessions, panes, multiplexing
shell     commands, aliases, environment
editor    editing, navigation, LSP
project   project-specific scripts
WezTerm   rendering
```

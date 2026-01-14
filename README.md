# wezterm-config

A minimal, modular WezTerm configuration designed for long-term use
in a tmux-centric development environment.

This repository treats the terminal emulator as a **rendering layer**,
not a workflow manager.

---

## Design philosophy

This configuration follows the same principles as the rest of my
development environment:

- **Explicit ownership**
- **One concern per file**
- **No hidden behavior**
- **No dynamic configuration**
- **Predictable over time**

WezTerm is responsible only for:

- window geometry
- text rendering
- font metrics
- terminal-level behavior

Everything else belongs elsewhere.

---

## Architectural position

```

Operating system / DPI
↓
WezTerm        ←── this repository
↓
tmux
↓
Shell (bash)
↓
Editor (Neovim)

```

WezTerm does **not**:
- manage tabs or multiplexing
- define workflow keybindings
- integrate with editors
- guess user intent

---

## File layout

```

wezterm-config/
├── wezterm.lua     # entry point / composition
├── appearance.lua  # window behavior & rendering policy
├── fonts.lua       # typography & text metrics
├── keys.lua        # terminal-level keybindings (currently empty)
├── .gitignore
└── README.md

```

### `wezterm.lua`
Composition only.  
No behavior, no policy.

### `appearance.lua`
Owns:
- initial window size (grid-based)
- cursor behavior
- scrollback
- rendering discipline
- tab bar policy

### `fonts.lua`
Owns:
- font family & fallback
- baseline font size
- line height
- glyph behavior

Font zoom is treated as **runtime state**, not configuration.

### `keys.lua`
Intentionally minimal.
Keybindings are added **only when real friction appears**.

---

## Usage

This repository is intended to be the **single source of truth**
for WezTerm configuration.

On systems where WezTerm runs natively:

```bash
ln -s ~/path/to/wezterm-config ~/.config/wezterm
```

On Windows + WSL setups, the Windows-side `wezterm.lua` may
delegate to this repository via `dofile`.

---

## Non-goals

This configuration intentionally avoids:

* themes
* plugin systems
* per-host conditionals
* dynamic behavior
* UI decoration

If complexity increases, it should move **down** (shell/editor)
or **up** (OS/terminal), not into this repo.

---

## Status

Stable core.
Expected to evolve slowly and deliberately.

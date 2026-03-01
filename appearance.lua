-- appearance.lua
-- ------------------------------------------------------------
-- Terminal rendering, window geometry, and UI policy.
--
-- This module owns *how the terminal window behaves visually*:
-- size, cursor, scrollback, bells, and rendering discipline.
--
-- It intentionally does NOT define:
--   - fonts or typography (fonts.lua)
--   - keybindings or interaction (keys.lua)
--   - workflow or multiplexing (tmux)
-- ------------------------------------------------------------

local M = {}

function M.apply(config)
  -- ----------------------------------------------------------
  -- Window geometry (grid-based, DPI-independent)
  --
  -- Use character cells rather than pixels so that:
  -- - tmux layouts remain stable
  -- - font size changes do not affect layout semantics
  -- ----------------------------------------------------------
  config.initial_cols = 120
  config.initial_rows = 34

  -- ----------------------------------------------------------
  -- Rendering discipline
  -- ----------------------------------------------------------

  -- Use theme background directly; avoid transparency tricks
  config.window_background_opacity = 0.95

  -- Explicit terminal identity (truecolor, modern capabilities)
  config.term = "wezterm"

  -- Bold text should remain semantic, not color-altering
  config.bold_brightens_ansi_colors = false

  -- ----------------------------------------------------------
  -- Cursor & selection
  -- ----------------------------------------------------------

  -- Stable, non-blinking cursor for reduced visual noise
  config.default_cursor_style = "SteadyBar"
  config.cursor_blink_rate = 0

  -- Explicit, calm selection colors
  config.colors = {
    cursor_bg     = "#c0c0c0",
    cursor_fg     = "#000000",
    selection_bg  = "#303030",
    selection_fg  = "#c0c0c0",
  }

  -- ----------------------------------------------------------
  -- History & layout stability
  -- ----------------------------------------------------------

  -- Bounded scrollback; tmux handles long-lived history
  config.scrollback_lines = 5000

  -- Do not resize the window when font size changes
  config.adjust_window_size_when_changing_font_size = false

  -- ----------------------------------------------------------
  -- Multiplexing policy
  -- ----------------------------------------------------------

  -- tmux owns windows and tabs; disable terminal tab bar
  config.enable_tab_bar = false

  -- ----------------------------------------------------------
  -- Bells & notifications
  -- ----------------------------------------------------------

  -- No audible or intrusive visual bells
  config.audible_bell = "Disabled"
  config.visual_bell = {
    fade_in_function  = "EaseIn",
    fade_out_function = "EaseOut",
    fade_in_duration_ms  = 75,
    fade_out_duration_ms = 75,
  }
end

return M

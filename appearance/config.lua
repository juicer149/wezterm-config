-- appearance/config.lua
-- ------------------------------------------------------------
-- Appearance configuration.
--
-- Owns general rendering policy and the selected theme.
-- Does not own color scheme data.
-- ------------------------------------------------------------

local M = {}

-- ------------------------------------------------------------
-- Theme selection
-- ------------------------------------------------------------
-- Change only this value.
--
-- Options:
--   "light"
--   "dark"       -- mörk blå/cyan
--   "belafonte"  -- brun/sepia, mörk
--   "birds"      -- vinröd
--   "ciapre"     -- mörk aubergine/lila
--   "sepia"      -- ljus sepia / parchment
--   "sepia_dim"  -- dämpad sepia, bättre terminal-läge

M.theme = "sepia_dim"

-- ------------------------------------------------------------
-- Apply
-- ------------------------------------------------------------

function M.apply(config)
  -- Geometry
  config.initial_cols = 120
  config.initial_rows = 34

  -- Rendering
  config.window_background_opacity = 1.0
  config.term = "xterm-256color"
  config.bold_brightens_ansi_colors = false

  -- Cursor
  config.default_cursor_style = "SteadyBar"
  config.cursor_blink_rate = 0

  -- Stability
  config.scrollback_lines = 5000
  config.adjust_window_size_when_changing_font_size = false

  -- Multiplexing
  config.enable_tab_bar = false

  -- Bells
  config.audible_bell = "Disabled"
end

return M

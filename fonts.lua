-- fonts.lua
-- ------------------------------------------------------------
-- Typography and text metrics.
-- Owns how text is rendered (not behavior).
-- ------------------------------------------------------------

local wezterm = require "wezterm"
local M = {}

-- ------------------------------------------------------------
-- Font (data)
-- ------------------------------------------------------------

local FONT = {
  family = "JetBrains Mono",
  size = 20.0,
  line_height = 1.15,
}

-- ------------------------------------------------------------
-- Apply
-- ------------------------------------------------------------

function M.apply(config)
  -- Font
  config.font = wezterm.font(FONT.family)
  config.font_size = FONT.size

  -- Metrics
  config.line_height = FONT.line_height

  -- Rendering stability (important for nvim UI)
  config.allow_square_glyphs_to_overflow_width = "Never"
end

return M

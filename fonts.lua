-- fonts.lua
-- ------------------------------------------------------------
-- Typography and text metrics.
--
-- This module owns *how text is rendered*:
-- font family, size, line height, and glyph behavior.
--
-- Zooming and scaling are treated as runtime state,
-- not configuration.
-- ------------------------------------------------------------

local wezterm = require "wezterm"
local M = {}

function M.apply(config)
  -- ----------------------------------------------------------
  -- Font selection
  -- ----------------------------------------------------------

  config.font = wezterm.font_with_fallback {
    {
      family = "JetBrains Mono",
      weight = "Regular",
      italic = false,
    },
    {
      family = "JetBrains Mono",
      weight = "Regular",
      italic = true,
    },
  }

  -- ----------------------------------------------------------
  -- Font metrics
  -- ----------------------------------------------------------

  -- Baseline font size.
  -- Temporary adjustment are done cia Wezterm zoom (CTRL+/-).
  config.font_size = 20.0

  -- Slightly relaxed line height for readability and code density
  config.line_height = 1.15

  -- Ensure box drawing and symbols behave predictably (nvim)
  config.allow_square_glyphs_to_overflow_width = "Never"
end

return M

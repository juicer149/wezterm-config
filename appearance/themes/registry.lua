-- appearance/themes/registry.lua
-- ------------------------------------------------------------
-- Theme registry and application.
--
-- Owns how built-in and custom theme definitions are collected,
-- registered, selected, and applied to the WezTerm config.
-- ------------------------------------------------------------

local M = {}

local builtin_themes = require "appearance.themes.builtin"
local custom_themes  = require "appearance.themes.custom"

-- ------------------------------------------------------------
-- Theme registry
-- ------------------------------------------------------------

local THEMES = {}

for name, theme in pairs(builtin_themes.themes) do
  THEMES[name] = theme
end

for name, theme in pairs(custom_themes.themes) do
  THEMES[name] = theme
end

-- ------------------------------------------------------------
-- Apply
-- ------------------------------------------------------------

function M.apply(config, theme_name)
  local theme = THEMES[theme_name]
  assert(theme, "Invalid theme: " .. tostring(theme_name))

  custom_themes.register(config)

  config.color_scheme = theme.scheme

  config.colors = {
    cursor_bg = theme.cursor.bg,
    cursor_fg = theme.cursor.fg,
    cursor_border = theme.cursor.bg,

    selection_bg = theme.selection.bg,
    selection_fg = theme.selection.fg,
  }

  config.set_environment_variables = config.set_environment_variables or {}

  config.set_environment_variables.BAT_THEME = theme.bat_theme or "ansi"

  config.set_environment_variables.WSLENV =
    "TERM:COLORTERM:TERM_PROGRAM:TERM_PROGRAM_VERSION:BAT_THEME"
end

return M

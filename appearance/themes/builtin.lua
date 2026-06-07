-- appearance/themes/builtin.lua
-- ------------------------------------------------------------
-- Built-in color scheme presets.
--
-- This file owns references to WezTerm built-in schemes
-- plus local cursor/selection and tool theme overrides.
-- Theme selection belongs in appearance/config.lua.
-- ------------------------------------------------------------

local M = {}

M.themes = {
  light = {
    scheme = "Builtin Solarized Light",
    bat_theme = "Solarized (light)",
    cursor = {
      bg = "#c0c0c0",
      fg = "#000000",
    },
    selection = {
      bg = "#303030",
      fg = "#c0c0c0",
    },
  },

  dark = {
    scheme = "Builtin Solarized Dark",
    bat_theme = "Solarized (dark)",
    cursor = {
      bg = "#c0c0c0",
      fg = "#000000",
    },
    selection = {
      bg = "#303030",
      fg = "#c0c0c0",
    },
  },

  belafonte = {
    scheme = "Belafonte Night",
    bat_theme = "ansi",
    cursor = {
      bg = "#c0c0c0",
      fg = "#000000",
    },
    selection = {
      bg = "#303030",
      fg = "#c0c0c0",
    },
  },

  birds = {
    scheme = "BirdsOfParadise",
    bat_theme = "ansi",
    cursor = {
      bg = "#c0c0c0",
      fg = "#000000",
    },
    selection = {
      bg = "#303030",
      fg = "#c0c0c0",
    },
  },

  ciapre = {
    scheme = "Ciapre",
    bat_theme = "ansi",
    cursor = {
      bg = "#c0c0c0",
      fg = "#000000",
    },
    selection = {
      bg = "#303030",
      fg = "#c0c0c0",
    },
  },
}

return M

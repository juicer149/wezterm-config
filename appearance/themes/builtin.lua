-- appearance/themes/builtin.lua
-- ------------------------------------------------------------
-- Built-in color scheme presets.
--
-- This file owns references to WezTerm built-in schemes
-- plus local cursor/selection overrides.
-- Theme selection belongs in appearance/config.lua.
-- ------------------------------------------------------------

local M = {}

M.themes = {
  light = {
    scheme = "Builtin Solarized Light",
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

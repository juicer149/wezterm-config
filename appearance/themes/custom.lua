-- appearance/themes/custom.lua
-- ------------------------------------------------------------
-- User-defined color schemes.
--
-- This file owns custom color scheme data only.
-- Theme selection belongs in appearance/config.lua.
-- ------------------------------------------------------------

local M = {}

M.schemes = {
  ["Sepia Forge"] = {
    foreground = "#4A3A2A",
    background = "#F4EAC8",

    cursor_bg = "#B97C46",
    cursor_fg = "#F4EAC8",
    cursor_border = "#B97C46",

    selection_fg = "#3A2A1D",
    selection_bg = "#D9BF82",

    scrollbar_thumb = "#C6A76A",
    split = "#CDB37A",

    ansi = {
      "#3A2A1D",
      "#9B4A3A",
      "#5F7A3A",
      "#B97C46",
      "#3F7180",
      "#7A5578",
      "#4F7A70",
      "#EAD9AD",
    },

    brights = {
      "#6B5640",
      "#B75E48",
      "#738F45",
      "#CF9353",
      "#538A9A",
      "#94648F",
      "#61978A",
      "#FFF4D0",
    },
  },

  ["Sepia Forge Dim"] = {
    foreground = "#3F3022",
    background = "#EAD9AD",

    cursor_bg = "#B97C46",
    cursor_fg = "#EAD9AD",
    cursor_border = "#B97C46",

    selection_fg = "#2E2117",
    selection_bg = "#CDA96F",

    scrollbar_thumb = "#B7955F",
    split = "#BFA16C",

    ansi = {
      "#2E2117",
      "#8F4538",
      "#586F35",
      "#B97C46",
      "#3B6774",
      "#704C70",
      "#4A7168",
      "#DCC795",
    },

    brights = {
      "#5A4632",
      "#AA5845",
      "#6D873F",
      "#CB8D50",
      "#4D7F8E",
      "#895D88",
      "#5C8B80",
      "#F2DFB2",
    },
  },
}

M.themes = {
  sepia = {
    scheme = "Sepia Forge",
    bat_theme = "ansi",
    cursor = {
      bg = "#B97C46",
      fg = "#F4EAC8",
    },
    selection = {
      bg = "#D9BF82",
      fg = "#3A2A1D",
    },
  },

  sepia_dim = {
    scheme = "Sepia Forge Dim",
    bat_theme = "ansi",
    cursor = {
      bg = "#B97C46",
      fg = "#EAD9AD",
    },
    selection = {
      bg = "#CDA96F",
      fg = "#2E2117",
    },
  },
}

function M.register(config)
  config.color_schemes = config.color_schemes or {}

  for name, scheme in pairs(M.schemes) do
    config.color_schemes[name] = scheme
  end
end

return M

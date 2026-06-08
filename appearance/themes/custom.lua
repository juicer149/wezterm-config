-- appearance/themes/custom.lua
-- ------------------------------------------------------------
-- User-defined color schemes.
--
-- This file owns custom color scheme data only.
-- Theme selection belongs in appearance/config.lua.
-- ------------------------------------------------------------

local M = {}

-- ------------------------------------------------------------
-- ANSI color order
-- ------------------------------------------------------------
-- WezTerm expects both `ansi` and `brights` in this fixed order:
--
--   1 black    -> SGR 30 / 90
--   2 red      -> SGR 31 / 91
--   3 green    -> SGR 32 / 92
--   4 yellow   -> SGR 33 / 93
--   5 blue     -> SGR 34 / 94
--   6 magenta  -> SGR 35 / 95
--   7 cyan     -> SGR 36 / 96
--   8 white    -> SGR 37 / 97
--
-- Sepia Forge Dim mirrors the Neovim sepia_forge palette:
--   black        primary ink
--   red          syntax structure / rust
--   green        functions / oxidized action accent
--   yellow       constants / dark brass
--   blue         types / blue-gray classification
--   magenta      rare subdued secondary accent
--   cyan slot    strings / warm olive-sepia
--   bright black comments / dim text
-- ------------------------------------------------------------

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
      "#3A2A1D", -- black
      "#9B4A3A", -- red
      "#5F7A3A", -- green
      "#B97C46", -- yellow
      "#3F7180", -- blue
      "#7A5578", -- magenta
      "#4F7A70", -- cyan
      "#EAD9AD", -- white
    },

    brights = {
      "#6B5640", -- bright black
      "#B75E48", -- bright red
      "#738F45", -- bright green
      "#CF9353", -- bright yellow
      "#538A9A", -- bright blue
      "#94648F", -- bright magenta
      "#61978A", -- bright cyan
      "#FFF4D0", -- bright white
    },
  },

  ["Sepia Forge Dim"] = {
    foreground = "#231910",
    background = "#E7D1B3",

    cursor_bg = "#8F5B34",
    cursor_fg = "#E7D1B3",
    cursor_border = "#8F5B34",

    selection_fg = "#231910",
    selection_bg = "#C9A783",

    scrollbar_thumb = "#8A735B",
    split = "#DEC8AD",

    ansi = {
      "#231910", -- black: primary ink / foreground
      "#8A2A22", -- red: syntax structure / rust
      "#465822", -- green: functions / oxidized action accent
      "#76491F", -- yellow: constants / dark brass
      "#4A5A67", -- blue: types / blue-gray classification
      "#6F4A64", -- magenta: subdued aubergine
      "#5A4B2B", -- cyan slot: strings / warm olive-sepia
      "#E7D1B3", -- white: paper background
    },

    brights = {
      "#60625B", -- bright black: comments / dim text
      "#9A2A22", -- bright red: diagnostics / stronger rust
      "#53602F", -- bright green: stronger oxid function accent
      "#8F5B34", -- bright yellow: builtins / burnt orange
      "#5D6A76", -- bright blue: stronger blue-gray
      "#805A75", -- bright magenta: muted purple
      "#7A4E24", -- bright cyan slot: constants / warm brass fallback
      "#F2DEC2", -- bright white: soft paper highlight
    },
  },

  ["Sepia Forge Dark"] = {
    foreground = "#D8C4A0",
    background = "#211811",

    cursor_bg = "#B97C46",
    cursor_fg = "#211811",
    cursor_border = "#B97C46",

    selection_fg = "#F0D8AE",
    selection_bg = "#5A3920",

    scrollbar_thumb = "#6A4528",
    split = "#5A3920",

    ansi = {
      "#211811", -- black
      "#B86A5A", -- red
      "#8FA36A", -- green
      "#B97C46", -- yellow
      "#6F91A0", -- blue
      "#A0789D", -- magenta
      "#7FA89A", -- cyan
      "#D8C4A0", -- white
    },

    brights = {
      "#5A4632", -- bright black
      "#D1846F", -- bright red
      "#AFC982", -- bright green
      "#D69A5E", -- bright yellow
      "#90B7C8", -- bright blue
      "#C29AC0", -- bright magenta
      "#9BCABB", -- bright cyan
      "#F3E0BC", -- bright white
    },
  },
}

M.themes = {
  sepia = {
    scheme = "Sepia Forge",
    kind = "light",
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
    kind = "light",
    bat_theme = "ansi",
    cursor = {
      bg = "#8F5B34",
      fg = "#E7D1B3",
    },
    selection = {
      bg = "#C9A783",
      fg = "#231910",
    },
  },

  sepia_dark = {
    scheme = "Sepia Forge Dark",
    kind = "dark",
    bat_theme = "ansi",
    cursor = {
      bg = "#B97C46",
      fg = "#211811",
    },
    selection = {
      bg = "#5A3920",
      fg = "#F0D8AE",
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

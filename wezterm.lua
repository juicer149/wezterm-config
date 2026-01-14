-- wezterm.lua
-- ------------------------------------------------------------
-- WezTerm configuration entry point.
--
-- This file is intentionally boring.
-- It composes configuration modules and returns the result.
--
-- All real logic lives in:
--   - appearance.lua
--   - fonts.lua
--   - keys.lua
-- ------------------------------------------------------------

local wezterm = require "wezterm"

-- Initialize empty configuration table
local config = {}

-- Load configuration modules
local appearance = require "appearance"
local fonts      = require "fonts"
local keys       = require "keys"

-- Apply modules
appearance.apply(config)
fonts.apply(config)
keys.apply(config)

return config

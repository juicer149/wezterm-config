-- wezterm.lua
-- ------------------------------------------------------------
-- Entry point (composition only)
-- ------------------------------------------------------------

local config = {}

local appearance = require "appearance.init"
local fonts      = require "fonts"
local keys       = require "keys"

appearance.apply(config)
fonts.apply(config)
keys.apply(config)

return config

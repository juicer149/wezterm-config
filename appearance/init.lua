-- appearance/init.lua
-- ------------------------------------------------------------
-- Appearance API.
--
-- Owns the high-level appearance pipeline.
-- Details live in appearance/config.lua and appearance/themes/*.
-- ------------------------------------------------------------

local M = {}

local appearance_config = require "appearance.config"
local themes            = require "appearance.themes.registry"

-- ------------------------------------------------------------
-- Apply
-- ------------------------------------------------------------

function M.apply(config)
  appearance_config.apply(config)
  themes.apply(config, appearance_config.theme)
end

return M

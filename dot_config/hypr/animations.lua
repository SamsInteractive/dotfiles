--     ___          _                 __  _
--    /   |  ____  (_)___ ___  ____ _/ /_(_)___  ____  _____
--   / /| | / __ \/ / __ `__ \/ __ `/ __/ / __ \/ __ \/ ___/
--  / ___ |/ / / / / / / / / / /_/ / /_/ / /_/ / / / (__  )
-- /_/  |_/_/ /_/_/_/ /_/ /_/\__,_/\__/_/\____/_/ /_/____/
--
-- Attempt to source hostname config
local success = HOSTNAME and pcall(require, "conf/animations/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.ANIM_OVERRIDE then
	require("conf/animations/default")
end

-- Source any custom user configs
pcall(require, "conf/animations/user")

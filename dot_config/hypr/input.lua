--     ____                  __
--    /  _/___  ____  __  __/ /_
--    / // __ \/ __ \/ / / / __/
--  _/ // / / / /_/ / /_/ / /_
-- /___/_/ /_/ .___/\__,_/\__/
--          /_/
--

-- Attempt to source hostname config
local success = HOSTNAME and pcall(require, "conf/input/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.INPUT_OVERRIDE then
	require("conf/input/default")
end

-- Source any custom user configs
pcall(require, "conf/input/user")

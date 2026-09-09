--     ___         __             __             __
--    /   | __  __/ /_____  _____/ /___ _  _____/ /_
--   / /| |/ / / / __/ __ \/ ___/ __/ __ `/ ___/ __/
--  / ___ | /_/ / /_/ /_/ (__  ) /_/ /_/ / /  / /_
-- /_/  |_\__,_/\__/\____/____/\__/\__,_/_/   \__/
--

-- Attempt to source hostname config
local success = pcall(require, "conf/autostart/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.AUTO_OVERRIDE then
	require("conf/autostart/default")
end

-- Source any custom user configs
pcall(require, "conf/autostart/user")

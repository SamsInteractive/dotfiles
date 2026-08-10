--     ____  _           __
--    / __ \(_)________ / /___ ___  _______
--   / / / / / ___/ __ \/ / __ `/ / / / ___/
--  / /_/ / (__  ) /_/ / / /_/ / /_/ (__  )
-- /_____/_/____/ .___/_/\__,_/\__, /____/
--             /_/            /____/
--

local success

-- Attempt to source hostname config if enabled in config.lua
if config.SOURCE_HOST then
	success = pcall(require, "conf/displays/saved/" .. HOSTNAME)
end

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.DISP_OVERRIDE then
	require("conf/displays/default")
end

-- Source any custom user configs
pcall(require, "conf/displays/user")

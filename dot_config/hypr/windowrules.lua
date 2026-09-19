--  _       ___           __                 ____        __
-- | |     / (_)___  ____/ /___ _      __   / __ \__  __/ /__  _____
-- | | /| / / / __ \/ __  / __ \ | /| / /  / /_/ / / / / / _ \/ ___/
-- | |/ |/ / / / / / /_/ / /_/ / |/ |/ /  / _, _/ /_/ / /  __(__  )
-- |__/|__/_/_/ /_/\__,_/\____/|__/|__/  /_/ |_|\__,_/_/\___/____/
--

-- Attempt to source hostname config
local success = HOSTNAME and pcall(require, "conf/windowrules/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.WIND_OVERRIDE then
	require("conf/windowrules/default")
end

-- Source any custom user configs
pcall(require, "conf/windowrules/user")

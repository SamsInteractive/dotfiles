--     __ __            __    _           __
--    / //_/___  __  __/ /_  (_)___  ____/ /____
--   / ,<  / _ \/ / / / __ \/ / __ \/ __  / ___/
--  / /| |/  __/ /_/ / /_/ / / / / / /_/ (__  )
-- /_/ |_|\___/\__, /_.___/_/_/ /_/\__,_/____/
--            /____/

-- Attempt to source hostname config
local success = HOSTNAME and pcall(require, "conf/keybinds/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.KEYB_OVERRIDE then
	require("conf/keybinds/default")
end

-- Source any custom user configs
pcall(require, "conf/keybinds/user")

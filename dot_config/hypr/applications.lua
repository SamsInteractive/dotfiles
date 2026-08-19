--     ___                ___            __  _
--    /   |  ____  ____  / (_)________ _/ /_(_)___  ____  _____
--   / /| | / __ \/ __ \/ / / ___/ __ `/ __/ / __ \/ __ \/ ___/
--  / ___ |/ /_/ / /_/ / / / /__/ /_/ / /_/ / /_/ / / / (__  )
-- /_/  |_/ .___/ .___/_/_/\___/\__,_/\__/_/\____/_/ /_/____/
--       /_/   /_/
--

-- Attempt to source hostname config
local success = pcall(require, "conf/applications/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.APP_OVERRIDE then
	TERMINAL = "kitty"
	FILEMANAGER = "thunar"
	MENU = "~/.config/hypr/scripts/rofi-toggle"
	WINDOWMENU = MENU .. " window"

	hl.env("TERMINAL", "kitty")
	hl.env("XDG_TERMINAL_EMULATOR", "kitty")
end

-- Source any custom user configs
pcall(require, "conf/applications/user")

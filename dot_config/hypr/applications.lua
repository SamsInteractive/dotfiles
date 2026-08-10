--     ___                ___            __  _
--    /   |  ____  ____  / (_)________ _/ /_(_)___  ____  _____
--   / /| | / __ \/ __ \/ / / ___/ __ `/ __/ / __ \/ __ \/ ___/
--  / ___ |/ /_/ / /_/ / / / /__/ /_/ / /_/ / /_/ / / / (__  )
-- /_/  |_/ .___/ .___/_/_/\___/\__,_/\__/_/\____/_/ /_/____/
--       /_/   /_/
--

if not config.APP_OVERRIDE then
	TERMINAL = "kitty"
	FILEMANAGER = "thunar"
	MENU = "~/.config/hypr/scripts/rofi-toggle"
	WINDOWMENU = MENU .. " window"

	hl.env("TERMINAL", "kitty")
	hl.env("XDG_TERMINAL_EMULATOR", "kitty")
end

pcall(require, "conf/applications/user")

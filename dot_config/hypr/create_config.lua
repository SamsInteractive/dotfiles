--    ______            _____
--   / ____/___  ____  / __(_)___
--  / /   / __ \/ __ \/ /_/ / __ `/
-- / /___/ /_/ / / / / __/ / /_/ /
-- \____/\____/_/ /_/_/ /_/\__, /
--                        /____/
--

-- This file will not be modified by updates to the dotfiles.

return {
	-- Set to true to attempt to source config files matching
	-- the hostname in "./conf/*/saved/" (you probably don't want this).
	-- If such a config is sourced, the relevant default.lua
	-- config will not be sourced unless the second flag is true.
	SOURCE_HOST = false,
	ALWAYS_SOURCE_DEFAULT = false,

	-- Set to true to prevent calling of the default.lua config (or hard-coded default)
	-- for a given config type.
	ENV_OVERRIDE = false,
	APP_OVERRIDE = false,
	INPUT_OVERRIDE = false,
	LOOKS_OVERRIDE = false,
	KEYB_OVERRIDE = false,
	DISP_OVERRIDE = false,
	AUTO_OVERRIDE = false,
	WIND_OVERRIDE = false,
	ANIM_OVERRIDE = false,
}

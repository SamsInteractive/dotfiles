--     ____                      _           _
--    / __ \___  ____ ____ ___  (_)_________(_)___  ____  _____
--   / /_/ / _ \/ ___/ __ `__ \/ / ___/ ___/ / __ \/ __ \/ ___/
--  / ____/  __/ /  / / / / / / (__  )__  ) / /_/ / / / (__  )
-- /_/    \___/_/  /_/ /_/ /_/_/____/____/_/\____/_/ /_/____/
--

-- Attempt to source hostname config
local success = HOSTNAME and pcall(require, "conf/permissions/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.PERM_OVERRIDE then
	require("conf/permissions/default")
end

-- Source any custom user configs
pcall(require, "conf/permissions/user")

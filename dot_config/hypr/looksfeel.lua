-- Attempt to source hostname config if SOURCE_HOST is true in config.lua
local success = config.SOURCE_HOST and HOSTNAME and pcall(require, "conf/looksfeel/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.LOOKS_OVERRIDE then
	require("conf/looksfeel/default")
end

-- Source any custom user configs
pcall(require, "conf/looksfeel/user")

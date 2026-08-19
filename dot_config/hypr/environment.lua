--     ______           _                                       __
--    / ____/___ _   __(_)________  ____  ____ ___  ___  ____  / /_
--   / __/ / __ \ | / / / ___/ __ \/ __ \/ __ `__ \/ _ \/ __ \/ __/
--  / /___/ / / / |/ / / /  / /_/ / / / / / / / / /  __/ / / / /_
-- /_____/_/ /_/|___/_/_/   \____/_/ /_/_/ /_/ /_/\___/_/ /_/\__/
--

-- SYS Info
local cmd = [[
cat /etc/hostname | awk 'END{if(!NR)print""} {print}'
lspci | grep -iE 'vga|3d|display' | grep -oiE 'nvidia|amd|intel' | head -n1 | awk 'END{if(!NR)print""} {print}'
]]

local handle = io.popen(cmd)
if handle then
	HOSTNAME = handle:read("l")
	if HOSTNAME == "" then
		HOSTNAME = nil
	end

	GPU = handle:read("l").lower()
	if GPU == "" then
		GPU = nil
	elseif GPU then
		GPU = GPU:lower()
	end

	handle:close()
end
cmd = [==[
model=$(awk '/^model name/{sub(/^model name[[:space:]]*:[[:space:]]*/,""); print; exit}' /proc/cpuinfo)
echo ${model%%@*}
]==]

handle = io.popen(cmd)
if handle then
	CPU = handle:read("l")
	handle:close()
end

-- Attempt to source hostname config
local success = pcall(require, "conf/environment/saved/" .. HOSTNAME)

-- Source default config if hostname config failed to be sourced or
-- ALWAYS_SOURCE_DEFAULT is true. Will not run if overridden in config.lua
if (not success or config.ALWAYS_SOURCE_DEFAULT) and not config.ENV_OVERRIDE then
	require("conf/environment/default")
end

-- Source any custom user configs
pcall(require, "conf/environment/user")

--     ____  _           __
--    / __ \(_)________ / /___ ___  _______
--   / / / / / ___/ __ \/ / __ `/ / / / ___/
--  / /_/ / (__  ) /_/ / / /_/ / /_/ (__  )
-- /_____/_/____/ .___/_/\__,_/\__, /____/
--             /_/            /____/
--

-- Source default config if not disabled in config.lua
if not config.DISP_OVERRIDE then
	require("conf/displays/default")
end

pcall(require, "conf/displays/" .. HOSTNAME)

require("conf/displays/user")

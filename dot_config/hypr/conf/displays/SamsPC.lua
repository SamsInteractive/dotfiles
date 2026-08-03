--     ____  _           __
--    / __ \(_)________ / /___ ___  _______
--   / / / / / ___/ __ \/ / __ `/ / / / ___/
--  / /_/ / (__  ) /_/ / / /_/ / /_/ (__  )
-- /_____/_/____/ .___/_/\__,_/\__, /____/
--             /_/            /____/
--

if HOSTNAME == "SamsPC" then
	hl.monitor({
		output = "DP-1",
		mode = "3840x2160@240",
		position = "0x0",
		scale = 1.5,
		bitdepth = 10,
		supports_wide_color = 1,
		supports_hdr = 1,
		sdr_min_luminance = 0.005,
		sdr_max_luminance = 200,
		sdrbrightness = 1.1,
		min_luminance = 0.0,
		max_luminance = 1016,
		max_avg_luminance = 412,
		vrr = 0,
	})
end

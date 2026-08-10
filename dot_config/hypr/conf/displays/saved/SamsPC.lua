--     ____  _           __
--    / __ \(_)________ / /___ ___  _______
--   / / / / / ___/ __ \/ / __ `/ / / / ___/
--  / /_/ / (__  ) /_/ / / /_/ / /_/ (__  )
-- /_____/_/____/ .___/_/\__,_/\__, /____/
--             /_/            /____/
--

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

hl.monitor({
	output = "DP-2",
	mode = "2560x1440@180",
	position = "2560x0",
	scale = 1,
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@60",
	position = "5120x0",
	scale = 1,
})

-- Assign workspaces to correct displays
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1" })

hl.workspace_rule({ workspace = "6", monitor = "DP-2" })
hl.workspace_rule({ workspace = "7", monitor = "DP-2" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })

hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })

-- Unscale Xwayland
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

-- Cursor and GDK Scaling
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "2")

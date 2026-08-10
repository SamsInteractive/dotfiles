--     ____  _           __
--    / __ \(_)________ / /___ ___  _______
--   / / / / / ___/ __ \/ / __ `/ / / / ___/
--  / /_/ / (__  ) /_/ / / /_/ / /_/ (__  )
-- /_____/_/____/ .___/_/\__,_/\__, /____/
--             /_/            /____/
--

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

-- Unscale Xwayland
hl.config({
	xwayland = {
		force_zero_scaling = true,
	},
})

-- Cursor and GDK Scaling
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_SCALE", "1")

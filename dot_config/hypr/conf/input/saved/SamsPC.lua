--     ____                  __
--    /  _/___  ____  __  __/ /_
--    / // __ \/ __ \/ / / / __/
--  _/ // / / / /_/ / /_/ / /_
-- /___/_/ /_/ .___/\__,_/\__/
--          /_/
--

hl.config({
	input = {
		kb_layout = "us",

		follow_mouse = 1,

		sensitivity = 0,
		accel_profile = "flat",

		touchpad = {
			scroll_factor = 0.15,
			natural_scroll = true,
		},
	},
})

hl.device({
	name = "logitech-g502-x-plus",
	sensitivity = -0.15,
})

hl.device({
	name = "logitech-g502-x-plus-1",
	sensitivity = -0.15,
})

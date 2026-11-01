-- Matugen colours (fall back to the original border colours if colors.lua hasn't been generated yet)
local ok, palette = pcall(require, "colors")
if not ok then
	palette = { primary = "rgba(33ccffee)", tertiary = "rgba(00ff99ee)" }
end

-- ---- General ----
hl.config({
	general = {
		-- Layout
		layout = "dwindle",

		-- Gaps
		gaps_in = 5,
		gaps_out = 10,
		float_gaps = 10,

		-- Borders
		border_size = 2,
		resize_on_border = false,
		hover_icon_on_border = false,

		col = {
			-- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			active_border = { colors = { palette.primary, palette.tertiary }, angle = 135 },
			inactive_border = "rgba(595959aa)",
		},

		-- Behaviour and Compat
		allow_tearing = false,

		-- Snap
		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
			respect_gaps = true,
		},
	},
})

-- ---- Decoration ----
hl.config({
	decoration = {
		-- Rounding
		rounding = 10,
		rounding_power = 2,

		-- Opacity
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		-- Shadows
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		-- Blur
		blur = {
			enabled = true,
			size = 6,
			passes = 3,
		},
	},
})

-- ---- Layout Configurations ----
hl.config({
	-- Dwindle
	dwindle = {
		preserve_split = true,
		-- force_split = 2,
	},

	-- Master
	master = {
		new_status = "master",
	},
})

-- ---- Misc ----
-- https://wiki.hypr.land/Configuring/Variables/#misc
hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

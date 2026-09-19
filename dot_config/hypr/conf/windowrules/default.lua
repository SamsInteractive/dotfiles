--  _       ___           __                 ____        __
-- | |     / (_)___  ____/ /___ _      __   / __ \__  __/ /__  _____
-- | | /| / / / __ \/ __  / __ \ | /| / /  / /_/ / / / / / _ \/ ___/
-- | |/ |/ / / / / / /_/ / /_/ / |/ |/ /  / _, _/ /_/ / /  __(__  )
-- |__/|__/_/_/ /_/\__,_/\____/|__/|__/  /_/ |_|\__,_/_/\___/____/
--

-- Popups
hl.window_rule({ match = { initial_title = "^(Open File)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Choose Files)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Save As)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Confirm to replace files)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(File Operation Progress)$" }, tag = "+popups" })
hl.window_rule({ match = { class = "^([Xx]dg-desktop-portal-gtk)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Open)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Authentication Required)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Add Folder to Workspace)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(File Upload)(.*)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Choose wallpaper)(.*)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(Library)(.*)$" }, tag = "+popups" })
hl.window_rule({ match = { class = "^(.*dialog.*)$" }, tag = "+popups" })
hl.window_rule({ match = { title = "^(.*dialog.*)$" }, tag = "+popups" })

hl.window_rule({ match = { class = "^(org.kde.dolphin)$" }, tag = "+filemgr" })
hl.window_rule({ match = { class = "^(thunar)$" }, tag = "+filemgr" })

-- Utilities
hl.window_rule({ match = { class = "^(org.kde.dolphin)$" }, tag = "+utils" })
hl.window_rule({ match = { class = "^(thunar)$" }, tag = "+utils" })
hl.window_rule({
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	tag = "+utils",
	size = "(monitor_w*0.55) (monitor_h*0.55)",
})
hl.window_rule({ match = { class = "^(nwg-look)$" }, tag = "+utils", size = "(monitor_w*0.55) (monitor_h*0.55)" })
hl.window_rule({ match = { class = "^(cava)$" }, tag = "+utils" })
hl.window_rule({ match = { class = "^(cbonsai)$" }, tag = "+utils" })
hl.window_rule({ match = { class = "cbonsai" }, size = "(monitor_w*0.35) (monitor_h*0.40)" })

-- Picture-in-Picture
hl.window_rule({ match = { title = [[^([Pp]icture[-\s]?[Ii]n[-\s]?[Pp]icture)(.*)$]] }, tag = "+picture-in-picture" })
hl.window_rule({
	match = { tag = "picture-in-picture" },
	float = true,
	keep_aspect_ratio = true,
	move = "((monitor_w*0.73)) ((monitor_h*0.72))",
	size = "(monitor_w*0.25) (monitor_h*0.25)",
	pin = true,
})

-- ---- Rules ----

-- Tags
hl.window_rule({ match = { tag = "popups" }, float = true })
hl.window_rule({ match = { tag = "utils" }, float = true })
hl.window_rule({ match = { tag = "float" }, float = true })

hl.window_rule({ match = { tag = "filemgr" }, size = "(110*8.65) (29*18)" })

-- General
hl.window_rule({ match = { class = "^(steam)$" }, float = true })
hl.window_rule({ match = { title = "Steam" }, tile = true })
hl.window_rule({ match = { class = "kitty" }, float = true, size = "(110*8.65) (29*18)" })

-- Tooltip Focus
hl.window_rule({
	match = { title = "^(?i)(tooltip|popup|popupmenu|context|notification|completion|code completion|intention|hint)$" },
	no_focus = true,
})
hl.window_rule({ match = { class = "^(.*jetbrains.*)$", title = "^(win[0-9]+)$" }, no_focus = true })

-- Blur
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "waybar" }, blur = true, ignore_alpha = 0 })

-- Quality of Life
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

hl.window_rule({
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Scroll/Trackpad Settings
hl.window_rule({ match = { class = "^(kitty)$" }, scroll_touchpad = 1 })
hl.window_rule({ match = { initial_class = "^(jetbrains-fleet)$" }, scroll_touchpad = 0.25, scroll_mouse = 3 })
hl.window_rule({ match = { class = "^(dev.zed.Zed)$" }, scroll_touchpad = 0.50 })

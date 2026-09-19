--     __ __            __    _           __
--    / //_/___  __  __/ /_  (_)___  ____/ /____
--   / ,<  / _ \/ / / / __ \/ / __ \/ __  / ___/
--  / /| |/  __/ /_/ / /_/ / / / / / /_/ (__  )
-- /_/ |_|\___/\__, /_.___/_/_/ /_/\__,_/____/
--            /____/

-- Global key assignments
MAINMOD = "SUPER"

-- General
hl.bind(MAINMOD .. " + RETURN", hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAINMOD .. " + E", hl.dsp.exec_cmd(FILEMANAGER))
hl.bind(MAINMOD .. " + SPACE", hl.dsp.exec_cmd(MENU))
hl.bind(MAINMOD .. " + DELETE", hl.dsp.exec_cmd(POWERMENU))

hl.bind(MAINMOD .. " + L", hl.dsp.exec_cmd(LOCK))
hl.bind(MAINMOD .. " + Q", hl.dsp.window.close())
hl.bind(MAINMOD .. " + X", hl.dsp.window.float({ action = "toggle" }))
hl.bind(MAINMOD .. " + P", hl.dsp.window.pin({ action = "toggle" }))

-- F-Keys
hl.bind("F11", hl.dsp.window.fullscreen({ action = "toggle" }))

-- ---- Window Bindings ----

-- Focus/Swap/Resize Window
for i = 1, 4 do
	local arrow = { "Left", "Right", "Down", "Up" }
	local direction = { "l", "r", "d", "u" }
	local resize = { 30, -30, 0, 0 }

	hl.bind(MAINMOD .. " + " .. arrow[i], hl.dsp.focus({ direction = direction[i] }))

	hl.bind(MAINMOD .. " + SHIFT + " .. arrow[i], hl.dsp.swap({ direction = direction[i] }))

	hl.bind(
		MAINMOD .. " + CTRL + " .. arrow[i],
		hl.dsp.window.resize({
			x = resize[i],
			y = resize[((i + 1) % 4) + 1],
			relative = true,
		}),
		{ repeating = true }
	)
end

hl.bind(MAINMOD .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MAINMOD .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })

-- ---- Workspace Bindings ----

-- Workspaces 1-10
for i = 1, 10 do
	local key = i % 10
	hl.bind(MAINMOD .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(MAINMOD .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	hl.bind(MAINMOD .. " + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Cycle Workspaces
hl.bind(MAINMOD .. " + TAB", hl.dsp.focus({ workspace = "previous" }))
hl.bind(MAINMOD .. " + A", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MAINMOD .. " + D", hl.dsp.focus({ workspace = "e+1" }))

-- Special Workspace(s)
hl.bind(MAINMOD .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MAINMOD .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind(MAINMOD .. " + CTRL + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic", silent = true }))

-- ---- Audio Bindings ----

-- Pause/Play
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- ---- Gestures ----
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

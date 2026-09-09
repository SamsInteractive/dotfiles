--     ___         __             __             __
--    /   | __  __/ /_____  _____/ /___ _  _____/ /_
--   / /| |/ / / / __/ __ \/ ___/ __/ __ `/ ___/ __/
--  / ___ | /_/ / /_/ /_/ (__  ) /_/ /_/ / /  / /_
-- /_/  |_\__,_/\__/\____/____/\__/\__,_/_/   \__/
--

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("~/.config/hypr/scripts/env/gen_main_ppi.sh")

	-- Launch Awww in namespace to resolve firejail illegal socket name
	hl.exec_cmd("awww-daemon --namespace awww")

	hl.exec_cmd("/usr/lib/pam_kwallet_init")
	hl.exec_cmd("/usr/bin/kwalletd6")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- Dotfile auto updater
	hl.exec_cmd("~/.config/hypr/scripts/update_check.sh")
end)

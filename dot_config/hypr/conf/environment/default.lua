--     ______           _                                       __
--    / ____/___ _   __(_)________  ____  ____ ___  ___  ____  / /_
--   / __/ / __ \ | / / / ___/ __ \/ __ \/ __ `__ \/ _ \/ __ \/ __/
--  / /___/ / / / |/ / / /  / /_/ / / / / / / / / /  __/ / / / /_
-- /_____/_/ /_/|___/_/_/   \____/_/ /_/_/ /_/ /_/\___/_/ /_/\__/
--

-- XDG Portal
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Toolkit Backends
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- Mozilla
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Ozone
hl.env("OZONE_PLATFORM", "wayland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Other
hl.env("EGL_PLATFORM", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")

if GPU == "nvidia" then
	-- Nvidia Specific Settings
	hl.env("GBM_BACKEND", "nvidia-drm")
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	hl.env("__GL_GSYNC_ALLOWED", "1")
end

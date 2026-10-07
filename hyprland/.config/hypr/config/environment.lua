-- Environment variables
hl.env("XDG_SESSION_TYPE", "wayland")

-- NVIDIA / Vulkan variables from the original config were commented out,
-- so they remain omitted here.
hl.env("__GL_THREADED_OPTIMIZATIONS", "1")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_BACKEND", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Original cursor block:
hl.config({
    cursor = {
        no_hardware_cursors = false,
    },
})

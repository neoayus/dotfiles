-- Keyboard, mouse, touchpad, and per-device settings.
hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        sensitivity = 0.5,
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

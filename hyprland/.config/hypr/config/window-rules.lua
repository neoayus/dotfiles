-- Window rules

hl.window_rule({
    name = "chromeAtWP1",
    match = { class = "Google-chrome" },
    workspace = "1 silent",
})

hl.window_rule({
    name = "obsidianAtWP9",
    match = { class = "obsidian" },
    workspace = "9 silent",
    opacity = "0.85 0.85 1.0",
})

hl.window_rule({
    name = "codeAtWP10",
    match = { class = "code-oss" },
    workspace = "10 silent",
})

-- Floating application windows
hl.window_rule({
    name = "floatPavuAudioManager",
    match = { class = "org.pulseaudio.pavucontrol" },
    float = true,
})

hl.window_rule({
    name = "floatWaypaper",
    match = { class = "waypaper" },
    float = true,
})

hl.window_rule({
    name = "floatBluetoothManager",
    match = { class = "blueman-manager" },
    float = true,
})

hl.window_rule({
    name = "floatFeh",
    match = { class = "feh" },
    float = true,
})

-- Other rules from the old file were commented out and remain omitted.

-- General variables and default applications.
-- Lua locals replace the old $variable syntax. Keep values quoted as strings.

local mainMod = "ALT"
local terminal = "kitty"
local browser = "chrome"
local fileManager = "nautilus"
local menu = "wofi --show drun"
local notes = "obsidian --disable-gpu"
local wallpapers = "~/.backgrounds"

-- Expose the variables used by keybindings in this module.
-- Hyprland requires each file in its own scope, so keybindings.lua defines
-- its own copy of these locals where needed.

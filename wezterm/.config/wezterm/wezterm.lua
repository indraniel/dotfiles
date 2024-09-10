-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGS NF")
config.font_size = 10
config.enable_tab_bar = true
config.color_scheme = 'Tomorrow (Gogh)'
--config.color_scheme = 'Tomorrow Night (Gogh)'
--config.color_scheme = 'iTerm2 Pastel Dark Background'
--config.color_scheme = 'nord'
config.window_background_opacity = 0.8
config.default_prog = { '/usr/bin/zsh', '-l' }
config.window_decorations = "RESIZE"
config.enable_wayland = false
config.scrollback_lines = 3500

return config

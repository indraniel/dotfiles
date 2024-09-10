local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
-- window:gui_window():maximize()
end)

return {
    default_prog = { '/usr/bin/bash', '-l' },
--    window_decorations = "INTEGRATED_BUTTONS | RESIZE",
    window_decorations = "RESIZE",
    integrated_title_button_style = "Gnome",
    window_background_opacity = 0.9,
    color_scheme = 'Dracula',
    enable_wayland = false,
    scrollback_lines = 3500,
}

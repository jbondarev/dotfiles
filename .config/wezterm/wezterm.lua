local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- font
config.font = wezterm.font('FiraCode Nerd Font Mono', { weight = 'Regular' })
config.font_size = 14.0

-- appearance

config.color_scheme = 'Gruvbox Dark (Gogh)'

-- tabs

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true

-- window

config.initial_cols = 120
config.initial_rows = 30

config.kde_window_background_blur = false
-- config.window_background_opacity = 0.8 

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10
}

config.default_cursor_style = "BlinkingBlock"

-- performance
config.max_fps = 144
config.animation_fps = 144

return config

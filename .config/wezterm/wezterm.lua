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

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Gruvbox colors
local gruvbox = {
  bg0 = '#282828',
  bg1 = '#3c3836',
  bg2 = '#504945',
  fg = '#ebdbb2',
  orange = '#fe8019',
  yellow = '#fabd2f',
  aqua = '#8ec07c',
}

-- Tab bar colors
config.colors = {
  tab_bar = {
    background = gruvbox.bg0,
    
    -- Inactive tabs - also use bg0 to blend with background
    inactive_tab = {
      bg_color = gruvbox.bg0,
      fg_color = '#a89984',
    },
    
    -- Active tab - slightly lighter with orange accent
    active_tab = {
      bg_color = gruvbox.bg1,
      fg_color = gruvbox.orange,
    },
    
    -- Inactive tab hover
    inactive_tab_hover = {
      bg_color = gruvbox.bg1,
      fg_color = gruvbox.fg,
    },
  },
}

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

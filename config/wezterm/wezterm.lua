local wezterm = require 'wezterm'

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local edge_background = "#121212"
    local background = "#4E4E4E"
    local foreground = "#1C1B19"
    local dim_foreground = "#3A3A3A"

    if tab.is_active then
        background = "#61afef"
        foreground = "#1C1B19"
    elseif hover then
        background = "#abb2bf"
        foreground = "#1C1B19"
    end
    local edge_foreground = background

    local left_arrow = SOLID_LEFT_ARROW
    if tab.tab_index == 0 then
        left_arrow = SOLID_LEFT_MOST
    end
    local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width-1) .. " "
    return {
        {Attribute={Intensity="Bold"}},
        {Background={Color=edge_background}},
        {Foreground={Color=edge_foreground}},
        {Text=left_arrow},
        {Background={Color=background}},
        {Foreground={Color=foreground}},
        {Text=title},
        {Background={Color=edge_background}},
        {Foreground={Color=edge_foreground}},
        {Text=SOLID_RIGHT_ARROW},
        {Attribute={Intensity="Normal"}},
    }
    end
)

local config = wezterm.config_builder()

config.animation_fps = 1
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.default_cursor_style = 'BlinkingBar'
config.cursor_thickness = '1px'
config.cursor_blink_rate = 500

config.colors = {
    tab_bar = {
        background = "#121212",
        new_tab = {
            bg_color = "#121212",
            fg_color = "#FCE8C3",
            intensity = "Bold",
        },
        new_tab_hover = {
            bg_color = "#121212",
            fg_color = "#61afef",
            intensity = "Bold",
        },
    },
    cursor_bg = '#61afef',
    cursor_fg = '#61afef',
    foreground = '#abb2bf',
    background = '#21252b',
    selection_fg = '#abb2bf',
    selection_bg = '#323844',
    ansi = {
        '#21252b',
        '#e06c75',
	    '#98c379',
	    '#e5c07b',
	    '#61afef',
	    '#c678dd',
	    '#56b6c2',
	    '#abb2bf',
    },
    brights = {
        '#767676',
	    '#e06c75',
	    '#98c379',
	    '#e5c07b',
	    '#61afef',
	    '#c678dd',
	    '#56b6c2',
	    '#abb2bf',
    },
}

config.font = wezterm.font "FiraCodeNerdFont"
config.font_size = 11.0
config.window_padding = {
    left = 4,
    right = 4,
    bottom = 2,
    top = 2,
}
config.window_background_opacity = 0.97
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 60


config.keys = {
    {
        key = 'LeftArrow',
        mods = 'CTRL',
        action = wezterm.action.MoveTabRelative(-1),
    },
    {
        key = 'RightArrow',
        mods = 'CTRL',
        action = wezterm.action.MoveTabRelative(1),
    },
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentTab {confirm=true},
    },
}

return config

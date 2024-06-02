local wezterm = require 'wezterm'

local SOLID_LEFT_ARROW = utf8.char(0xe0ba)
local SOLID_LEFT_MOST = utf8.char(0x2588)
local SOLID_RIGHT_ARROW = utf8.char(0xe0bc)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local edge_background = "#21252b"
    local background = "#494d64"
    local foreground = "#cad3f5"

    if tab.is_active then
        background = "#e06c75"
        foreground = "#282c34"
    elseif hover then
        background = "#61afef"
        foreground = "#24273a"
    end
    local edge_foreground = background

    local left_arrow = SOLID_LEFT_ARROW
    if tab.tab_index == 0 then
        left_arrow = SOLID_LEFT_MOST
    end
    local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width-1) .. " "
    return {
        {Attribute={Italic=false}},
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
    ansi = {
        "#282c34", -- black
        "#e06c75", -- red
        "#98c379", -- green
        "#e5c07b", -- yellow
        "#61afef", -- blue
        "#c678dd", -- purple
        "#56b6c2", -- cyan
        "#abb2bf", -- white
    },
    brights = {
        "#5c6370", -- gray
        "#e06c75", -- red
        "#98c379", -- green
        "#e5c07b", -- yellow
        "#61afef", -- blue
        "#c678dd", -- purple
        "#56b6c2", -- cyan
        "#abb2bf", -- white
    },
    background = "#282c34",
    foreground = "#abb2bf",
    cursor_bg = "#61afef",
    selection_bg = "#414858",
    tab_bar = {
        background = "#21252b",
        new_tab = {
            bg_color = "#21252b",
            fg_color = "#909090",
        },
        new_tab_hover = {
            bg_color = "#21252b",
            fg_color = "#e5c07b",
            italic = false,
        },
    },  
}

config.font = wezterm.font({ family="CaskaydiaCoveNerdFont" })
config.font_size = 11.0
config.window_padding = {
    left = 4,
    right = 4,
    bottom = 2,
    top = 2,
}
config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 60


config.keys = {
    {
        key = 'LeftArrow',
        mods = 'CTRL',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'RightArrow',
        mods = 'CTRL',
        action = wezterm.action.ActivateTabRelative(1),
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

require("events.tab-title").setup()
local wezterm = require 'wezterm'
local config = {}
local platform = require('utils.platform')

local font = 'JetBrainsMono Nerd Font'
local font_size = platform().is_mac and 14 or 10
if wezterm.config_builder then
  c = wezterm.config_builder()
end
config.animation_fps = 60
config.max_fps = 60
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
-- 关闭时不进行确认
config.window_close_confirmation = 'NeverPrompt'
config.adjust_window_size_when_changing_font_size = false
-- 透明背景
config.window_background_opacity = 1
-- 取消 Windows 原生标题栏
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.integrated_title_button_color = "auto"
config.integrated_title_button_alignment = "Right"
-- 初始大小
config.initial_cols = 112
config.initial_rows = 33
-- 滚动条尺寸为 15 ，其他方向不需要 pad
-- window_background_gradient = {
    -- colors = { "#1D261B", "#261A25" },
    -- -- Specifices a Linear gradient starting in the top left corner.
    -- -- orientation = { Linear = { angle = -45.0 } },
-- }
config.window_padding = {
    left = 0,
    right = 15,
    top = 10,
    bottom = 0,
}
config.window_frame = {
    active_titlebar_bg = "#EBEBE9",
    inactive_titlebar_bg = "#0F2536",
    -- font = fonts.font,
    -- font_size = fonts.font_size,
}
-- tab bar
-- config.tab_bar_background = "#ffffff"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true
config.switch_to_last_active_tab_when_closing_tab = true
config.inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 }
-- 字体
config.font = wezterm.font(font)
config.font_size = font_size
--ref: https://wezfurlong.org/wezterm/config/lua/config/freetype_pcf_long_family_names.html#why-doesnt-wezterm-use-the-distro-freetype-or-match-its-configuration
config.freetype_load_target = 'Normal' ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
config.freetype_render_target = 'Normal' ---@type 'Normal'|'Light'|'Mono'|'HorizontalLcd'
-- 配色
config.term = "xterm-256color"
-- https://wezfurlong.org/wezterm/colorschemes/o/index.html#one-light-base16
local materia = wezterm.color.get_builtin_schemes()['OneHalfLight']
materia.scrollbar_thumb = '#cccccc' -- 更明显的滚动条
config.colors = materia
-- 启用滚动条
config.enable_scroll_bar = true
-- config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 700
-- 默认启动 fish 
config.default_prog = { '/opt/homebrew/bin/fish' }

-- 启动菜单的一些启动项
config.launch_menu = {
  -- screen -S 74889 -X quit
  { label = 'cd_iching',   args = {'cd',}, cwd = '/Users/abc/flutter_pj/flutter_ex'},
  { label = 'screen_iching',   args = {'/usr/bin/screen','-R','iching'}, },
  { label = 'screen_trade',   args = {'/usr/bin/screen','-R','trade'}, },
  { label = 'screen_openui',   args = {'/usr/bin/screen','-R','openui'}, },
}

return config

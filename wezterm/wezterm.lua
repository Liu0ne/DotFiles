local wezterm = require 'wezterm'

local config = {
    font = wezterm.font('HurmitNerdFont', {style = "Normal" , stretch = "Condensed", weight = "Regular"}),
    font_size = 12,
    line_height = 1,
    default_cursor_style = "BlinkingUnderline",
    show_new_tab_button_in_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    color_scheme = "Kanagawa (Gogh)",
    window_background_opacity = 0.95,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    show_tabs_in_tab_bar = true,
    tab_max_width = 100,
    front_end = "WebGpu",

    window_padding = {
	left = 14,
	right = 14,
	top = 14, 
	bottom = 14
    },

    colors = {
	tab_bar = {
	    background = 'transparent',
	}
    }
}

function basename(s)
  return string.gsub(s, '(.*[/\\])(.*)', '%2')
end

local scheme_colors = wezterm.color.get_builtin_schemes()["Kanagawa (Gogh)"]

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = basename(pane.foreground_process_name)
    local symbols = { "", "", "" }

    local white = scheme_colors.brights[8]
    local blue = scheme_colors.ansi[5]
    local grey = "#363646"
    local bg_color = (tab.is_active) and blue or grey
    local fg_color = (tab.is_active) and scheme_colors.ansi[1] or scheme_colors.brights[1]

    local c 
    local d = tab.tab_index

    for _, t in ipairs(tabs) do
       if t.is_active then
	  c = t.tab_index
       end
    end

    local separator_left = (tab.is_active and tab.tab_index == 0) and "" or (tab.is_active) and symbols[1] or ""
    local separator_right =
    (tab.is_active or tab.tab_index == #tabs - 1) and symbols[2]
    or (d == c - 1) and ""
    or symbols[3]

    local separator_left_bg_color = (tab.is_active and tab.tab_index == 0) and blue or grey
    local separator_left_fg_color = (tab.is_active) and blue or grey

    local separator_right_bg_color = (tab.tab_index == #tabs - 1) and "transparent" or grey
    local separator_right_fg_color = (tab.is_active) and blue or (tab.tab_index == #tabs - 1) and grey or scheme_colors.brights[1]

    return {
	      { Background = { Color = separator_left_bg_color } },
	      { Foreground = { Color = separator_left_fg_color } },
	      { Text = separator_left },
	      { Background = { Color = bg_color } },
	      { Foreground = { Color = fg_color } },
	      { Text = " " .. title .. " " },
	      { Background = { Color = separator_right_bg_color } },
	      { Foreground = { Color = separator_right_fg_color } },
	      { Text = separator_right },
    }

  end
)

return config

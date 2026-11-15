local terminal = "wezterm"

hl.on("hyprland.start", function()
   hl.exec_cmd("quickshell")
   hl.exec_cmd("brightnessctl set 0% && for i in {1..20}; do sleep 0.05 && brightnessctl set 1%+; done && for i in {1..20}; do brightnessctl set 1%+; done")
end)
 
hl.monitor({
    output = "",
    mode = "preferred",
    scale = 1,
    position = "auto"
}) 

hl.config({
    misc = {
         force_default_wallpaper = 1,
	 disable_hyprland_logo = true,
    },
    general = {
	gaps_in = 8,
	gaps_out = 14,
	border_size = 2,
	layout = "dwindle",

	col = {
	    active_border = { colors = { "#7E9CD8", "#DCD7BA"}, angle=45},
	    inactive_border = nil,
	}
    },
    
    decoration = {
	  rounding = 7,
	  rounding_power = 5,

	  blur = {
		enabled = true,
		size = 4,
		passes = 2,
		vibrancy = 0.1696,
	  },
	  
	  shadow = {
		enabled = true,
		range = 19, render_power = 4, color = "#121212" }
    },
    animations = { enabled = true },

    input = {
	  kb_layout = "us"
    }
})

local mod = "SUPER"
local alt = "ALT"


hl.bind(mod .. " + V", hl.dsp.exec_cmd(terminal))
hl.bind(mod.. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + T", hl.dsp.window.close())
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), { locked = true, repeating = true })
hl.bind(mod.. " + SHIFT + P", hl.dsp.exec_cmd("hyprshutdown"))

hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left"}))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down"}))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up"}))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right"}))

hl.bind(alt .. " + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(alt .. " + j", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(alt .. " + k", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(alt .. " + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + Space", hl.dsp.window.float({ action = "toggle" }))

for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move({direction = "left", group_aware = true}))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move({direction = "right", group_aware = true}))


hl.window_rule({
   name = "unfocused no-border",
   match = { focus = false },
   border_size = 0
})

local terminal = "wezterm"
local mod = "SUPER"
local alt = "ALT"

hl.on("hyprland.start", function()
   hl.exec_cmd("quickshell")
   hl.exec_cmd("brightnessctl set 0% && sleep 1 && for i in {1..200}; do brightnessctl -q s +5 && sleep 0.0005; done && for i in {1..200}; do brightnessctl -q s +20 && sleep 0.005; done")
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
	 active_border = { colors = { "#4d699b", "#DCD7BA"}, angle=45},
	 inactive_border = nil,
      }
   },

   decoration = {
      rounding = 9,
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

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 1%+"), { locked = true, repeating = true })

hl.bind(alt .. " + h", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
hl.bind(alt .. " + j", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
hl.bind(alt .. " + k", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
hl.bind(alt .. " + l", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })

hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprshutdown"))
hl.bind(mod .. " + SHIFT + T", hl.dsp.window.close())
hl.bind(mod .. " + V", hl.dsp.exec_cmd(terminal))

hl.bind(mod .. " + h", hl.dsp.focus({ direction = "left"}))
hl.bind(mod .. " + j", hl.dsp.focus({ direction = "down"}))
hl.bind(mod .. " + k", hl.dsp.focus({ direction = "up"}))
hl.bind(mod .. " + l", hl.dsp.focus({ direction = "right"}))

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + Space", hl.dsp.window.float({ action = "toggle" }))

for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + SHIFT + h", hl.dsp.window.move( { direction = "left", group_aware = true  }))
hl.bind(mod .. " + SHIFT + l", hl.dsp.window.move( { direction = "right", group_aware = true }))
hl.bind(mod .. " + SHIFT + j", hl.dsp.window.move( { direction = "down", group_aware = true  }))
hl.bind(mod .. " + SHIFT + k", hl.dsp.window.move( { direction = "up", group_aware = true    }))

hl.curve("El Mar Rojo",   { type = "bezier", points = { { 0.16 , 1 },{ 0.8 , 1} }    })
hl.curve("AltaMar",       { type = "bezier", points = { { 0.05 , 0.9 },{ 0.1 , 1.05 } }     })
hl.curve("Gran Verde",    { type = "spring", mass = 1, stiffness = 360, damping = 28 }) 

hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "AltaMar", style = "slidefade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 9, bezier = "AltaMar", style = "slide" })
hl.animation({ leaf = "windows", enabled = true, speed = 8, spring = "Gran Verde"})
hl.animation({ leaf = "windowsIn", enabled = true, speed = 8, spring = "Gran Verde", style = "slide"})
hl.animation({ leaf = "windowsOut", enabled = true, speed = 8, spring = "Gran Verde", style = "gnomed"})
hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "El Mar Rojo"})
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "El Mar Rojo", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "El Mar Rojo", style = "slide"})

-- Voy a ser honesto, no entiendo ni mierda los bezier JAJAJAJA

hl.window_rule({
   name = "unfocused no-border",
   match = { focus = false },
   border_size = 0
})

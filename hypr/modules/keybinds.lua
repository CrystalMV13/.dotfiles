require("common.programs")

-- reduces delay to consume scroll events as binds. prevents scrolling during zoom
hl.config({
  binds = {
    scroll_event_delay = 0 
  }
})

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Power stuff
hl.bind("SUPER + CTRL + SHIFT + X", hl.dsp.exec_cmd("shutdown now"))
hl.bind("SUPER + CTRL + SHIFT + R", hl.dsp.exec_cmd("shutdown -r now"))

hl.bind("SUPER + SUPER_L", hl.dsp.exec_cmd("nc -U /run/user/1000/walker/walker.sock")) -- faster way to open walker

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + I", hl.dsp.exec_cmd(editor .. " ~/.dotfiles"))
hl.bind("SUPER + A", hl.dsp.window.float())
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  hl.bind("SUPER + " .. key,       hl.dsp.focus({ workspace = i}))
  hl.bind("SUPER + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
-- hl.bind("SUPER + S",     hl.dsp.workspace.toggle_special("magic"))
-- hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Zoom
hl.bind("SUPER + mouse_up", hl.dsp.exec_cmd("pypr zoom ++0.4"))
hl.bind("SUPER + mouse_down", hl.dsp.exec_cmd("pypr zoom --0.4"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Bind super + middle click to closing a window
hl.bind("SUPER + mouse:274", hl.dsp.window.close())

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
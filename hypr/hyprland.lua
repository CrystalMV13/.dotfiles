---@module 'hl'

local monitors = require("monitors")

--##################
--## MY PROGRAMS ###
--##################

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Set programs that you use

local terminal = "kitty"

local browser = "vivaldi --force-device-scale-factor=1"

local fileManager = "dolphin"

local menu = "hyprlauncher"

--################

--## AUTOSTART ###

--################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)

-- Or execute your favorite apps at launch like this:

-- exec-once = hyprctl setcursor catppuccin-mocha-dark-cursors 28

-- exec-once = /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1





--############################

--## ENVIRONMENT VARIABLES ###

--############################

-- See https://wiki.hypr.land/Configuring/Environment-variables/

hl.env("HYPRCURSOR_THEME", "Nordzy-hyprcursors")

hl.env("XCURSOR_SIZE", 32)

hl.env("HYPRCURSOR_SIZE", 32)

--##################

--## PERMISSIONS ###

--##################

-- See https://wiki.hypr.land/Configuring/Permissions/

-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly

-- for security reasons

-- ecosystem {

--   enforce_permissions = 1

-- }

-- permission = /usr/(bin|local/bin)/grim, screencopy, allow

-- permission = /usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland, screencopy, allow

-- permission = /usr/(bin|local/bin)/hyprpm, plugin, allow

--####################

--## LOOK AND FEEL ###

--####################

-- Refer to https://wiki.hypr.land/Configuring/Variables/

-- https://wiki.hypr.land/Configuring/Variables/#general

hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 20,

    border_size = 2,

    col = {
      active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },

    -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
    resize_on_border = false,

    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding     = 10,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity   = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled    = true,
      range    = 4,
      render_power = 3,
      color    = 0xee1a1a1a,
    },

    blur = {
      enabled   = true,
      size    = 3,
      passes  = 1,
      vibrancy  = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },
})

-- https://wiki.hypr.land/Configuring/Variables/#animations

hl.config({
  animations = {
  enabled = true,
  -- Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
  --  NAME,     X0,   Y0,   X1,   Y1
  -- Default animations, see https://wiki.hypr.land/Configuring/Animations/
  --     NAME,    ONOFF, SPEED, CURVE,  [STYLE]
  },
})

hl.config({
  dwindle = {
  -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
  preserve_split = true,
  -- you probably want this
  },
})

-- Ref https://wiki.hypr.land/Configuring/Workspace-Rules/

-- "Smart gaps" / "No gaps when only"

-- uncomment all if you wish to use that.

-- workspace = w[tv1], gapsout:0, gapsin:0

-- workspace = f[1], gapsout:0, gapsin:0

-- windowrule {

--   name = no-gaps-wtv1

--   match:float = false

--   match:workspace = w[tv1]

--

--   border_size = 0

--   rounding = 0

-- }

--

-- windowrule {

--   name = no-gaps-f1

--   match:float = false

--   match:workspace = f[1]

--

--   border_size = 0

--   rounding = 0

-- }

-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more

hl.config({
  dwindle = {
  preserve_split = true,
  -- You probably want this
  },
})

-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more

hl.config({
  master = {
  new_status = "master",
  },
})

-- https://wiki.hypr.land/Configuring/Variables/#misc

hl.config({
  misc = {
  force_default_wallpaper = -1,
  -- Set to 0 or 1 to disable the anime mascot wallpapers
  disable_hyprland_logo = false,
  -- If true disables the random hyprland logo / anime girl background. :(
  },
})

---------------
---- INPUT ----
---------------

hl.config({
  input = {
    kb_layout  = "us",
    kb_variant = "",
    kb_model   = "",
    kb_options = "compose:ins",
    kb_rules   = "",

    follow_mouse = 1,

    accel_profile = "flat",
    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name    = "epic-mouse-v1",
  sensitivity = -0.5,
})
-- NOTE: Section 'device' may be a plugin or custom section; verify the output

--##################
--## KEYBINDINGS ###
--##################

-- See https://wiki.hypr.land/Configuring/Keywords/

-- Power stuff

hl.bind("SUPER + CTRL + SHIFT + X", hl.dsp.exec_cmd("shutdown now"))
hl.bind("SUPER + CTRL + SHIFT + R", hl.dsp.exec_cmd("shutdown -r now"))

-- Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more

hl.bind("SUPER_L", hl.dsp.exec_cmd("nc -U /run/user/1000/walker/walker.sock")) -- faster way to open walker

hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("vivaldi --force-device-scale-factor=1"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + F", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("codium ~/.dotfiles"))
hl.bind("SUPER + V", hl.dsp.window.float())
hl.bind("SUPER + R", hl.dsp.exec_cmd("hyprlauncher"))

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
hl.bind("SUPER + S",     hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

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

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more

-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

-- Example windowrules that are useful

hl.window_rule({
  name  = "suppress-maximize-events",
  match = {
  class = ".*",
  },
  suppress_event = "maximize",
})

hl.window_rule({
  name  = "fix-xwayland-drags",
  match = {
  class = "^$",
  title = "^$",
  xwayland = true,
  float = true,
  fullscreen = false,
  pin = false,
  },
  no_focus = true,
})

-- Hyprland-run windowrule

hl.window_rule({
  name  = "move-hyprland-run",
  match = {
  class = "hyprland-run",
  },
  move = { 20, "monitor_h-120" },
  float = true,
})

hl.window_rule({
  name  = "make-vivaldi-bitwarden-popup-float",
  match = {
  class = "vivaldi-stable",
  title = ". *Bitwarden.*",
  },
  float = true,
})

hl.window_rule({
  name  = "make-dialogs-float",
  match = {
  title = "^$",
  },
  float = true,
})

hl.window_rule({
  name  = "float-thunderbird-editor",
  match = {
  class = "thunderbird",
  title = "Write:.*",
  },
  float = true,
})

hl.window_rule({
  name  = "make-vivaldi-settings-float",
  match = {
  title = "Vivaldi Settings.*",
  },
  float = true,
})

-- Make apps recognize dark mode: https://www.reddit.com/r/hyprland/comments/1byyrix/help_dolphin_theming/
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- more dark mode stuff
hl.env("GTK_THEME", "adw-gtk3-dark")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", 1)

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar & dunst & hyprpaper & hypridle & pypr")
  hl.exec_cmd("elephant & walker --gapplication-service")
  hl.exec_cmd("protonmail-bridge-gui")
  hl.exec_cmd("slack")

  -- Set GTK3 dark theme (replace "Adwaita-dark" with your preferred theme)
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark")

  -- Set GTK4/Libadwaita dark mode preference
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
end)

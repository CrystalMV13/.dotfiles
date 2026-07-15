-- Refer to https://wiki.hypr.land/Configuring/Variables/

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

  cursor = {
      no_hardware_cursors = true, -- might help with some laggy cursors
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
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})

hl.env("HYPRCURSOR_THEME", "Nordzy-hyprcursors")
hl.env("XCURSOR_THEME", "Nordzy-hyprcursors")
hl.env("HYPRCURSOR_SIZE", 32)
hl.env("XCURSOR_SIZE", 32)


---------------------------------
---FORCE DARK MODE RECOGNITION---
---------------------------------
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")

hl.env("GTK_THEME", "adw-gtk3-dark")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", 1)

hl.on("hyprland.start", function()
  -- Set GTK3 dark theme (replace "Adwaita-dark" with your preferred theme)
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark")

  -- Set GTK4/Libadwaita dark mode preference
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme prefer-dark")
end)
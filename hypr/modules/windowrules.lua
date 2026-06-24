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
    title = ".*Bitwarden.*",
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
  name = "picture-in-picture",
  match = {
    title = ".*Picture in picture.*",
  },
  float = true,
  keep_aspect_ratio = true,
})

hl.window_rule({
  name = "float-zoom-meeting",
  match = {
    title = ".*Zoom Meeting",
  },
  float = true,
  keep_aspect_ratio = true,
})

hl.window_rule({
  name  = "make-settings-float",
  match = {
    title = ".*Settings.*",
  },
  float = true,
})

hl.window_rule({
  name = "thunderbird-bigger-write-dialog",
  match = {
    class = "thunderbird",
    title = "Write: .*",
  },
  float = true,
  size = "800 700",
})

hl.window_rule({
  name = "float-dolphin",
  match = {
    class = "org.kde.dolphin",
    title = "negative:^(Properties.*|Copying.*|(File|Folder) Already Exists.*|View Display Style.*|Question.*|Moving.*|Paste Clipboard Content.*|Choose Application.*)$"
  },
  float = true,
  size = "1200 950"
})

hl.window_rule({
  name = "float-thunderbird-dialogs",
  match = {
    class = "thunderbird",
    initial_title = "Calendar Reminders",
  },
  float = true,
})

hl.window_rule({
  name = "float-astroimagej",
  match = {
    class = "ij-ImageJ",
    title = "AstroImageJ",
  },
  float = true,
})
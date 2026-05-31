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
  name  = "make-vivaldi-settings-float",
  match = {
  title = "Vivaldi Settings.*",
  },
  float = true,
})
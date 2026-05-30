commands = {
  -- services
  "waybar",
  "dunst",
  "hyprpaper",
  "hypridle",
  "pypr",
  "elephant & walker --gapplication-service",
  
  -- apps
  "protonmail-bridge-gui",
  "slack",
}

hl.on("hyprland.start", function()
  for command in list_iter(commands) do
    hl.exec_cmd(command)
  end
end)
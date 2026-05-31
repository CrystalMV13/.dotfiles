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
  for _, command in ipairs(commands) do
    hl.exec_cmd(command)
  end
end)
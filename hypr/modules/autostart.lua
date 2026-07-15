local commands = {
  -- services
  "noctalia",
  "pypr",
  "qs -c overview",
  "elephant",
  "walker --gapplication-service",
  "moniqued",
  
  -- apps
  "protonmail-bridge-gui --no-window",
}

hl.on("hyprland.start", function()
  for _, command in ipairs(commands) do
    hl.exec_cmd(command)
  end
end)
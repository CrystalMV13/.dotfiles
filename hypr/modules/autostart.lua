local commands = {
  -- services
  "noctalia",
  "pypr",
  "qs -c overview",
  "walker --gapplication-service",
  
  -- apps
  "proton-bridge --noninteractive",
}

hl.on("hyprland.start", function()
  for _, command in ipairs(commands) do
    hl.exec_cmd(command)
  end
end)
require("common.programs")
local smw = require("plugins.split-monitor-workspaces")

smw.setup({
  workspace_count = 10,
  monitor_priority = { "eDP-1", },
})

for i = 1, smw.get_amount_of_workspaces() do
    local n = tostring(i)
    if n == "10" then n = "0" end
    hl.bind("SUPER + " .. n, smw.workspace(n)) -- these binds action on the current workspace thanks to smw
    hl.bind("SUPER + SHIFT + " .. n, smw.move_to_workspace(n))
    hl.bind("SUPER + SHIFT + ALT + " .. n, smw.move_to_workspace_silent(n))
end

-- Terminal workspace
hl.on("hyprland.start", function ()
    hl.exec_cmd(terminal, { workspace = "special:terminal silent" })
end)
hl.bind("ALT + T", hl.dsp.workspace.toggle_special("terminal"))

-- Thunderbird workspace
hl.on("hyprland.start", function ()
  hl.exec_cmd("thunderbird", { workspace = "special:thunderbird silent" })
end)
hl.bind("ALT + B", hl.dsp.workspace.toggle_special("thunderbird"))

-- Music workspace
hl.window_rule({
  name = "music-workspace",
  match = { title = "YouTube Music.*" },
  workspace = "special:music"
})
hl.bind("ALT + M", hl.dsp.workspace.toggle_special("music"))

-- Slack workspace
hl.on("hyprland.start", function ()
  hl.exec_cmd("slack", { workspace = "special:slack silent" })
end)
hl.bind("ALT + S", hl.dsp.workspace.toggle_special("slack"))

-- Obsidian workspace
hl.on("hyprland.start", function ()
  hl.exec_cmd("obsidian", { workspace = "special:obsidian silent" })
end)
hl.bind("ALT + N", hl.dsp.workspace.toggle_special("obsidian"))

hl.config({
  misc = {
    focus_on_activate = true, -- allow windows to focus, esp. when I need to switch workspaces
  },
})
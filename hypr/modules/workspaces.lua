require("common.programs")

hl.config({
  misc = {
    focus_on_activate = true,
  },
})

-- Terminal workspace
hl.on("hyprland.start", function ()
    hl.exec_cmd(terminal, { workspace = "special:terminal silent" })
end)
hl.bind("ALT + T", hl.dsp.workspace.toggle_special("terminal"))

-- Thunderbird workspace
hl.on("hyprland.start", function ()
  hl.exec_cmd("thunderbird", { workspace = "special:terminal silent" })
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
hl.window_rule({
  name = "slack-workspace",
  match = { class = "slack" },
  workspace = "special:slack"
})
hl.bind("ALT + S", hl.dsp.workspace.toggle_special("slack"))
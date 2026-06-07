-- Music workspace
hl.window_rule({
  name = "music-workspace",
  match = { title = "YouTube Music.*" },
  workspace = "special:music"
})
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("music"))

-- Slack workspace
hl.window_rule({
  name = "slack-workspace",
  match = { class = "slack" },
  workspace = "special:slack"
})
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("slack"))
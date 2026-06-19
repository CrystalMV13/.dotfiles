hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

hl.gesture({
  fingers = 3,
  direction = "up",
  action = function () hl.exec_cmd("qs ipc -c overview call overview toggle") end,
})
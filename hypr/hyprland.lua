---@module 'hl'

local EXCLUDED_MODULES = {}

local modules_dir = os.getenv("HOME") .. "/.config/hypr/modules"

for filename in io.popen('ls -a "' .. modules_dir .. '"'):lines() do
  if filename:sub(-4) == ".lua" then
    local module_name = filename:sub(1, #filename - 4)
    require("modules." .. module_name)
  end
end

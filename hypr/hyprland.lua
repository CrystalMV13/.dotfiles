---@module 'hl'

local EXCLUDED_MODULES = {}
local HYPR_DIR = os.getenv("HOME") .. "/.config/hypr/"

local function get_module_name(module_filepath)
  local module_path_from_hypr_config = string.sub(module_filepath, string.len(HYPR_DIR) + 1, string.len(module_filepath) - 4)
  return string.gsub(module_path_from_hypr_config, "/", ".")
end

local function is_excluded(excluded, module_name)
  for _, ex in ipairs(excluded) do
    if ex == module_name then
      return true
    end
  end

  return false
end

-- This function recursively requires all .lua files in the folder, except those
-- excluded.
local function rrequire(folder, excluded)
  -- Requires .lua files in this folder.
  local function require_lua_files(folder, excluded)
    local command = string.format('ls "%s" | grep .lua', folder)

    for file in io.popen(command):lines() do
      local file_is_lua = file:sub(-4) == ".lua"
      local file_is_main_config = file == "hyprland.lua"
      if file_is_lua and not file_is_main_config then
        local module_name = get_module_name(folder .. file)
        local module_is_excluded = is_excluded(EXCLUDED_MODULES, module_name)
        if not module_is_excluded then
          require(module_name)
        end
      end
    end
  end

  -- Recursively require subdirectories
  local function rrequire_subdirs(folder)
    local command = string.format('ls -p "%s" | grep /', folder)
    
    for subdir in io.popen(command):lines() do
      rrequire(folder .. subdir, excluded)
    end
  end

  require_lua_files(folder, excluded)
  rrequire_subdirs(folder)
end

-- local EXCLUDED_MODULES = {}

-- local modules_dir = os.getenv("HOME") .. "/.config/hypr/modules"

-- for filename in io.popen('ls -a "' .. modules_dir .. '"'):lines() do
--   if filename:sub(-4) == ".lua" then
--     local module_name = filename:sub(1, #filename - 4)
--     require("modules." .. module_name)
--   end
-- end


rrequire(HYPR_DIR)

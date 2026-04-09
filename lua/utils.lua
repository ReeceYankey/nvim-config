-- lua/utils.lua
local M = {}

local function read_os_release()
  local f = io.open("/etc/os-release", "r")
  if not f then return {} end
  local result = {}
  for line in f:lines() do
    local k, v = line:match('^([%w_]+)="?([^"]*)"?$')
    if k then result[k] = v end
  end
  f:close()
  return result
end

local os_release = read_os_release()
M.is_nix = os_release.ID == "nixos"

return M

-- convert byte integer to human readable units
-- example usage: $ lua byte_conversion.lua 1024

local function unit(bytes)
  local units = {"B", "KB", "MB", "GB", "TB"}
  local i = 1
  while bytes >= 1024 and i < #units do
    bytes = bytes / 1024
    i = i + 1
  end
  return string.format("%.2f %s", bytes, units[i])
end


local bytes = tonumber(arg[1]) or 1234567890

io.stdout:write(unit(bytes)):flush()

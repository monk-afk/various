--[[
  create a table with an index of it's own unique hash identifier

  id = "0x564107ab9f60"
  unique = {
    ["0x564107ab9f60"] = "0x564107ab9f60"
  }
]]
local unique = {}
local id = tostring(unique):sub(8)
unique[id] = id

local output = tostring(unique)..id..unique[id]


io.stdout:write(output,"\n"):flush()
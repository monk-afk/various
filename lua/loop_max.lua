--[[
  For looping through a series with a variable that
  doesn't go over max number
]]

local numbers = {}

local max = 10
for int = 0, 19 do
  local counter = ((int) % (max)) + 1
  table.insert(numbers, counter)
end

print(table.concat(numbers, " "))

-- 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10
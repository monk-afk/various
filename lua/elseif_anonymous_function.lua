--[[
  Defines anonymous function as conditional
  The same thing could be accmplished by
  defining the function outside of the conditional
  so this is kindof pointless
]]


if false then
  print("1")
elseif (function() print("2") return false end)() then
  print("3")
elseif (function() print("4") return true end)() then
  print("5")
else
  print("6")
end


print("\n")
-- for example:

local og = 2  -- set a variable to determine print condition

if og == 0 then
  print("#1", og)

elseif (function()
      og = og - 3 --> -1
      return og == 2  -- returns false condition
    end)() then
  print("doesn't print")

elseif (function()
      og = og + 3 ; --> 2
      return og == 2 --> returns true condition
    end)() then
  print("will print, og=", og)

else
  return "doesnt print"
end
--[[
  Round a float number to the nearest digit
  > fround(1.235, 2) -- rounds to the 2nd digit after decimal
  Floating point precision is screwy
]]

local x, d = tonumber(arg[1]) or 1.54, tonumber(arg[2]) or 2

local function fround(x, d)
  local e = "1e"..d
  local x = (x * e) - ("1e-"..d)
  local p = string.find(x, "%.")

  if not p then return x end
  local z = string.sub(x, p+1, p+2)

  if z - ("4.9"..string.rep("9", d)) < 0 then
    return math.floor(x)/e
  else
    return math.ceil(x)/e
  end
end


print(fround(x, d))                -- 1.54
print(fround(1.9999999999,9))      -- 2.0  < -- this is a bug
print(fround(1.5555555555,9))      -- 1.555555556
print(fround(1.0987654321,9))      -- 1.098765432
print(fround(1.0000000099,9))      -- 1.00000001
print(fround(1.0000000999,9))      -- 1.0000001
print(fround(1.0000000909,9))      -- 1.000000091
print(fround("0."..os.time(), 9)   -- 0.172528739
         .."\n  "..os.time())      --   1725287391

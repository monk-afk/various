--[[ for using command line options to check if a flag is set,
     or to get the value of the flag itself:
]]

local cmdop = {}
for p = 1, #arg do
  cmdop[p] = string.gsub(arg[p], "%-*(%w+)=*(%S*)", function(param, val)
    cmdop[param] = val
    return param, val
  end)
end

  -- $ lua cmdop.lua firstop --secondop=100 third=op
for k,v in pairs(cmdop) do
  print(k,v)
  -- > 1         firstop
  -- > 2         secondop
  -- > 3         op
  -- > firstop   (empty)
  -- > secondop  100
  -- > third     op
end

print(cmdop[1])  -- > firstop
print(cmdop[2])  -- > secondop
print(cmdop[3])  -- > third

print(cmdop.firstop)   -- (empty)
print(cmdop.secondop)  -- 100
print(cmdop.third)     -- op
print(cmdop.noop)      -- nil
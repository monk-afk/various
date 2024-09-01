local cmdop = {}
for p = 1, #arg do
  cmdop[p] = string.gsub(arg[p], "%-*(%w+)", function(param)
    cmdop[param] = true
    return param
  end)
end
--[[ for using command line options to check if a flag is set,
     or to get the value of the flag itself:

  -- $ lua test.lua firstop secondop
  print(cmdop.firstop)  -- > true
  print(cmdop.secondop) -- > true
  print(cmdop.noop)     -- > nil
  print(cmdop[1])       -- > firstop
  print(cmdop[2])       -- > secondop
]]
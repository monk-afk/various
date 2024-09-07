-- pause a running function for integer or decimal seconds
-- $ lua wait.lua 0.3

local function wait(T)
  local ttl = T + os.clock()
  while true do
    if os.clock() - (ttl) >= 0 then
      break
    end
  end
end

local T = tonumber(arg[1]) or 3
while true do
  print("waiting "..T.." seconds...")
  wait(T)
  print("done!", "wait again? (y/n)")
  local response = io.read("*line"):match("%a")
  if response ~= "y" then
    break
  end
end

print("total wait time: "..os.clock())

-- pause a running function for integer or decimal seconds
-- $ lua wait.lua 0.3

local T = tonumber(arg[1]) or 3

print("waiting "..T.." seconds...")

local function wait(T)
  while true do
    if os.clock() - T >= 0 then
      break
    end
  end
end

wait(T)

print("done!", os.clock())
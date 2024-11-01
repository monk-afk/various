-- pause a running function for integer or decimal seconds
-- this is also threadlocking
-- $ lua wait.lua 0.3

local function wait(T)
  local ttl = T + os.clock()
  while true do
    if os.clock() - (ttl) >= 0 then
      break
    end
  end
end

local msg = function(txt) io.stdout:write(txt,"\n"):flush() end

local T = tonumber(arg[1]) or 3
msg("waiting " .. T .. " seconds...")
wait(T/2)
msg("halftime: " .. os.clock())
wait(T/2)
msg("total wait time: "..os.clock())

--[[
  $ time lua wait.lua 5
    waiting 5 seconds...
    halftime: 2.500918
    total wait time: 5.00096

    real	0m5.002s
    user	0m1.156s
    sys	0m3.845s
]]
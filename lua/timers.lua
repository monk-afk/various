-- commented functions will run forever
-- os.execute will block the interrupt signal, but without will use max cpu thread

-- simulates an autosave every 5 seconds
local save_interval = 5
local next_save = os.time() + save_interval
local function autosave(time)
  if time >= next_save then
    next_save = time + save_interval
    print("next save: "..next_save)
  end
  --  os.execute("sleep 0.1")
  return autosave(os.time())
end
-- autosave(os.time())

-- countdown timer (bug counts until infinity)
local time_lock = os.time()
local t = time_lock
local function countdown(timer)
  if t + 1 <= timer then
    t = timer
    print((time_lock + 100) - timer)
  end
  -- os.execute("sleep 0.1") 

  timer = timer == os.time() and timer or os.time()
  return countdown(timer)
end
-- countdown(os.time())


local mf = math.floor
local mfm = math.fmod
function seconds_to_dhm(timeout)
    local time = (timeout + 259200) - os.time()
    local h = mf(time/3600)
    local m = mf(mfm(time,3600)/60)
  return string.format("%02d:%02d", h,m)
end

local timeout = os.time() - 120

print(seconds_to_dhm(os.time())) -- 72:00 hours
print(seconds_to_dhm(timeout)) -- 71:58 hours
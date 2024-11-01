--[[ random time stuff for minetest ]]
local path = minetest.get_modpath(minetest.get_current_modname()).."/"
local int = 1
local mf = math.floor
local time_of_day = minetest.get_timeofday
local game_time = minetest.get_gametime
local day_count = minetest.get_day_count

local function format_time(time)
  return string.format("%02dh:%02dm",
    mf(time / 60),
    mf(time % 60)
  )
end

local function epoch()
  return (os.time() - os.time({ year = 2023, month = 5, day = 28, hour = 20, min = 1, sec = 34 }))
end

local function game_date()
  return os.date("*t", ((day_count() * 86400) + (time_of_day() * 86400) - 62167203936))
  -- return os.date("%b/%d/%Y %H:%M", ((day_count() * 86400) + (time_of_day() * 86400) - 62167203936))
end

local function set_time_speed(n)
  core.settings:set("time_speed", n)
  core.settings:write()
end

local function purge_countdown()
  local purge_time = os.time() + int

  print(dump(game_date()))
  -- print("game date " .. game_date())

  print("epoch " .. epoch())
  print("raw time of day " .. time_of_day())
  print("calc time of day " .. format_time(time_of_day() * 1440))
  print("game time " .. game_time())
  print("day count " .. day_count())
  print("purge time " .. purge_time)

  if time_of_day() < 0.5 then
    set_time_speed(1)
  elseif time_of_day() > 0.6 then
    -- set_time_speed(50)
  -- else
    set_time_speed(600)
  end

  minetest.after(int, purge_countdown)
end
minetest.after(int, purge_countdown)

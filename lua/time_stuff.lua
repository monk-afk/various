-- messing with time
local mf = math.floor
local mfm = math.fmod
local sec = 365.25775462963 * 86400
print(sec) --> 31558270.0
local mo = sec/13.35
print(mo) --> 2363915.3558052

local function fmt(time)
  return {
    y = mf(time/31556952), -- 365.2425 * 86400 (days per Gregorian year)
    M = mf(mfm(time,31556952)/2629746), -- year seconds / 12
    d = mf(mfm(time,2629746)/86400), -- month seconds / 86400
    h = mf(mfm(time,86400)/3600), -- day seconds / 3600
    m = mf(mfm(time,3600)/60), -- hour seconds / 60
    s = mf(mfm(time,60))
  }
end

local function fmt2(time)
  return {
    y = mf(time/sec), -- 365.2425 * 86400 (days per Gregorian year)
    d = mf(mfm(time,sec)/86400),
    h = mf(mfm(time,86400)/3600),
    m = mf(mfm(time,3600)/60),
  }
end

local zero = os.time({year = -1, month = 12, day = 0, hour = -1, min = 45, sec = 36})
local epoch = os.time() - zero

local fz = fmt(-zero)
local fe = fmt(epoch)
local fe2 = fmt2(epoch)

print(
  "Time since 0AD: " .. epoch.." seconds\n"..
  "z-yMdhms: "..string.format("%04dAD, %d/%d, %02d:%02d:%02d", fz.y,fz.M,fz.d,fz.h,fz.m,fz.s).."\n"..
  "  yMdhms: "..string.format("%04dAD, %d/%d, %02d:%02d:%02d", fe.y,fe.M,fe.d,fe.h,fe.m,fe.s).."\n"..
  "    ydhm: "..string.format("%04dAD, %d, %02d:%02d", fe2.y,fe2.d,fe2.h,fe2.m).."\n"..
  "Current Time: " .. os.date("%YAD %m/%d %H:%M:%S", os.time())
)
--[[ 
    Time since 0AD: 63900017518 seconds
    z-yMdhms: 1970AD, 1/1, 20:00:00
      yMdhms: 2024AD, 10/28, 12:51:58
        ydhm: 2024AD, 301, 12:51
    Current Time: 2024AD 10/27 13:51:58
 ]]


	-- simple benchmark
local osc = os.clock()
	--> Insert functions
osc = string.format("%.7f", os.clock() - osc)
	print(osc.."\n") --> 0.0000030
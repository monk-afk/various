--[[ trying to find good randoms
  gets a character from from /dev/random
  selects a number from 1 to 10
  loop until n'th iteration
  returns the last number from the character byte
]]
local N = arg[1] or 10000
print("  >> Counting "..N.." Randoms\27[6m...\27[0m")


local function charset()
  local function pick()
    local chars = "123456789012345678901234567890"
    local n = math.random(1,10)
    for i = 1,10 do
      if n == i then
        local r = math.random(#chars)
        return chars:sub(r,r)
      end
    end
  end
  return pick()
end


local function strand()
  local function pick()
    local n = math.random(1,10)
    for i = 1,10 do
      if n == i then
        return string.char(math.random(string.byte(0),string.byte(9)))
       end
    end
  end
  return pick()
end


local function rando() 
  local function pick()
    local n = math.random(1,10)
    for i = 1,10 do
      if n == i then
        return string.sub((math.random(0,9)), -1)
       end
    end
  end
  return pick()
end

local function entropy()
  local io_file = (io.open("/dev/random", "rb"))
  local rnd = io_file:read()
  local function pick()
    local n = math.random(1,10)
    for i = 1,10 do
      if n == i then
        return string.sub((string.byte(rnd) or math.random()), -1)
       end
    end
  end
  return pick()
end


local function get_picks(n, from_method)
  local counter = {[0]=0,[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0,[7]=0,[8]=0,[9]=0}
  
  for m = 1,n do
    local x = tonumber(from_method())
    local i = counter[x] + 1
    counter[x] = i
  end

  return counter
end

local function count_randoms(from_method)
  local z = 0
  local counter = get_picks(N, from_method)
  local ratios = {}

  for n = 0,9 do
    local l = counter[n]
    ratios[n] = (l/N*100)
  end

  for n = 0,9 do
    print(n, counter[n], string.format("%.2f", ratios[n]).."%")
  end
end

print("\nfrom /dev/random")
count_randoms(entropy)
print("\nfrom math.random")
count_randoms(rando)
print("\nfrom chars")
count_randoms(charset)
print("\nfrom chars")
count_randoms(strand)


--[[ 
  from /dev/random
  0	9747	9.75%
  1	10294	10.29%
  2	9909	9.91%
  3	10270	10.27%
  4	10317	10.32%
  5	10069	10.07%
  6	9780	9.78%
  7	9807	9.81%
  8	9978	9.98%
  9	9829	9.83%

  from math.random
  0	9993	9.99%
  1	9845	9.84%
  2	10098	10.10%
  3	9963	9.96%
  4	10043	10.04%
  5	10018	10.02%
  6	9881	9.88%
  7	10095	10.10%
  8	9967	9.97%
  9	10097	10.10%

  from chars
  0	9908	9.91%
  1	10167	10.17%
  2	9942	9.94%
  3	9782	9.78%
  4	10000	10.00%
  5	10018	10.02%
  6	10185	10.18%
  7	9917	9.92%
  8	9979	9.98%
  9	10102	10.10%

  from chars
  0	9896	9.90%
  1	9923	9.92%
  2	10075	10.08%
  3	10099	10.10%
  4	10016	10.02%
  5	10036	10.04%
  6	10036	10.04%
  7	9949	9.95%
  8	9923	9.92%
  9	10047	10.05%
 ]]
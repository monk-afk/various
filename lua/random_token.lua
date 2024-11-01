--[[ for random tokens:
  pkvbVeYls3pL	IFW8HxnAUOTl	FpyqsS7xjPGV	OQw4jrmPI7yj	WWPbUhZd6mhX
]]
local rand = math.random
local function generate_backup_codes()
  local chars = "SmK96xNTXjhylqLnidZpkDgsCHVM7cJr302aewAEBWQFOtR14zGPbY5vuUoI8f"
  local backup_codes = {}
  for n = 1,5 do
    for c = 1,12 do
      local r = rand(#chars)
      backup_codes[n] = (backup_codes[n] or "") .. chars:sub(r,r)
    end
  end
  return backup_codes
end

local tmp = generate_backup_codes()
print(tmp[1], tmp[2], tmp[3], tmp[4], tmp[5])

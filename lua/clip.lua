        ---------------
  --==[[  CLI Params  ]]==--
  --==[[ © 2024 monk  ]]==--
        ---------------
--[[
  parses command line parameters to build a table
    containing both a numeric and associative index.
    this allows evaluating the table using any iterator method

  UNIX-type arguments separated by spaces, with or without leading hyphen:
    - for valued associatives, use 'param=value'
    - standalone arguments are boolean true, and numerically indexed

Example:

  $ lua ~/lua/clip.lua --arg1="the long string" arg2 num=9 -a 889

The table produced:

  clip = {
    "arg1", "arg2", "num", "a", "889", -- numeric array first
    [0] = "clip.lua",                  -- clip[0] always is the file name
    ["clip.lua"] = "/home/user/lua/",  -- gives the path
    arg1 = "the long string",          -- strings stay strings
    arg2 = true, a = true,             -- standalone args become boolean
    num = 9,                           -- numbers stay numbers if associated
    ["889"] = true                     -- standalone numbers become boolean
  }
]]

------------------------------------------------------------

local clip = {}

  -- assign the file name and path to -1 and 0
clip[0] = string.gsub(arg[0], "^([%w/]-/?)([%w%.]+)$",
  function(path, file)
    clip[file] = path -- makes key = val
    return file, path -- makes index[n]
  end)

  -- evaluate argumets after the file
for p = 1, #arg do
  clip[p] = string.gsub(arg[p], "%-*([%w-]+)=?([%s%S]*)",
    function(param, val)
      clip[param] = val == "" or tonumber(val) or val
      return param, val
    end)
end

------------------------------------------------------------

--[[ Examples ]]

  -- iterate through pairs, ipairs, or array
for k, v in pairs(clip) do
  print("k,v in pairs ", k, v)
end

for _,v in ipairs(clip) do
  print("v in ipairs", v)
end

for v = 1, #clip do
  print("v = 1,#clip", v, clip[v])
end

  -- get path (if included) and filename:
print(
  "File name", clip[0]
)
print(
  "Full path", clip[clip[0]]
)

  -- table.concat will only concatenate the array 
print(
  "table.concat", table.concat(clip, ", ")
)

--[[
$ lua ~/lua/clip.lua --arg1="the long string" arg2 num=9 -a 889
		k,v in pairs	1	arg1
		k,v in pairs	2	arg2
		k,v in pairs	3	num
		k,v in pairs	4	a
		k,v in pairs	0	clip.lua
		k,v in pairs	clip.lua	/home/user/lua/
		k,v in pairs	889	true
		k,v in pairs	a	true
		k,v in pairs	arg1	the long string
		k,v in pairs	5	889
		k,v in pairs	arg2	true
		k,v in pairs	num	9
		v in ipairs		1
		v in ipairs		2
		v in ipairs		3
		v in ipairs		4
		v in ipairs		5
		v = 1,#clip		1	arg1
		v = 1,#clip		2	arg2
		v = 1,#clip		3	num
		v = 1,#clip		4	a
		v = 1,#clip		5	889
		File name			clip.lua
		Full path			/home/user/lua/
		table.concat	arg1, arg2, num, a, 889
]]
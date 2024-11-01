-- printed ansi colors
-- colors may vary due

-- use unset to stop the colors

local set   = "\27["
local unset = "\27[0m"

-- clear is to clear the terminal like the clear command
local function clear(string)  return set.."2J"..tostring(string)..unset end
local function blink(string)  return set.."5m"..tostring(string)..unset end

local function black(string)  return set.."30m"..tostring(string)..unset end
local function red(string)    return set.."31m"..tostring(string)..unset end
local function green(string)  return set.."32m"..tostring(string)..unset end
local function yellow(string) return set.."33m"..tostring(string)..unset end
local function blue(string)   return set.."34m"..tostring(string)..unset end
local function mauve(string)  return set.."35m"..tostring(string)..unset end
local function cyan(string)   return set.."36m"..tostring(string)..unset end
local function white(string)  return set.."37m"..tostring(string)..unset end
 
local function bold(string)   return set.."1m"..tostring(string)..unset end
local function faint(string)  return set.."2m"..tostring(string)..unset end
local function italic(string) return set.."3m"..tostring(string)..unset end
local function invert(string) return set.."7m"..tostring(string)..unset end
local function strike(string) return set.."9m"..tostring(string)..unset end
local function under(string)  return set.."4m"..tostring(string)..unset end
local function over(string)  return set.."53m"..tostring(string)..unset end

io.stdout:write(
  under(green("This test") .. " " .. over("is the test")), "\n",
  red(invert("This test is the test")), "\n",
  blue("This test is the test"), "\n"
)


local function c(color, string)
  return tostring(color..string.."\27[0m")
end


local function test_colors()
  for n = 0, 128 do
  io.stdout:write(
      string.format("\27[%dm[%d]\27[0m ", n, n), "\n"
    )
  end
end
test_colors()


-- unset
local set   = "\27["
local unset = "\27[0m"
-- formatting
local clear  = "\27[2J" 
local blink  = "\27[5m" 
local bold   = "\27[1m" 
local faint  = "\27[2m" 
local italic = "\27[3m" 
local invert = "\27[7m" 
local strike = "\27[9m" 
local under  = "\27[4m" 
local under2 = "\27[21m" 
local over   = "\27[53m"
local nl     = "\n"
-- monochrome
local black  = "\27[30m"
local white  = "\27[29m"
local l_grey = "\27[37m"
local d_grey = "\27[90m"
-- dark colors
local d_red    = "\27[31m"
local d_green  = "\27[32m"
local d_yellow = "\27[33m"
local d_blue   = "\27[34m"
local d_mauve  = "\27[35m"
local d_cyan   = "\27[36m"
-- not dark colors
local red    = "\27[91m"
local green  = "\27[92m"
local yellow = "\27[93m"
local blue   = "\27[94m"
local mauve  = "\27[95m"
local cyan   = "\27[96m"
-- background colors
local bg_black  = "\27[40m"
local bg_grey   = "\27[47m"
local bg_smoke  = "\27[100m"
local bg_white  = "\27[107m"
local bg_red    = "\27[41m"
local bg_green  = "\27[42m"
local bg_orange = "\27[43m"
local bg_blue   = "\27[44m"
local bg_violet = "\27[45m"
local bg_cyan   = "\27[46m"
local bg_ruby    = "\27[101m"
local bg_lime    = "\27[102m"
local bg_banana  = "\27[103m"
local bg_ocean   = "\27[104m"
local bg_aqua    = "\27[105m"
local bg_magenta = "\27[106m"

local function c(color, string) 
return tostring(color..string.."\27[0m") end
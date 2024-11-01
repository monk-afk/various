-- notes about file operations

local file = io.open("tempfile.tmp", "w+")
-- w+ clears the file when opened, does read/write
-- r+ keeps contents intact, cursor start of file, r/w
-- a+ append, r read-only, w write-only

file:write("play\n")
file:flush() -- flush writes to disk

file:seek("set", 0) -- seek is for the cursor position, writing and reading moves the cursor
local play = file:read("*l")
io.stdout:write(play, "\n") -- its better to use comma than to concatate with ..

file:seek("end", -4) -- cursor offset from position (prints "pork")
file:write("ork\n")
file:flush()

file:seek("set", 0)
stat = file:read("*l")

io.stdout:write(stat, "\n") -- make sure to flush contents if pipe is open (popen)

file:close()
os.remove("tempfile.tmp")
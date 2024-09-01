# luabin

run functions like commands within a terminal session

basically it'll run lua scripts from files in the bin folder

start a session with `lua init.lua` and run a command in this manner:


> `command param1 param2 etc`

if the file `command.lua` exists within the bin directory, it will run the function


init.lua also passes a context table as a function variable

to exit the session gracefully, enter `/q`


it's a basic implementation of an interactive lua terminal, but it works for what i needed it for
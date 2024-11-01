  --==[[ interactive_Lua - init.lua - 0.0.1 ]]==--

local context = {}
  print(" > Enter a command or /q to quit ")

while true do
  local command, params = nil, {}
  print(" >> ")

  io.read("*line"):gsub("(/?%w+)%s*", function(param)
    if not command then
      command = param
    else
      params[#params+1] = param
    end
  end)

  if command == "/q" then
    return print("Terminated!")

  elseif not command or command == "" then
    print(" >> ")

  else
    local path = "bin/"..command..".lua"
    local file = io.open(path, "r")

    if file then
      file:close()

      local status, err = pcall(function()
        return dofile(path)(context, params)
      end)

      if not status then
        print("Error:", err)
      end
    end
  end
end





-------------------------------------------------------------------------------------
-- MIT License                                                                     --
--                                                                                 --
-- Copyright (c) 2024 monk                                                         --
--                                                                                 --
-- Permission is hereby granted, free of charge, to any person obtaining a copy    --
-- of this software and associated documentation files (the "Software"), to deal   --
-- in the Software without restriction, including without limitation the rights    --
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell       --
-- copies of the Software, and to permit persons to whom the Software is           --
-- furnished to do so, subject to the following conditions:                        --
--                                                                                 --
-- The above copyright notice and this permission notice shall be included in all  --
-- copies or substantial portions of the Software.                                 --
--                                                                                 --
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR      --
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,        --
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE     --
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER          --
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,   --
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE   --
-- SOFTWARE.                                                                       --
-------------------------------------------------------------------------------------
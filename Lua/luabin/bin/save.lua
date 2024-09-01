-- save.lua -- adds params to the context table by index
--[[
  run like this: > save key value1 value2
    will save: context[key] = {value1, value2}
]]

local function ctx(context, params)

  if #params >= 2 then
    local index = params[1]
    context[index] = {}

    for n = 2, #params do
      table.insert(context[index], params[n])
    end
    print('Added: context["'..index..'"] = {"'..table.concat(context[index], '", "')..'"}')
  end
end

return ctx
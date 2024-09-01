-- echo.lua -- it just prints the params

local function echo(context, params)
  if #params >= 1 then
    for n = 1, #params do
      print(params[n])
    end
  end
end

return echo
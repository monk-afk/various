-- minetest callbacks without running the engine

minetest = {
  check_player_privs = function(player, privs)
    return player.privs and player.privs.server or false
  end,

  chat_send_player = function(player_name, message)
    print("[Server] " .. player_name .. ": " .. message)
  end,
  
  itemstack = {
    count = 1,
    take_item = function(self)
      self.count = self.count - 1
      return self
    end
  }
}


local function priv_check(itemstack, player, pointed_thing, original_function)
  if not minetest.check_player_privs(player, {server = true}) then
    itemstack:take_item()
    return itemstack
  end

  return original_function(itemstack, player, pointed_thing)
end


local function template(context)
  return {
    on_use = function(itemstack, player, pointed_thing)
      return priv_check(itemstack, player, pointed_thing, function(itemstack, player, pointed_thing)
        minetest.chat_send_player(player.name, "message to player")
        return itemstack
      end)
    end
  }
end


local function test()
  local with_privs = { name = "monk", privs = { server = true } }
  local without_privs = { name = "notmonk", privs = { server = false } }

  local itemstack = { count = 1, take_item = minetest.itemstack.take_item }

  local methods = template(nil)

  print("test with privs")
  methods.on_use(itemstack, with_privs, nil)
  print("Itemstack count:", itemstack.count)

  print("\ntest without privs")
  methods.on_use(itemstack, without_privs, nil)
  print("Itemstack count:", itemstack.count)
end


test()

--[[
  test with privs
  [Server] monk: message to player
  Itemstack count:	1

  test without privs
  Itemstack count:	0
]]
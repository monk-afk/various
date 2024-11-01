-- local str = arg[1]
-- local h = 5381

-- for c in str:gmatch(".") do
--   h = (math.sqrt(h * 2 ^ 9.36) + h) + string.byte(c)
-- end
-- print(string.format("%.f", h))

local function encrypt(text, key)
  local encrypted_text = ""
  for i = 1, #text do
      local char = text:sub(i, i)
      local key_char = key:sub(i % #key, i % #key)
      -- encrypted_text = encrypted_text .. string.char(
        print(string.byte(char) ^ string.byte(key_char))
        -- )
  end
  return encrypted_text
end

local function decrypt(text, key)
  local decrypted_text = ""
  for i = 1, #text do
      local char = text:sub(i, i)
      local key_char = key:sub(i % #key, i % #key)
      decrypted_text = decrypted_text .. string.char(string.byte(char) ^ string.byte(key_char))
  end
  return decrypted_text
end



local text = "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
local key = "my_secret_key"

local encrypted_text = encrypt(text, key)
print("Encrypted Text: " .. encrypted_text)

local decrypted_text = decrypt(encrypted_text, key)
print("Decrypted Text: " .. decrypted_text)

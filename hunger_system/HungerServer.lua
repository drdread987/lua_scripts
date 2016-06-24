
local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("HungerBar", {})


player_hunger_table = {}

local function OnLoginPlayer(event, player)

	local guid = player:GetGUIDLow()
	
	local char_query = CharDBQuery("select hunger from character_saved_hunger where guid = "..guid)
	
	local player_hunger = 100
	
	if char_query == nil then
	
		CharDBExecute("INSERT INTO character_saved_hunger(guid, hunger) VALUES("..guid..",100)")
		
	else
	
		player_hunger = char_query:GetInt32(0)
		
	end
	
	
	player_hunger_table[guid] = player_hunger
	AIO.Handle(player, "HungerBar", "OnLogin")

end



local function OnLogoutPlayer(event ,player)
	local guid = player:GetGUIDLow()
	local hunger = player_hunger_table[guid]
	
	CharDBExecute("UPDATE character_saved_hunger SET hunger = "..hunger.." WHERE guid = "..guid)

end

RegisterPlayerEvent(3, OnLoginPlayer)
RegisterPlayerEvent(4, OnLogoutPlayer)
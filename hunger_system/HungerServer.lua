
local AIO = AIO or require("AIO")


local MyHandlers = AIO.AddHandlers("HungerBar", {})


player_hunger_table = {}

function hunger_ticker(event, timer, delay, player)

	local level = player:GetLevel()
	
	local deficit = 1
	
	if level > 30 then
	
		deficit = 3
		
	elseif level > 50 then
	
		deficit = 5
		
	end

	player_hunger_table[player:GetGUIDLow()] = player_hunger_table[player:GetGUIDLow()] - (deficit)
	
	if player_hunger_table[player:GetGUIDLow()] < 0 then
	
		player_hunger_table[player:GetGUIDLow()] = 0
		
	end
	
	update_display_hunger(AIO.Msg(), player):Send(player)

end

function update_display_hunger(msg, player)

	local hunger = player_hunger_table[player:GetGUIDLow()]
	
	return msg:Add("HungerBar", "GetHungerPct", hunger)

end

local function OnLoginPlayer(event, player)

	local guid = player:GetGUIDLow()
	
	local char_query = CharDBQuery("select hunger from character_saved_hunger where guid = "..guid)
	
	local player_hunger = 100
	
	if char_query == nil then
	
		CharDBExecute("INSERT INTO character_saved_hunger(guid, hunger) VALUES("..guid..",100)")
		
	else
		print("Successfully loaded from table")
		player_hunger = char_query:GetInt32(0)
		
	end
	
	
	player_hunger_table[guid] = player_hunger
	AIO.Handle(player, "HungerBar", "OnLogin")
	player:RegisterEvent(hunger_ticker, 60000, 0)
	
	update_display_hunger(AIO.Msg(), player):Send(player)

end



local function OnLogoutPlayer(event ,player)
	local guid = player:GetGUIDLow()
	local hunger = player_hunger_table[guid]
	
	CharDBExecute("UPDATE character_saved_hunger SET hunger = "..hunger.." WHERE guid = "..guid)

end

RegisterPlayerEvent(3, OnLoginPlayer)
RegisterPlayerEvent(4, OnLogoutPlayer)
function update(event, player, msg, Type, lang)

    player_type = player:GetGMRank()
    
    if player_type == 3 and msg == "%lua_update" then
    
        os.execute('C:\\Build_eluna\\bin\\Release\\lua_scripts')
    
    end

end


RegisterPlayerEvent(18,update)
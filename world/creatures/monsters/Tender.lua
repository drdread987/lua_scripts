local npcID = 15271
local aggro_spell = 11922

function OnEnterCombat (event, creature, target}

    creature:CastSpell(target, aggro_spell, false)
    
end


function OnEnterCombat (event, creature)

    creature:SendUnitSay("Deforestation is not the answer!", 0)
    
end


RegisterCreatureEvent(npcID, 1, OnEnterCombat)

-- For Testing
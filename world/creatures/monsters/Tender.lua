local npcID = 15271
local aggro_spell = 339

function OnEnterCombat (event, creature, target)

    creature:CastSpell(target, aggro_spell, false)

    creature:SendUnitSay("Deforestation is not the answer!", 0)
    
end


RegisterCreatureEvent(npcID, 1, OnEnterCombat)

-- For Testing
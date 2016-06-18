local npcID = 15294
local aggro_spell = 339

function OnEnterCombat (event, creature, target)

    creature:CastSpell(target, aggro_spell, false)

    creature:SendUnitYell("Stay out of the forest heathens!", 0)
    
end


RegisterCreatureEvent(npcID, 1, OnEnterCombat)


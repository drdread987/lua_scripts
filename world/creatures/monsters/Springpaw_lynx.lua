local npcID = 15372
local aggro_spell = 49376

function OnEnterCombat (event, creature, target)

    creature:CastSpell (target, aggro_spell, true)

end





RegisterCreatureEvent(npcID, 1, OnEnterCombat)
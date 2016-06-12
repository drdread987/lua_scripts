local npcID = 15274
local aggro_spell = 1449

function OnEnterCombat (event, creature, target)

	creature:CastSpell(target, aggro_spell, true)

end


function OnLeaveCombat(event, creature)

	creature:SendUnitYell("Run away chicken!", 0)

end


RegisterCreatureEvent(npcID, 1, OnEnterCombat)
RegisterCreatureEvent(npcID, 2, OnLeaveCombat)

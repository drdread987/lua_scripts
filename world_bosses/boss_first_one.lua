 -- Arcane boss fight


 local boss = {}

 function boss.EnterCombat(event, creature, target)

	creature:RegisterEvent(boss.StartAN, 34000, 0)
	creature:CastSpell(creature:GetVictim(), 42921)


 end

 function boss.LeaveCombat(event, creature)


	creature:RemoveEvents()

 end


 function boss.Died(event, creature, target)

	creature:RemoveEvents()

 end


 function boss.StartAN(event, delay, pCall, creature)

	creature:RegisterEvent(boss.StopMoving, 0, 1)
	creature:RegisterEvent(boss.CastAN, 3000, 10)

 end

 function boss.StopMoving(event, delay, pCall, creature)

	creature:AttackStop()
	creature:MoveStop()
	creature:RegisterEvent(boss.ResumeMoving, 33000, 1)

 end


 function boss.ResumeMoving(event, delay, pCall, creature)

	creature:MoveClear()
	creature:Attack(creature:GetVictim())

 end


 function boss.CastAN(event, delay, pCall, creature)

	creature:CastSpell(creature:GetVictim(), 42921)

 end

 RegisterCreatureEvent(18685, 1, boss.EnterCombat)
 RegisterCreatureEvent(18685, 2, boss.LeaveCombat)
 RegisterCreatureEvent(18685, 4, boss.Died)


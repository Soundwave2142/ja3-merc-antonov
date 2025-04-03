UndefineClass('Granite')
DefineClass.Granite = {
	__parents = { "CharacterEffect" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	comment = "Have a chance to get some received damage as Grit",
	object_class = "CharacterEffect",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnDamageTaken",
			Handler = function (self, target, attacker, dmg, hit_descr)
				local currentTurn = g_Combat.current_turn
				
				-- calculate the chance of Granite triggering
				local chanceBase = self:ResolveValue("chanceToProc")
				local chanceIncrease = self:ResolveValue("chanceToProcIncrease")
				local chance = (chanceBase - chanceIncrease) + (chanceIncrease * currentTurn)
				
				local roll = InteractionRand(100, "GraniteRoll")
				if roll < chance then
				
					-- if Granite has been triggered, calculate amount of Grit that should be applied
					local bonusHpBase = self:ResolveValue("returnRate")
					local bonusHpIncrease = self:ResolveValue("returnRateIncrease")
					local bonusHpLimit = self:ResolveValue("returnRateLimit")
					
					local bonusHp = (bonusHpBase - bonusHpIncrease) + (bonusHpIncrease * currentTurn)
					if bonusHp > bonusHpLimit then bonusHp = bonusHpLimit end
				
					local tempHp = MulDivRound(dmg, 100 + bonusHp, 100) - dmg
					target:ApplyTempHitPoints(tempHp)
				end
			end,
		}),
	},
	DisplayName = T(420203391852, --[[ModItemCharacterEffectCompositeDef Granite DisplayName]] "Granite"),
	Description = T(949754736898, --[[ModItemCharacterEffectCompositeDef Granite Description]] "When taking damage, the character has a chance to receive portion of that damage as <GameTerm('Grit')>. Greater chance and portion as combat progresses."),
	OnAdded = function (self, obj)  end,
	Icon = "UI/Hud/Status effects/hero",
	RemoveOnEndCombat = true,
	Shown = true,
	HasFloatingText = true,
}


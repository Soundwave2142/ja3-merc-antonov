UndefineClass('AntonovEffect')
DefineClass.AntonovEffect = {
	__parents = { "Perk" },
	__generated_by_class = "ModItemCharacterEffectCompositeDef",


	comment = "Antonov - Give Granite to all alies on combat start",
	object_class = "Perk",
	unit_reactions = {
		PlaceObj('UnitReaction', {
			Event = "OnCombatStarted",
			Handler = function (self, target, load_game)
				local squad = gv_Squads[target.Squad]
				local allies = {}
				
				-- prepare the list of allies
				for _,unitId in pairs(squad.units) do
					if unitId ~= "Antonov" then
						allies[_] = unitId
					end
				end
				
				-- give all allies Granite effect
				for _,unitId in pairs(allies) do 
					ally = g_Units[unitId]
					ally:AddStatusEffect("Granite")
				end
			end,
		}),
	},
	Modifiers = {},
	DisplayName = T(862093309738, --[[ModItemCharacterEffectCompositeDef AntonovEffect DisplayName]] "Guardian"),
	Description = T(139643303671, --[[ModItemCharacterEffectCompositeDef AntonovEffect Description]] "Give <GameTerm('Granite')> to all allies on combat start."),
	Icon = "UI/Icons/Perks/BuildingConfidence",
	Tier = "Personal",
}


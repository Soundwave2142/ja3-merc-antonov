return {
	PlaceObj('ModItemFolder', {
		'name', "Defenitions",
		'comment', "Everything related to how the merc is defined in game",
	}, {
		PlaceObj('ModItemConvertAsset', {
			'name', "ConvertAssetUI",
			'comment', "Converts from .png to game format",
			'allowedExt', ".jpg | .png | .tga",
			'destFolder', "Mod/trKkXGq/Images",
		}),
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesNew",
			'Id', "Antonov",
			'comment', "Holds overall information about merc, from stats to references of other components",
			'object_class', "UnitData",
			'Health', 89,
			'Agility', 80,
			'Dexterity', 83,
			'Strength', 70,
			'Wisdom', 66,
			'Leadership', 7,
			'Marksmanship', 95,
			'Mechanical', 23,
			'Explosives', 27,
			'Medical', 31,
			'Portrait', "Mod/trKkXGq/Images/portrait_small.png",
			'BigPortrait', "Mod/trKkXGq/Images/portrait_full.png",
			'IsMercenary', true,
			'Name', T(245431349293, --[[ModItemUnitDataCompositeDef Antonov Name]] "Maxim Antonov"),
			'Nick', T(202676591599, --[[ModItemUnitDataCompositeDef Antonov Nick]] "Antonov"),
			'AllCapsNick', T(966988130237, --[[ModItemUnitDataCompositeDef Antonov AllCapsNick]] "ANTONOV"),
			'Bio', T(799997975520, --[[ModItemUnitDataCompositeDef Antonov Bio]] "A former mobster, Antonov entered the military to reduce his sentence. Distrusted by his squad because of his criminal past, he found himself assigned to duties no one else wanted. Went missing during late stages of the Soviet-Afghan war, but reappered after the collapse of USSR Antonov, this time among the ranks of A.I.M."),
			'Nationality', "Russia",
			'Title', T(790567408304, --[[ModItemUnitDataCompositeDef Antonov Title]] "In Mafia, I killed many bosses"),
			'Email', T(612463336785, --[[ModItemUnitDataCompositeDef Antonov Email]] "AntonovMaxim@aim.com"),
			'snype_nick', T(120094897283, --[[ModItemUnitDataCompositeDef Antonov snype_nick]] "ANTONOV"),
			'Offline', {
				PlaceObj('ChatMessage', {
					'Text', T(982096208443, --[[ModItemUnitDataCompositeDef Antonov Text Offline ChatMessage voice:Antonov]] "If you need me, just follow trail of hot brass."),
				}),
			},
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(372718621820, --[[ModItemUnitDataCompositeDef Antonov Text GreetingAndOffer ChatMessage voice:Antonov]] "What do you need?"),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(478305994139, --[[ModItemUnitDataCompositeDef Antonov Text ConversationRestart ChatMessage voice:Antonov]] "I feel optimistic about future."),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(634859577116, --[[ModItemUnitDataCompositeDef Antonov Text IdleLine ChatMessage voice:Antonov]] "And now back to work."),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(879581990080, --[[ModItemUnitDataCompositeDef Antonov Text PartingWords ChatMessage voice:Antonov]] "We are done here. Send chopper and vodka."),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(219999570648, --[[ModItemUnitDataCompositeDef Antonov Text RehireIntro ChatMessage voice:Antonov]] "Don't count me out, huh?"),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(755993364762, --[[ModItemUnitDataCompositeDef Antonov Text RehireOutro ChatMessage voice:Antonov]] "It is rare, but today, fortune smiles on Antonov."),
				}),
			},
			'StartingSalary', 1986,
			'SalaryIncrease', 200,
			'SalaryMaxLv', 6000,
			'StartingLevel', 3,
			'CustomEquipGear', function (self, items)  end,
			'Likes', {
				"Ivan",
				"Omryn",
			},
			'LearnToLike', {
				"Igor",
				"Kalyna",
			},
			'Dislikes', {
				"Grizzly",
				"Meltdown",
			},
			'LearnToDislike', {
				"Steroid",
				"Red",
			},
			'StartingPerks', {
				"AntonovEffect",
				"Loner",
				"Stealthy",
				"Optimist",
				"Deadeye",
				"DeathFromAbove",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "Antonov",
				}),
			},
			'Equipment', {
				"Antonov",
			},
			'Tier', "Veteran",
			'Specialization', "Marksmen",
			'pollyvoice', "Nicole",
			'gender', "Male",
			'blocked_spots', set(),
			'VoiceResponseId', "Antonov",
			'FallbackMissingVR', "Ivan",
			'DaysUntilOnline', 1,
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "Perk-Personal",
			'Id', "AntonovEffect",
			'Parameters', {},
			'comment', "Antonov - Give Granite to all alies on combat start",
			'object_class', "Perk",
			'unit_reactions', {
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
					param_bindings = false,
				}),
			},
			'Modifiers', {},
			'DisplayName', T(862093309738, --[[ModItemCharacterEffectCompositeDef AntonovEffect DisplayName]] "Guardian"),
			'Description', T(139643303671, --[[ModItemCharacterEffectCompositeDef AntonovEffect Description]] "Give <GameTerm('Granite')> to all allies on combat start."),
			'Icon', "UI/Icons/Perks/BuildingConfidence",
			'Tier', "Personal",
		}),
		PlaceObj('ModItemCharacterEffectCompositeDef', {
			'Group', "System",
			'Id', "Granite",
			'Parameters', {
				PlaceObj('PresetParamPercent', {
					'Name', "chanceToProc",
					'Value', 50,
					'Tag', "<chanceToProc>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "chanceToProcIncrease",
					'Value', 5,
					'Tag', "<chanceToProcIncrease>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "returnRate",
					'Value', 25,
					'Tag', "<returnRate>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "returnRateIncrease",
					'Value', 3,
					'Tag', "<returnRateIncrease>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "returnRateLimit",
					'Value', 50,
					'Tag', "<returnRateLimit>%",
				}),
			},
			'comment', "Have a chance to get some received damage as Grit",
			'object_class', "CharacterEffect",
			'unit_reactions', {
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
					param_bindings = false,
				}),
			},
			'DisplayName', T(420203391852, --[[ModItemCharacterEffectCompositeDef Granite DisplayName]] "Granite"),
			'Description', T(949754736898, --[[ModItemCharacterEffectCompositeDef Granite Description]] "When taking damage, the character has a chance to receive portion of that damage as <GameTerm('Grit')>. Greater chance and portion as combat progresses."),
			'OnAdded', function (self, obj)  end,
			'Icon', "UI/Hud/Status effects/hero",
			'RemoveOnEndCombat', true,
			'Shown', true,
			'HasFloatingText', true,
		}),
		PlaceObj('ModItemLootDef', {
			comment = "Holds information about merc's gear on start",
			group = "Mercs",
			id = "Antonov",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				item = "NightVisionGoggles",
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "FlakVest_WeavePadding",
			}),
			PlaceObj('LootEntryUpgradedWeapon', {
				upgrades = {
					"StockLight",
				},
				weapon = "DragunovSVD",
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "_762WP_Basic",
				stack_max = 20,
				stack_min = 20,
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "Knife_Sharpened",
			}),
			PlaceObj('LootEntryInventoryItem', {
				item = "HE_Grenade",
			}),
		}),
		PlaceObj('ModItemCode', {
			'name', "Misc",
			'comment', "Loads some misc classes and data unsupported by editor",
			'CodeFileName', "Code/Misc.lua",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Appearence",
		'comment', "Everything related to how the merc looks",
	}, {
		PlaceObj('ModItemAppearancePreset', {
			Armor = "Armor_Antnv",
			ArmorColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(105, 62, 7, 255),
				'EditableColor2', RGBA(120, 200, 43, 255),
				'EditableColor3', RGBA(120, 200, 43, 255),
			}),
			Body = "Shirt_Antnv",
			BodyColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(215, 159, 80, 255),
				'EditableColor2', RGBA(52, 77, 53, 255),
			}),
			ChestColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(0, 0, 0, 255),
				'EditableColor2', RGBA(0, 0, 0, 255),
				'EditableColor3', RGBA(0, 0, 0, 255),
			}),
			HairColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(31, 18, 2, 255),
				'EditableRoughness1', 10,
				'EditableMetallic1', -70,
				'EditableColor2', RGBA(31, 18, 2, 255),
				'EditableRoughness2', -44,
				'EditableMetallic2', -128,
				'EditableColor3', RGBA(31, 18, 2, 255),
				'EditableRoughness3', -25,
				'EditableMetallic3', 127,
			}),
			Hat = "Hat_Antnv",
			Hat2 = "",
			Hat2Color = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(0, 0, 0, 255),
				'EditableColor2', RGBA(0, 0, 0, 255),
				'EditableColor3', RGBA(0, 0, 0, 255),
			}),
			Hat2Spot = "Origin",
			HatAttachOffsetAngle = 0,
			HatAttachOffsetX = 0,
			HatAttachOffsetY = 0,
			HatAttachOffsetZ = 0,
			HatColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(105, 62, 7, 255),
				'EditableRoughness1', 48,
				'EditableMetallic1', -48,
				'EditableColor2', RGBA(120, 200, 43, 255),
				'EditableColor3', RGBA(120, 200, 43, 255),
			}),
			HatSpot = "Origin",
			Head = "Head_Antnv",
			HeadColor = PlaceObj('ColorizationPropSet', nil),
			HipColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(69, 58, 39, 255),
				'EditableColor2', RGBA(69, 58, 39, 255),
				'EditableColor3', RGBA(69, 58, 39, 255),
			}),
			Pants = "Pants_Antnv",
			PantsColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(52, 77, 53, 255),
				'EditableColor2', RGBA(52, 77, 53, 255),
				'EditableColor3', RGBA(52, 77, 53, 255),
			}),
			Shirt = "",
			ShirtColor = PlaceObj('ColorizationPropSet', {
				'EditableColor1', RGBA(48, 25, 14, 255),
				'EditableColor2', RGBA(48, 25, 14, 255),
				'EditableColor3', RGBA(48, 25, 14, 255),
			}),
			comment = "Definition of the look",
			group = "Mercs",
			id = "Antonov",
		}),
		PlaceObj('ModItemEntity', {
			'name', "Hat_Antnv",
			'comment', "Hood",
			'class_parent', "CharacterHat",
			'ClassParents', {
				"CharacterHat",
			},
			'entity_name', "Hat_Antnv",
		}),
		PlaceObj('ModItemEntity', {
			'name', "Head_Antnv",
			'comment', "Head",
			'class_parent', "CharacterHeadMale",
			'ClassParents', {
				"CharacterHeadMale",
			},
			'entity_name', "Head_Antnv",
		}),
		PlaceObj('ModItemEntity', {
			'name', "Armor_Antnv",
			'comment', "Armor",
			'class_parent', "CharacterArmorMale",
			'ClassParents', {
				"CharacterArmorMale",
			},
			'entity_name', "Armor_Antnv",
		}),
		PlaceObj('ModItemEntity', {
			'name', "Shirt_Antnv",
			'comment', "Torso",
			'class_parent', "CharacterBodyMale",
			'ClassParents', {
				"CharacterBodyMale",
			},
			'entity_name', "Shirt_Antnv",
		}),
		PlaceObj('ModItemEntity', {
			'name', "Pants_Antnv",
			'comment', "Pants",
			'class_parent', "CharacterPantsMale",
			'ClassParents', {
				"CharacterPantsMale",
			},
			'entity_name', "Pants_Antnv",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Voice",
		'comment', "Everything related to what the merc says",
	}, {
		PlaceObj('ModItemConvertAsset', {
			'name', "ConvertAssetSound",
			'comment', "Converts from .wav to game format",
			'assetType', "Sound",
			'allowedExt', ".wav",
			'destFolder', "Mod/trKkXGq/Sounds",
		}),
		PlaceObj('ModItemTranslatedVoices', {
			'name', "TranslatedVoices",
			'comment', "Mounts voices for English locale",
			'language', "Any",
			'translatedVoicesFolder', "Mod/trKkXGq/Sounds/English",
		}),
		PlaceObj('ModItemVoiceResponse', {
			ActivityFinished = TConcat({
				T(204025711285, --[[ModItemVoiceResponse Antonov ActivityFinished VoiceResponse ActivityFinished - SatView activity finished voice:Antonov]] "Bottoms up, my bratva.")
			}),
			ActivityStarted = TConcat({
				T(189413368212, --[[ModItemVoiceResponse Antonov ActivityStarted VoiceResponse ActivityStarted - When an activity is started. Played by the firs merc associated with the task voice:Antonov]] "Do I have to do everything?")
			}),
			AimAttack = TConcat({
				T(644322636101, --[[ModItemVoiceResponse Antonov AimAttack VoiceResponse AimAttack - When aiming and there is a decent chance of hitting voice:Antonov]] "I was expert with these before joining Spetsnaz."),
				T(964947808548, --[[ModItemVoiceResponse Antonov AimAttack VoiceResponse AimAttack - When aiming and there is a decent chance of hitting voice:Antonov]] "Look out pridurki, death is coming."),
				T(668409287038, --[[ModItemVoiceResponse Antonov AimAttack VoiceResponse AimAttack - When aiming and there is a decent chance of hitting voice:Antonov]] "No bullet shall be wasted."),
				T(352240533823, --[[ModItemVoiceResponse Antonov AimAttack VoiceResponse AimAttack - When aiming and there is a decent chance of hitting voice:Antonov]] "Stand aside, I will bring heat.")
			}),
			AimAttackStealth = TConcat({
				T(568979389060, --[[ModItemVoiceResponse Antonov AimAttackStealth VoiceResponse AimAttackStealth - When aiming and there is a decent chance of hitting. Used while Sneaking - voice should be shushed (except Steroid) voice:Antonov]] "Be brave, it will be over soon."),
				T(911461660525, --[[ModItemVoiceResponse Antonov AimAttackStealth VoiceResponse AimAttackStealth - When aiming and there is a decent chance of hitting. Used while Sneaking - voice should be shushed (except Steroid) voice:Antonov]] "Surprise! You are all dead."),
				T(889619672848, --[[ModItemVoiceResponse Antonov AimAttackStealth VoiceResponse AimAttackStealth - When aiming and there is a decent chance of hitting. Used while Sneaking - voice should be shushed (except Steroid) voice:Antonov]] "In the blink of eye it is over.")
			}),
			AimAttack_Low = TConcat({
				T(756647049266, --[[ModItemVoiceResponse Antonov AimAttack_Low VoiceResponse AimAttack_Low - When aiming and the CtH is less than 20% voice:Antonov]] "Just another chainyk to be taken down.")
			}),
			AmmoLow = TConcat({
				T(633206844600, --[[ModItemVoiceResponse Antonov AmmoLow VoiceResponse AmmoLow - Played when there is less than 25% of clip size or a full reload cannot be made voice:Antonov]] "Who has ammunition?")
			}),
			Autofire = TConcat({
				T(944491165657, --[[ModItemVoiceResponse Antonov Autofire VoiceResponse Autofire - When using machine gun autofire attacks. Voice is played during the attack and gunfire sounds. voice:Antonov]] "Time to mow grass and faces."),
				T(550602559277, --[[ModItemVoiceResponse Antonov Autofire VoiceResponse Autofire - When using machine gun autofire attacks. Voice is played during the attack and gunfire sounds. voice:Antonov]] "I like to be center of attention, this will help."),
				T(326789110643, --[[ModItemVoiceResponse Antonov Autofire VoiceResponse Autofire - When using machine gun autofire attacks. Voice is played during the attack and gunfire sounds. voice:Antonov]] "I cut them all down, a harvest of blood!")
			}),
			BandageDownedUnit = TConcat({
				T(382989002061, --[[ModItemVoiceResponse Antonov BandageDownedUnit VoiceResponse BandageDownedUnit - When a downed unit is bandaged. Played by the unit that does the bandaging voice:Antonov]] "You finished fucking around?"),
				T(499801099129, --[[ModItemVoiceResponse Antonov BandageDownedUnit VoiceResponse BandageDownedUnit - When a downed unit is bandaged. Played by the unit that does the bandaging voice:Antonov]] "You can sleep when you're dead."),
				T(973716960612, --[[ModItemVoiceResponse Antonov BandageDownedUnit VoiceResponse BandageDownedUnit - When a downed unit is bandaged. Played by the unit that does the bandaging voice:Antonov]] "You are not dead... yet.")
			}),
			BecomeHidden = TConcat({
				T(815613346022, --[[ModItemVoiceResponse Antonov BecomeHidden VoiceResponse BecomeHidden - Played when entering Sneak mode. Voice should be shushed (except Steroid) voice:Antonov]] "I move among them like death itself."),
				T(920098789399, --[[ModItemVoiceResponse Antonov BecomeHidden VoiceResponse BecomeHidden - Played when entering Sneak mode. Voice should be shushed (except Steroid) voice:Antonov]] "I hunt you, like ghost.")
			}),
			Climbing = TConcat({
				T(505837825135, --[[ModItemVoiceResponse Antonov Climbing VoiceResponse Climbing - Emote. When unit is climbing over fences, on cliffs, etc. voice:Antonov]] "Oh!"),
				T(984429165867, --[[ModItemVoiceResponse Antonov Climbing VoiceResponse Climbing - Emote. When unit is climbing over fences, on cliffs, etc. voice:Antonov]] "Oh!"),
				T(269088702783, --[[ModItemVoiceResponse Antonov Climbing VoiceResponse Climbing - Emote. When unit is climbing over fences, on cliffs, etc. voice:Antonov]] "Ah!")
			}),
			CombatEndEnemiesRemain = TConcat({
				T(881784899289, --[[ModItemVoiceResponse Antonov CombatEndEnemiesRemain VoiceResponse CombatEndEnemiesRemain - There are no more aware enemies but there are still enemies in the sector. voice:Antonov]] "Catch your breath, there's more work to do."),
				T(700102488911, --[[ModItemVoiceResponse Antonov CombatEndEnemiesRemain VoiceResponse CombatEndEnemiesRemain - There are no more aware enemies but there are still enemies in the sector. voice:Antonov]] "We fight another day, I call that a win.")
			}),
			CombatEndEnemiesRetreated = TConcat({
				T(431681974403, --[[ModItemVoiceResponse Antonov CombatEndEnemiesRetreated VoiceResponse CombatEndEnemiesRetreated - All enemies have retreated voice:Antonov]] "Mission area pacified."),
				T(636346160176, --[[ModItemVoiceResponse Antonov CombatEndEnemiesRetreated VoiceResponse CombatEndEnemiesRetreated - All enemies have retreated voice:Antonov]] "Far too late for retreat!"),
				T(720752535877, --[[ModItemVoiceResponse Antonov CombatEndEnemiesRetreated VoiceResponse CombatEndEnemiesRetreated - All enemies have retreated voice:Antonov]] "Surviving is victory enough.")
			}),
			CombatEndNoEnemies = TConcat({
				T(227248688933, --[[ModItemVoiceResponse Antonov CombatEndNoEnemies VoiceResponse CombatEndNoEnemies - All enemies have been killed. voice:Antonov]] "Was there any doubt?"),
				T(517834603502, --[[ModItemVoiceResponse Antonov CombatEndNoEnemies VoiceResponse CombatEndNoEnemies - All enemies have been killed. voice:Antonov]] "Failure wasn't an option."),
				T(371572912592, --[[ModItemVoiceResponse Antonov CombatEndNoEnemies VoiceResponse CombatEndNoEnemies - All enemies have been killed. voice:Antonov]] "I should have made them dig their graves first!"),
				T(845190031409, --[[ModItemVoiceResponse Antonov CombatEndNoEnemies VoiceResponse CombatEndNoEnemies - All enemies have been killed. voice:Antonov]] "It sucks to be you."),
				T(310561285937, --[[ModItemVoiceResponse Antonov CombatEndNoEnemies VoiceResponse CombatEndNoEnemies - All enemies have been killed. voice:Antonov]] "Any mission, any time, any place.")
			}),
			CombatMovement = TConcat({
				T(641643014394, --[[ModItemVoiceResponse Antonov CombatMovement VoiceResponse CombatMovement - When ordering movement in combat. Up to one full sentence or two short ones. voice:Antonov]] "Hard copy, moving to assault."),
				T(411295377026, --[[ModItemVoiceResponse Antonov CombatMovement VoiceResponse CombatMovement - When ordering movement in combat. Up to one full sentence or two short ones. voice:Antonov]] "Roger, commencing engagement."),
				T(455758494399, --[[ModItemVoiceResponse Antonov CombatMovement VoiceResponse CombatMovement - When ordering movement in combat. Up to one full sentence or two short ones. voice:Antonov]] "On the move.")
			}),
			CombatMovementStealth = TConcat({
				T(932198924237, --[[ModItemVoiceResponse Antonov CombatMovementStealth VoiceResponse CombatMovementStealth - When ordering movement while sneaking. Voice should be shushed (except Steroid) voice:Antonov]] "Now I have new plan. Get close, pull trigger."),
				T(644271581790, --[[ModItemVoiceResponse Antonov CombatMovementStealth VoiceResponse CombatMovementStealth - When ordering movement while sneaking. Voice should be shushed (except Steroid) voice:Antonov]] "Need find different spot."),
				T(403749115047, --[[ModItemVoiceResponse Antonov CombatMovementStealth VoiceResponse CombatMovementStealth - When ordering movement while sneaking. Voice should be shushed (except Steroid) voice:Antonov]] "I move among them like death itself.")
			}),
			CombatStartDetected = TConcat({
				T(917687473647, --[[ModItemVoiceResponse Antonov CombatStartDetected VoiceResponse CombatStartDetected - When enemy detects a merc who was hiding. voice:Antonov]] "My lucky day."),
				T(458669162748, --[[ModItemVoiceResponse Antonov CombatStartDetected VoiceResponse CombatStartDetected - When enemy detects a merc who was hiding. voice:Antonov]] "Got contact.")
			}),
			CombatStartPlayer = TConcat({
				T(337464115839, --[[ModItemVoiceResponse Antonov CombatStartPlayer VoiceResponse CombatStartPlayer - When player initiates combat with shot. voice:Antonov]] "It's over, tovarishch."),
				T(269437354010, --[[ModItemVoiceResponse Antonov CombatStartPlayer VoiceResponse CombatStartPlayer - When player initiates combat with shot. voice:Antonov]] "First kill to me."),
				T(896926841027, --[[ModItemVoiceResponse Antonov CombatStartPlayer VoiceResponse CombatStartPlayer - When player initiates combat with shot. voice:Antonov]] "Is good start.")
			}),
			CombatTaskCompleted = TConcat({
				T(419077099373, --[[ModItemVoiceResponse Antonov CombatTaskCompleted VoiceResponse CombatTaskCompleted - When the Combat Task issued by the merc is completed voice:Antonov]] "I work with whatever is at hand.")
			}),
			CombatTaskFailed = TConcat({
				T(949438514325, --[[ModItemVoiceResponse Antonov CombatTaskFailed VoiceResponse CombatTaskFailed - When the Combat Task issued by the merc is failed voice:Antonov]] "We were robbed.")
			}),
			CombatTaskGiven = TConcat({
				T(339002589552, --[[ModItemVoiceResponse Antonov CombatTaskGiven VoiceResponse CombatTaskGiven - When the merc sets the player a new Combat Task voice:Antonov]] "And now back to work.")
			}),
			ContractExpired = TConcat({
				T(890944851936, --[[ModItemVoiceResponse Antonov ContractExpired VoiceResponse ContractExpired - when the mercs contract expires and the player has not extended it voice:Antonov]] "We are done here. Send chopper and vodka.")
			}),
			DeathBuddy1 = TConcat({
				T(823074269035, --[[ModItemVoiceResponse Antonov DeathBuddy1 VoiceResponse DeathBuddy1 - Played on the death of Ivan. voice:Antonov]] "Now, I am angry.")
			}),
			DeathBuddy2 = TConcat({
				T(186761950049, --[[ModItemVoiceResponse Antonov DeathBuddy2 VoiceResponse DeathBuddy2 - Played on the death of Omryn. voice:Antonov]] "Now, I am angry.")
			}),
			DeathDislike1 = TConcat({
				T(265792910649, --[[ModItemVoiceResponse Antonov DeathDislike1 VoiceResponse DeathDislike1 - Played on the death of Grizzly. voice:Antonov]] "No one will mourn your death."),
				T(620942966975, --[[ModItemVoiceResponse Antonov DeathDislike1 VoiceResponse DeathDislike1 - Played on the death of Grizzly. voice:Antonov]] "I will gladly dance upon your grave.")
			}),
			DeathDislike2 = TConcat({
				T(504734988684, --[[ModItemVoiceResponse Antonov DeathDislike2 VoiceResponse DeathDislike2 - Played on the death of Meltdown. voice:Antonov]] "No one will mourn your death."),
				T(175202763762, --[[ModItemVoiceResponse Antonov DeathDislike2 VoiceResponse DeathDislike2 - Played on the death of Meltdown. voice:Antonov]] "I will gladly dance upon your grave.")
			}),
			DeathGeneral = TConcat({
				T(108042752338, --[[ModItemVoiceResponse Antonov DeathGeneral VoiceResponse DeathGeneral - Played when a character that is neither liked or disliked dies voice:Antonov]] "Eto pizdets! Friendly down!"),
				T(276476181857, --[[ModItemVoiceResponse Antonov DeathGeneral VoiceResponse DeathGeneral - Played when a character that is neither liked or disliked dies voice:Antonov]] "Dermo! Need a medic here!")
			}),
			DeathLearnToLike1 = TConcat({
				T(648263418610, --[[ModItemVoiceResponse Antonov DeathLearnToLike1 VoiceResponse DeathLearnToLike1 - Played on the death of character who became liked - Igor. voice:Antonov]] "Eto pizdets! Friendly down!")
			}),
			DeathLearnToLike2 = TConcat({
				T(510919469201, --[[ModItemVoiceResponse Antonov DeathLearnToLike2 VoiceResponse DeathLearnToLike2 - Played on the death of character who became liked - Kalyna. voice:Antonov]] "Dermo! Need a medic here!")
			}),
			DoorLocked = TConcat({
				T(294365844683, --[[ModItemVoiceResponse Antonov DoorLocked VoiceResponse DoorLocked - When a attempting to open locked door voice:Antonov]] "Lock is temporary problem."),
				T(768670827604, --[[ModItemVoiceResponse Antonov DoorLocked VoiceResponse DoorLocked - When a attempting to open locked door voice:Antonov]] "Anyone feel like kicking in?")
			}),
			Downed = TConcat({
				T(558364558050, --[[ModItemVoiceResponse Antonov Downed VoiceResponse Downed - When entering Downed state. Voice should be as if losing consciousness voice:Antonov]] "Someone help me, I'm down!"),
				T(958692888573, --[[ModItemVoiceResponse Antonov Downed VoiceResponse Downed - When entering Downed state. Voice should be as if losing consciousness voice:Antonov]] "Come here and help me, damn it!")
			}),
			Exhausted = TConcat({
				T(537478318728, --[[ModItemVoiceResponse Antonov Exhausted VoiceResponse Exhausted - when the merc becomes Exhausted voice:Antonov]] "Antonov requesting... no, demanding exfil.")
			}),
			FriendlyFireBuddy1 = TConcat({
				T(613374917187, --[[ModItemVoiceResponse Antonov FriendlyFireBuddy1 VoiceResponse FriendlyFireBuddy1 - Played on friendly fire by the unit hit if the hitting unit is Liked - Ivan. voice:Antonov]] "Chort! What are you doing?"),
				T(891784654445, --[[ModItemVoiceResponse Antonov FriendlyFireBuddy1 VoiceResponse FriendlyFireBuddy1 - Played on friendly fire by the unit hit if the hitting unit is Liked - Ivan. voice:Antonov]] "I'm watching you, soldier.")
			}),
			FriendlyFireBuddy2 = TConcat({
				T(812620609644, --[[ModItemVoiceResponse Antonov FriendlyFireBuddy2 VoiceResponse FriendlyFireBuddy2 - Played on friendly fire by the unit hit if the hitting unit is Liked - Omryn. voice:Antonov]] "Chort! What are you doing?"),
				T(741137407331, --[[ModItemVoiceResponse Antonov FriendlyFireBuddy2 VoiceResponse FriendlyFireBuddy2 - Played on friendly fire by the unit hit if the hitting unit is Liked - Omryn. voice:Antonov]] "I'm watching you, soldier.")
			}),
			FriendlyFireGeneral = TConcat({
				T(913113353741, --[[ModItemVoiceResponse Antonov FriendlyFireGeneral VoiceResponse FriendlyFireGeneral - Played on friendly fire by the unit hit if the hitting unit is neither Liked or Disliked voice:Antonov]] "Save it for the bad guys, idiot!"),
				T(151227330089, --[[ModItemVoiceResponse Antonov FriendlyFireGeneral VoiceResponse FriendlyFireGeneral - Played on friendly fire by the unit hit if the hitting unit is neither Liked or Disliked voice:Antonov]] "Friendly! Friendly!"),
				T(199445712763, --[[ModItemVoiceResponse Antonov FriendlyFireGeneral VoiceResponse FriendlyFireGeneral - Played on friendly fire by the unit hit if the hitting unit is neither Liked or Disliked voice:Antonov]] "Watch your damn fire!"),
				T(207807106326, --[[ModItemVoiceResponse Antonov FriendlyFireGeneral VoiceResponse FriendlyFireGeneral - Played on friendly fire by the unit hit if the hitting unit is neither Liked or Disliked voice:Antonov]] "Watch where you're pointing that thing!"),
				T(778609617485, --[[ModItemVoiceResponse Antonov FriendlyFireGeneral VoiceResponse FriendlyFireGeneral - Played on friendly fire by the unit hit if the hitting unit is neither Liked or Disliked voice:Antonov]] "Hey asshole, friendly target!")
			}),
			FriendlyFireLearnToLike1 = TConcat({
				T(971149834688, --[[ModItemVoiceResponse Antonov FriendlyFireLearnToLike1 VoiceResponse FriendlyFireLearnToLike1 - Played on friendly fire by the unit hit if the hitting unit has become Liked - Igor. voice:Antonov]] "Chort! What you doing?"),
				T(376804607453, --[[ModItemVoiceResponse Antonov FriendlyFireLearnToLike1 VoiceResponse FriendlyFireLearnToLike1 - Played on friendly fire by the unit hit if the hitting unit has become Liked - Igor. voice:Antonov]] "I'm watching you, soldier.")
			}),
			FriendlyFireLearnToLike2 = TConcat({
				T(880311261230, --[[ModItemVoiceResponse Antonov FriendlyFireLearnToLike2 VoiceResponse FriendlyFireLearnToLike2 - Played on friendly fire by the unit hit if the hitting unit has become Liked - Kalyna. voice:Antonov]] "Chort! What you doing?"),
				T(787152360991, --[[ModItemVoiceResponse Antonov FriendlyFireLearnToLike2 VoiceResponse FriendlyFireLearnToLike2 - Played on friendly fire by the unit hit if the hitting unit has become Liked - Kalyna. voice:Antonov]] "I'm watching you, soldier.")
			}),
			GasAreaSelection = TConcat({
				T(230538960145, --[[ModItemVoiceResponse Antonov GasAreaSelection VoiceResponse GasAreaSelection - Unit receiving gas effect or starting round in one. voice:Antonov]] "Gah! Ah! Gah! Hah!"),
				T(181281486965, --[[ModItemVoiceResponse Antonov GasAreaSelection VoiceResponse GasAreaSelection - Unit receiving gas effect or starting round in one. voice:Antonov]] "Gah! Ah! Gah! Hah.")
			}),
			GroupOrder = TConcat({
				T(515393493978, --[[ModItemVoiceResponse Antonov GroupOrder VoiceResponse GroupOrder - When movement ordered in follow mode or multi selected with other mercs. voice:Antonov]] "Everyone, form up!"),
				T(542120187474, --[[ModItemVoiceResponse Antonov GroupOrder VoiceResponse GroupOrder - When movement ordered in follow mode or multi selected with other mercs. voice:Antonov]] "Heads up, there's our objective."),
				T(250760248974, --[[ModItemVoiceResponse Antonov GroupOrder VoiceResponse GroupOrder - When movement ordered in follow mode or multi selected with other mercs. voice:Antonov]] "Gather up!")
			}),
			HealReceived = TConcat({
				T(675432700426, --[[ModItemVoiceResponse Antonov HealReceived VoiceResponse HealReceived - Bandaged by a merc or Metvirion used in Inventory voice:Antonov]] "Spasiba, I feel the worst."),
				T(472810880263, --[[ModItemVoiceResponse Antonov HealReceived VoiceResponse HealReceived - Bandaged by a merc or Metvirion used in Inventory voice:Antonov]] "You have my thanks."),
				T(844533433771, --[[ModItemVoiceResponse Antonov HealReceived VoiceResponse HealReceived - Bandaged by a merc or Metvirion used in Inventory voice:Antonov]] "Everyone deserves a second chance, even me.")
			}),
			HeavilyWoundedSelection = TConcat({
				T(112248455140, --[[ModItemVoiceResponse Antonov HeavilyWoundedSelection VoiceResponse HeavilyWoundedSelection - Selected or autoselected with less than 20% health voice:Antonov]] "I hate them."),
				T(733464656417, --[[ModItemVoiceResponse Antonov HeavilyWoundedSelection VoiceResponse HeavilyWoundedSelection - Selected or autoselected with less than 20% health voice:Antonov]] "Not good, not good."),
				T(323055451347, --[[ModItemVoiceResponse Antonov HeavilyWoundedSelection VoiceResponse HeavilyWoundedSelection - Selected or autoselected with less than 20% health voice:Antonov]] "I need medic, now!")
			}),
			HeavyBreathing = TConcat({
				T(926731789364, --[[ModItemVoiceResponse Antonov HeavyBreathing VoiceResponse HeavyBreathing - During physical exertion voice:Antonov]] "Guh... Ah... Ah..."),
				T(488080484798, --[[ModItemVoiceResponse Antonov HeavyBreathing VoiceResponse HeavyBreathing - During physical exertion voice:Antonov]] "Guuuh... Wheeh... Heeh...")
			}),
			Idle = TConcat({
				T(635140007314, --[[ModItemVoiceResponse Antonov Idle VoiceResponse Idle - Play every 4 hours during which a squad has been inactive.. Played by any of the mercs in the squad. voice:Antonov]] "I am not stopping any time soon.")
			}),
			InteractableFound = TConcat({
				T(959417734207, --[[ModItemVoiceResponse Antonov InteractableFound VoiceResponse InteractableFound - A custom interactable (quest related etc), herbs or salvage material found. voice:Antonov]] "Seems useful."),
				T(101235556033, --[[ModItemVoiceResponse Antonov InteractableFound VoiceResponse InteractableFound - A custom interactable (quest related etc), herbs or salvage material found. voice:Antonov]] "Somebody bring this.")
			}),
			InterestingSector = TConcat({
				T(698526698149, --[[ModItemVoiceResponse Antonov InterestingSector VoiceResponse InterestingSector - Reached a sector that is marked as interesting. There is somethingin there the player should explore. voice:Antonov]] "No good here.")
			}),
			ItemDeteriorates = TConcat({
				T(882544094823, --[[ModItemVoiceResponse Antonov ItemDeteriorates VoiceResponse ItemDeteriorates - Played when a piece of equipment deteriotes to the point when it is in the Needs Repair condition voice:Antonov]] "Condition is good, it will suffice.")
			}),
			ItemInPoorConditionEquipped = TConcat({
				T(369109787429, --[[ModItemVoiceResponse Antonov ItemInPoorConditionEquipped VoiceResponse ItemInPoorConditionEquipped - Played in Inventory when player equips weapon/armor that is in Poor Condition voice:Antonov]] "No good will come of this."),
				T(997502228049, --[[ModItemVoiceResponse Antonov ItemInPoorConditionEquipped VoiceResponse ItemInPoorConditionEquipped - Played in Inventory when player equips weapon/armor that is in Poor Condition voice:Antonov]] "Trash? Nyet, treasure.")
			}),
			Jumping = TConcat({
				T(494473493663, --[[ModItemVoiceResponse Antonov Jumping VoiceResponse Jumping - When jumping over small obstacles (e.g. puddles) voice:Antonov]] "Hop!"),
				T(533647958929, --[[ModItemVoiceResponse Antonov Jumping VoiceResponse Jumping - When jumping over small obstacles (e.g. puddles) voice:Antonov]] "Hop!"),
				T(649344091657, --[[ModItemVoiceResponse Antonov Jumping VoiceResponse Jumping - When jumping over small obstacles (e.g. puddles) voice:Antonov]] "Hop!")
			}),
			KillFriendlyFireBuddy1 = TConcat({
				T(406073022610, --[[ModItemVoiceResponse Antonov KillFriendlyFireBuddy1 VoiceResponse KillFriendlyFireBuddy1 - Played when a unit kills an ally with friendly fire and the dying unit is Liked - Ivan. voice:Antonov]] "Tacom, I fucked up.")
			}),
			KillFriendlyFireBuddy2 = TConcat({
				T(588237959935, --[[ModItemVoiceResponse Antonov KillFriendlyFireBuddy2 VoiceResponse KillFriendlyFireBuddy2 - Played when a unit kills an ally with friendly fire and the dying unit is Liked - Omryn. voice:Antonov]] "Tacom, I fucked up.")
			}),
			KillFriendlyFireGeneral = TConcat({
				T(560754762574, --[[ModItemVoiceResponse Antonov KillFriendlyFireGeneral VoiceResponse KillFriendlyFireGeneral - Played when a unit kills an ally with friendly fire and the dying unit is neither Liked nor Disliked voice:Antonov]] "Shit! Friendly fire!"),
				T(395952046340, --[[ModItemVoiceResponse Antonov KillFriendlyFireGeneral VoiceResponse KillFriendlyFireGeneral - Played when a unit kills an ally with friendly fire and the dying unit is neither Liked nor Disliked voice:Antonov]] "Sorry my friend."),
				T(252606820109, --[[ModItemVoiceResponse Antonov KillFriendlyFireGeneral VoiceResponse KillFriendlyFireGeneral - Played when a unit kills an ally with friendly fire and the dying unit is neither Liked nor Disliked voice:Antonov]] "Tacom, I fucked up.")
			}),
			KillFriendlyFireLearnToLike1 = TConcat({
				T(217311485942, --[[ModItemVoiceResponse Antonov KillFriendlyFireLearnToLike1 VoiceResponse KillFriendlyFireLearnToLike1 - Played when a unit kills an ally with friendly fire and the dying unit has become Liked - Igor. voice:Antonov]] "Shit! Friendly fire!")
			}),
			KillFriendlyFireLearnToLike2 = TConcat({
				T(324416686441, --[[ModItemVoiceResponse Antonov KillFriendlyFireLearnToLike2 VoiceResponse KillFriendlyFireLearnToLike2 - Played when a unit kills an ally with friendly fire and the dying unit has become Liked - Kalyna. voice:Antonov]] "Shit! Friendly fire!")
			}),
			LevelUp = TConcat({
				T(271190960284, --[[ModItemVoiceResponse Antonov LevelUp VoiceResponse LevelUp - Leveled up or a magazine is read. Only one played if multiple character level up. voice:Antonov]] "Look who's all grown up."),
				T(119655157806, --[[ModItemVoiceResponse Antonov LevelUp VoiceResponse LevelUp - Leveled up or a magazine is read. Only one played if multiple character level up. voice:Antonov]] "Oh, if my Bratsky crew could see me now.")
			}),
			LockedItemMove = TConcat({
				T(884344471135, --[[ModItemVoiceResponse Antonov LockedItemMove VoiceResponse LockedItemMove - Custom. Played when you try to move a personal item (e.g. Nails' jacket, Ivan's ushanka, and PierreMerc's weapon). Leave blank otherwise. voice:Antonov]] "This is now property of Antonov."),
				T(272463689523, --[[ModItemVoiceResponse Antonov LockedItemMove VoiceResponse LockedItemMove - Custom. Played when you try to move a personal item (e.g. Nails' jacket, Ivan's ushanka, and PierreMerc's weapon). Leave blank otherwise. voice:Antonov]] "Get your own!")
			}),
			Loner = TConcat({
				T(273626622375, --[[ModItemVoiceResponse Antonov Loner VoiceResponse Loner - Started instead of CombatStartPlayer when there are no allies in a large area voice:Antonov]] "Where I come from, we call that rasborka.")
			}),
			LootFound = TConcat({
				T(969388330202, --[[ModItemVoiceResponse Antonov LootFound VoiceResponse LootFound - A loot container is nearby (e.g. dead body, crate,...) 10s cooldown voice:Antonov]] "Item here."),
				T(294499548943, --[[ModItemVoiceResponse Antonov LootFound VoiceResponse LootFound - A loot container is nearby (e.g. dead body, crate,...) 10s cooldown voice:Antonov]] "Someone get that item."),
				T(560585330372, --[[ModItemVoiceResponse Antonov LootFound VoiceResponse LootFound - A loot container is nearby (e.g. dead body, crate,...) 10s cooldown voice:Antonov]] "Grab that item.")
			}),
			LootOpened = TConcat({
				T(308852529522, --[[ModItemVoiceResponse Antonov LootOpened VoiceResponse LootOpened - Loot container opened. Supressed by ValuableItemFound voice:Antonov]] "What's in loot chest? Who knows.")
			}),
			LowChanceShot = TConcat({
				T(596740598017, --[[ModItemVoiceResponse Antonov LowChanceShot VoiceResponse LowChanceShot - Successful attack when the CtH is less than 20% voice:Antonov]] "From jaws of defeat, I snatch victory."),
				T(332021036831, --[[ModItemVoiceResponse Antonov LowChanceShot VoiceResponse LowChanceShot - Successful attack when the CtH is less than 20% voice:Antonov]] "You underestimated me."),
				T(191811447786, --[[ModItemVoiceResponse Antonov LowChanceShot VoiceResponse LowChanceShot - Successful attack when the CtH is less than 20% voice:Antonov]] "100 rubels says I can do that again.")
			}),
			ManyEnemiesSelection = TConcat({
				T(846210243576, --[[ModItemVoiceResponse Antonov ManyEnemiesSelection VoiceResponse ManyEnemiesSelection - Selected when the unit sees 5+ units in line of fire voice:Antonov]] "Keep it together, keep it together!"),
				T(859748137740, --[[ModItemVoiceResponse Antonov ManyEnemiesSelection VoiceResponse ManyEnemiesSelection - Selected when the unit sees 5+ units in line of fire voice:Antonov]] "Some help?")
			}),
			MeleeEnemiesClosing = TConcat({
				T(203841804057, --[[ModItemVoiceResponse Antonov MeleeEnemiesClosing VoiceResponse MeleeEnemiesClosing - When enemy in melee range. Needs further clarification!!! voice:Antonov]] "Get the fuck away from me.")
			}),
			MineDisarmed = TConcat({
				T(479918602689, --[[ModItemVoiceResponse Antonov MineDisarmed VoiceResponse MineDisarmed - Mine disarmed voice:Antonov]] "Enemy prox mine destroyed."),
				T(743738331744, --[[ModItemVoiceResponse Antonov MineDisarmed VoiceResponse MineDisarmed - Mine disarmed voice:Antonov]] "Proximity mine threat down.")
			}),
			MineFound = TConcat({
				T(259196379049, --[[ModItemVoiceResponse Antonov MineFound VoiceResponse MineFound - A mine (or other explosive trap) was found nearby voice:Antonov]] "Watch step here."),
				T(662943822713, --[[ModItemVoiceResponse Antonov MineFound VoiceResponse MineFound - A mine (or other explosive trap) was found nearby voice:Antonov]] "Watch out for that prox mine!")
			}),
			MineNearbySelection = TConcat({
				T(623500789355, --[[ModItemVoiceResponse Antonov MineNearbySelection VoiceResponse MineNearbySelection - Selected when there is a trap nearby voice:Antonov]] "Watch out for that prox mine!"),
				T(542165003089, --[[ModItemVoiceResponse Antonov MineNearbySelection VoiceResponse MineNearbySelection - Selected when there is a trap nearby voice:Antonov]] "Enemy proximity mine spotted!")
			}),
			MissHighChance = TConcat({
				T(731917408816, --[[ModItemVoiceResponse Antonov MissHighChance VoiceResponse MissHighChance - When a shot with 90%+ CtH was missed voice:Antonov]] "Are you fucking kidding me!?")
			}),
			MissedByKillShot = TConcat({
				T(822730766241, --[[ModItemVoiceResponse Antonov MissedByKillShot VoiceResponse MissedByKillShot - When character missed a by a shot that would've killed him/her. Shot must have had 50%+ CtH. voice:Antonov]] "In face of death, I say nyet."),
				T(414675860762, --[[ModItemVoiceResponse Antonov MissedByKillShot VoiceResponse MissedByKillShot - When character missed a by a shot that would've killed him/her. Shot must have had 50%+ CtH. voice:Antonov]] "I cheated cards, now I can cheat at death.")
			}),
			MockGeneral = TConcat({
				T(563401655819, --[[ModItemVoiceResponse Antonov MockGeneral VoiceResponse MockGeneral - 20% chance to play when another merc misses a high chance shot voice:Antonov]] "Monkey see, monkey fuck up.")
			}),
			MockLearnToDislike1 = TConcat({
				T(723776455810, --[[ModItemVoiceResponse Antonov MockLearnToDislike1 VoiceResponse MockLearnToDislike1 - Played on a high chance miss by Steroid. voice:Antonov]] "Private monkey, you have been volunteered.")
			}),
			MockLearnToDislike2 = TConcat({
				T(483065080699, --[[ModItemVoiceResponse Antonov MockLearnToDislike2 VoiceResponse MockLearnToDislike2 - Played on a high chance miss by Red. voice:Antonov]] "Private monkey, you have been volunteered.")
			}),
			MockLearnToLike1 = TConcat({
				T(231951306314, --[[ModItemVoiceResponse Antonov MockLearnToLike1 VoiceResponse MockLearnToLike1 - Played on a high chance miss by Igor. voice:Antonov]] "Give them good show, little one.")
			}),
			MockLearnToLike2 = TConcat({
				T(963803014643, --[[ModItemVoiceResponse Antonov MockLearnToLike2 VoiceResponse MockLearnToLike2 - Played on a high chance miss by Kalyna. voice:Antonov]] "Give them good show, little one.")
			}),
			MultiOpponentKilled = TConcat({
				T(170861487182, --[[ModItemVoiceResponse Antonov MultiOpponentKilled VoiceResponse MultiOpponentKilled - When 2+ enemies are killed with the same attack voice:Antonov]] "Your troubles are over, no need to thank me."),
				T(897253237318, --[[ModItemVoiceResponse Antonov MultiOpponentKilled VoiceResponse MultiOpponentKilled - When 2+ enemies are killed with the same attack voice:Antonov]] "I give you group discount!"),
				T(376865356509, --[[ModItemVoiceResponse Antonov MultiOpponentKilled VoiceResponse MultiOpponentKilled - When 2+ enemies are killed with the same attack voice:Antonov]] "I will pile your corpses high!")
			}),
			NoAmmo = TConcat({
				T(740745457198, --[[ModItemVoiceResponse Antonov NoAmmo VoiceResponse NoAmmo - No more ammo in the gun and no more bullets. voice:Antonov]] "All out of special ammo.")
			}),
			NotNow = TConcat({
				T(968773535725, --[[ModItemVoiceResponse Antonov NotNow VoiceResponse NotNow - When interacting with a NPC while in combat voice:Antonov]] "That is negative."),
				T(353361473880, --[[ModItemVoiceResponse Antonov NotNow VoiceResponse NotNow - When interacting with a NPC while in combat voice:Antonov]] "I do not think so.")
			}),
			OpponentFound = TConcat({
				T(357280822809, --[[ModItemVoiceResponse Antonov OpponentFound VoiceResponse OpponentFound - Enemy spotted. voice:Antonov]] "Have eyes on."),
				T(245568766193, --[[ModItemVoiceResponse Antonov OpponentFound VoiceResponse OpponentFound - Enemy spotted. voice:Antonov]] "Unknown threat, nearby."),
				T(465688034038, --[[ModItemVoiceResponse Antonov OpponentFound VoiceResponse OpponentFound - Enemy spotted. voice:Antonov]] "Hostile.")
			}),
			OpponentKilled = TConcat({
				T(329264738646, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "I get bonus for that kill, yes?"),
				T(521577414778, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "No last words? I don't care anyway."),
				T(114425944056, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "Usually I get paid to do this, that was for fun."),
				T(672468610362, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "You are not my first, you will not be my last."),
				T(580739671374, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "Killing comes easy to me."),
				T(296428268215, --[[ModItemVoiceResponse Antonov OpponentKilled VoiceResponse OpponentKilled - When opponent killed (unless OponentKilledCrit or OponentKilled multi isplayed) voice:Antonov]] "Do svidaniya, you walking pile of shit.")
			}),
			OpponentKilledAnimal = TConcat({
				T(990690319174, --[[ModItemVoiceResponse Antonov OpponentKilledAnimal VoiceResponse OpponentKilledAnimal - When animal is killed voice:Antonov]] "Everyone and everything has their kill switch"),
				T(213056289141, --[[ModItemVoiceResponse Antonov OpponentKilledAnimal VoiceResponse OpponentKilledAnimal - When animal is killed voice:Antonov]] "Mother nature motherfuckers.")
			}),
			OpponentKilledHeadshot = TConcat({
				T(238115267222, --[[ModItemVoiceResponse Antonov OpponentKilledHeadshot VoiceResponse OpponentKilledHeadshot - Opponent killed with a headshot voice:Antonov]] "Next!"),
				T(461285430176, --[[ModItemVoiceResponse Antonov OpponentKilledHeadshot VoiceResponse OpponentKilledHeadshot - Opponent killed with a headshot voice:Antonov]] "We call that, the mafia haircut."),
				T(925363782982, --[[ModItemVoiceResponse Antonov OpponentKilledHeadshot VoiceResponse OpponentKilledHeadshot - Opponent killed with a headshot voice:Antonov]] "Say goodbye, to your face."),
				T(464999786378, --[[ModItemVoiceResponse Antonov OpponentKilledHeadshot VoiceResponse OpponentKilledHeadshot - Opponent killed with a headshot voice:Antonov]] "Crossed you off my fucking list!")
			}),
			OpponentKilledMelee = TConcat({
				T(814504496171, --[[ModItemVoiceResponse Antonov OpponentKilledMelee VoiceResponse OpponentKilledMelee - Played when killing a unit with melee weapon voice:Antonov]] "All I need is steel and my right arm."),
				T(340609774464, --[[ModItemVoiceResponse Antonov OpponentKilledMelee VoiceResponse OpponentKilledMelee - Played when killing a unit with melee weapon voice:Antonov]] "I do it old fashioned way.")
			}),
			OpponentKilledStealth = TConcat({
				T(843765857670, --[[ModItemVoiceResponse Antonov OpponentKilledStealth VoiceResponse OpponentKilledStealth - Played when a Stealth kill happens. Voice should be shushed (except Steroid) voice:Antonov]] "Everyone and everything has their kill switch."),
				T(871354181410, --[[ModItemVoiceResponse Antonov OpponentKilledStealth VoiceResponse OpponentKilledStealth - Played when a Stealth kill happens. Voice should be shushed (except Steroid) voice:Antonov]] "They knew not what claimed them."),
				T(241673361482, --[[ModItemVoiceResponse Antonov OpponentKilledStealth VoiceResponse OpponentKilledStealth - Played when a Stealth kill happens. Voice should be shushed (except Steroid) voice:Antonov]] "Caught them sleeping.")
			}),
			Optimist = TConcat({
				T(743721235875, --[[ModItemVoiceResponse Antonov Optimist VoiceResponse Optimist - When a loss of morale is prevented because of the Optimist quirk voice:Antonov]] "I think I am having good day.")
			}),
			Order = TConcat({
				T(641885393298, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "Good call, on it."),
				T(152853991762, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "Moving as instructed."),
				T(667680047310, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "Copy, moving."),
				T(523495539045, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "Moving as ordered."),
				T(620090781740, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "That's a hard copy."),
				T(833581499851, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "Big man now, ah?"),
				T(698706349108, --[[ModItemVoiceResponse Antonov Order VoiceResponse Order - When movement ordered (out of combat) Should be very short (3-5 words) voice:Antonov]] "I'm in no position to argue.")
			}),
			Outnumbered = TConcat({
				T(967056316291, --[[ModItemVoiceResponse Antonov Outnumbered VoiceResponse Outnumbered - Unit sees more enemies than allies voice:Antonov]] "Fuck! Help me up!")
			}),
			Overwatch = TConcat({
				T(296450584372, --[[ModItemVoiceResponse Antonov Overwatch VoiceResponse Overwatch - When setting overwatch voice:Antonov]] "Patrolling on your six.")
			}),
			OverwatchSelection = TConcat({
				T(680697728260, --[[ModItemVoiceResponse Antonov OverwatchSelection VoiceResponse OverwatchSelection - Selected when under Overwatch. voice:Antonov]] "Patrolling on your six!")
			}),
			Pain = TConcat({
				T(113699126043, --[[ModItemVoiceResponse Antonov Pain VoiceResponse Pain - Hit by an attack (if surrounded SurroundedPain is played instead). Short. These are emotes - disregard the written text. voice:Antonov]] "Gah!"),
				T(637955771910, --[[ModItemVoiceResponse Antonov Pain VoiceResponse Pain - Hit by an attack (if surrounded SurroundedPain is played instead). Short. These are emotes - disregard the written text. voice:Antonov]] "Fuck!"),
				T(474951409132, --[[ModItemVoiceResponse Antonov Pain VoiceResponse Pain - Hit by an attack (if surrounded SurroundedPain is played instead). Short. These are emotes - disregard the written text. voice:Antonov]] "Aah!")
			}),
			PinDown = TConcat({
				T(352995896651, --[[ModItemVoiceResponse Antonov PinDown VoiceResponse PinDown - When pinning down (sniper rifles only) voice:Antonov]] "There can be no escape from Antonov!"),
				T(915785829475, --[[ModItemVoiceResponse Antonov PinDown VoiceResponse PinDown - When pinning down (sniper rifles only) voice:Antonov]] "Death finds you this day!"),
				T(817692123472, --[[ModItemVoiceResponse Antonov PinDown VoiceResponse PinDown - When pinning down (sniper rifles only) voice:Antonov]] "Nothing personal. I just hate you.")
			}),
			PraisesBuddy1 = TConcat({
				T(711840138778, --[[ModItemVoiceResponse Antonov PraisesBuddy1 VoiceResponse PraisesBuddy1 - Played on a successful kill by Ivan. voice:Antonov]] "Do not piss this one off, ah?"),
				T(447396147897, --[[ModItemVoiceResponse Antonov PraisesBuddy1 VoiceResponse PraisesBuddy1 - Played on a successful kill by Ivan. voice:Antonov]] "You're not fucking around.")
			}),
			PraisesBuddy2 = TConcat({
				T(899192922857, --[[ModItemVoiceResponse Antonov PraisesBuddy2 VoiceResponse PraisesBuddy2 - Played on a successful kill by Omryn. voice:Antonov]] "Do not piss this one off, ah?"),
				T(343007144850, --[[ModItemVoiceResponse Antonov PraisesBuddy2 VoiceResponse PraisesBuddy2 - Played on a successful kill by Omryn. voice:Antonov]] "You're not fucking around.")
			}),
			PraisesFemale = TConcat({
				T(216341355110, --[[ModItemVoiceResponse Antonov PraisesFemale VoiceResponse PraisesFemale - Played when a female merc makes a kill (20% chance) voice:Antonov]] "Good. Very Good."),
				T(136170908478, --[[ModItemVoiceResponse Antonov PraisesFemale VoiceResponse PraisesFemale - Played when a female merc makes a kill (20% chance) voice:Antonov]] "Keep it up.")
			}),
			PraisesLearnToLike1 = TConcat({
				T(476147224248, --[[ModItemVoiceResponse Antonov PraisesLearnToLike1 VoiceResponse PraisesLearnToLike1 - Played on a successful kill by Igor. voice:Antonov]] "Excellent work."),
				T(523922015888, --[[ModItemVoiceResponse Antonov PraisesLearnToLike1 VoiceResponse PraisesLearnToLike1 - Played on a successful kill by Igor. voice:Antonov]] "Oof... Good hit.")
			}),
			PraisesLearnToLike2 = TConcat({
				T(139079243063, --[[ModItemVoiceResponse Antonov PraisesLearnToLike2 VoiceResponse PraisesLearnToLike2 - Played on a successful kill by Kalyna. voice:Antonov]] "Excellent work."),
				T(583167497153, --[[ModItemVoiceResponse Antonov PraisesLearnToLike2 VoiceResponse PraisesLearnToLike2 - Played on a successful kill by Kalyna. voice:Antonov]] "Oof... Good hit.")
			}),
			PraisesMale = TConcat({
				T(483157869718, --[[ModItemVoiceResponse Antonov PraisesMale VoiceResponse PraisesMale - Played when a male merc makes a kill (20% chance) voice:Antonov]] "Good shoot!"),
				T(847841541393, --[[ModItemVoiceResponse Antonov PraisesMale VoiceResponse PraisesMale - Played when a male merc makes a kill (20% chance) voice:Antonov]] "That is how it is done.")
			}),
			SectorArrived = TConcat({
				T(434630938833, --[[ModItemVoiceResponse Antonov SectorArrived VoiceResponse SectorArrived - SatView - new sector reached. Played by random merc in squad. voice:Antonov]] "I'm behind, guns forward."),
				T(998735893637, --[[ModItemVoiceResponse Antonov SectorArrived VoiceResponse SectorArrived - SatView - new sector reached. Played by random merc in squad. voice:Antonov]] "Moving on you, formation tight.")
			}),
			Selection = TConcat({
				T(886473242382, --[[ModItemVoiceResponse Antonov Selection VoiceResponse Selection - when selected or autoselected voice:Antonov]] "What do you need?"),
				T(127137451060, --[[ModItemVoiceResponse Antonov Selection VoiceResponse Selection - when selected or autoselected voice:Antonov]] "Hey."),
				T(797562637350, --[[ModItemVoiceResponse Antonov Selection VoiceResponse Selection - when selected or autoselected voice:Antonov]] "Hmm?")
			}),
			SelectionStealth = TConcat({
				T(368924532520, --[[ModItemVoiceResponse Antonov SelectionStealth VoiceResponse SelectionStealth - when selected or autoselected voice:Antonov]] "Braindead duraki are in for surprise."),
				T(882061946271, --[[ModItemVoiceResponse Antonov SelectionStealth VoiceResponse SelectionStealth - when selected or autoselected voice:Antonov]] "They will not see it coming. They never do.")
			}),
			SeriouslyWounded = TConcat({
				T(544148262483, --[[ModItemVoiceResponse Antonov SeriouslyWounded VoiceResponse SeriouslyWounded - Unit is seriously wounded (3 or more wounds). Add a pain noise at the begining. voice:Antonov]] "I need medic, now!")
			}),
			Startled = TConcat({
				T(853660629915, --[[ModItemVoiceResponse Antonov Startled VoiceResponse Startled - Startled by hearing a sudden noise voice:Antonov]] "Ah... Hah.. Hah...")
			}),
			SurroundedPain = TConcat({
				T(221491832698, --[[ModItemVoiceResponse Antonov SurroundedPain VoiceResponse SurroundedPain - hit by an attack when surrounded. Situation should be very dire voice:Antonov]] "Fuck! Help me up!"),
				T(778113982076, --[[ModItemVoiceResponse Antonov SurroundedPain VoiceResponse SurroundedPain - hit by an attack when surrounded. Situation should be very dire voice:Antonov]] "Gah! I am under fire!"),
				T(367700617079, --[[ModItemVoiceResponse Antonov SurroundedPain VoiceResponse SurroundedPain - hit by an attack when surrounded. Situation should be very dire voice:Antonov]] "Gah! Shit!")
			}),
			TacticalCareful = TConcat({
				T(157463782064, --[[ModItemVoiceResponse Antonov TacticalCareful VoiceResponse TacticalCareful - The other team is making gains during the battle (inflicted 2+ wounds during their turn) voice:Antonov]] "We hold this line.")
			}),
			TacticalFocus = TConcat({
				T(643475350907, --[[ModItemVoiceResponse Antonov TacticalFocus VoiceResponse TacticalFocus - The team has missed  3+ times voice:Antonov]] "Dig in and push them back!")
			}),
			TacticalKilling = TConcat({
				T(937552019982, --[[ModItemVoiceResponse Antonov TacticalKilling VoiceResponse TacticalKilling - The team is winning the battle  (2+ units have been downed/killed) voice:Antonov]] "Not bad, great work everyone.")
			}),
			TacticalLastEnemy = TConcat({
				T(504154625048, --[[ModItemVoiceResponse Antonov TacticalLastEnemy VoiceResponse TacticalLastEnemy - A single enemy remains voice:Antonov]] "Your numbers meant little.")
			}),
			TacticalLoss = TConcat({
				T(399120095528, --[[ModItemVoiceResponse Antonov TacticalLoss VoiceResponse TacticalLoss - The team is losing the battle (2+ units have been downed/killed) voice:Antonov]] "Keep fighting!")
			}),
			TacticalPressing = TConcat({
				T(223987793860, --[[ModItemVoiceResponse Antonov TacticalPressing VoiceResponse TacticalPressing - The team is making gains during the battle (2+ wounds have been inflicted) voice:Antonov]] "More fun than prison riot.")
			}),
			TacticalReposition = TConcat({
				T(529491889151, --[[ModItemVoiceResponse Antonov TacticalReposition VoiceResponse TacticalReposition - The team has not started shooting but is repositioning during the battle voice:Antonov]] "We hold this line."),
				T(846976150972, --[[ModItemVoiceResponse Antonov TacticalReposition VoiceResponse TacticalReposition - The team has not started shooting but is repositioning during the battle voice:Antonov]] "Acknowledge waypoint coords.")
			}),
			TacticalRevenge = TConcat({
				T(490102523657, --[[ModItemVoiceResponse Antonov TacticalRevenge VoiceResponse TacticalRevenge - A unit from the team has been downed/killed voice:Antonov]] "I hunger for revenge."),
				T(737923267771, --[[ModItemVoiceResponse Antonov TacticalRevenge VoiceResponse TacticalRevenge - A unit from the team has been downed/killed voice:Antonov]] "Someone is in trouble now. Big trouble.")
			}),
			TacticalTaunt = TConcat({
				T(284040906386, --[[ModItemVoiceResponse Antonov TacticalTaunt VoiceResponse TacticalTaunt - The team has visible enemies from the other team and is shouting things at them voice:Antonov]] "Fucking dumbasses.")
			}),
			TakeCover = TConcat({
				T(394557314174, --[[ModItemVoiceResponse Antonov TakeCover VoiceResponse TakeCover - Played when the Take Cover action is used voice:Antonov]] "Setting up barricade."),
				T(192954699923, --[[ModItemVoiceResponse Antonov TakeCover VoiceResponse TakeCover - Played when the Take Cover action is used voice:Antonov]] "Deploying cover.")
			}),
			ThreatSelection = TConcat({
				T(209658636182, --[[ModItemVoiceResponse Antonov ThreatSelection VoiceResponse ThreatSelection - Selected when under Pinned Down or in the area of an incoming explosion. voice:Antonov]] "Keep it together, keep it together!")
			}),
			ThrowGrenade = TConcat({
				T(456572029250, --[[ModItemVoiceResponse Antonov ThrowGrenade VoiceResponse ThrowGrenade - When throwing grenade. Voiced line starts before the explosion. voice:Antonov]] "Stand together, fall apart.")
			}),
			Tired = TConcat({
				T(425972036187, --[[ModItemVoiceResponse Antonov Tired VoiceResponse Tired - when the merc becomes tired voice:Antonov]] "Enough for today. Send helicopter. Skura!")
			}),
			TrainingReceived = TConcat({
				T(515988401306, --[[ModItemVoiceResponse Antonov TrainingReceived VoiceResponse TrainingReceived - Training received in SatView. Uses LevelUp if blank. voice:Antonov]] "I turn weakness into strength.")
			}),
			Travelling = TConcat({
				T(389570061646, --[[ModItemVoiceResponse Antonov Travelling VoiceResponse Travelling - When a squad is travelling and enters new sector that is not the final destination of the travel. Played by the squad leader voice:Antonov]] "I'm behind, guns forward.")
			}),
			ValuableItemFound = TConcat({
				T(115931174283, --[[ModItemVoiceResponse Antonov ValuableItemFound VoiceResponse ValuableItemFound - Loot container opened with a valuable item inside voice:Antonov]] "This is something I can appreciate.")
			}),
			Wounded = TConcat({
				T(392685118180, --[[ModItemVoiceResponse Antonov Wounded VoiceResponse Wounded - Unit is Wounded. (When the Wounded VR is played, the Pain VR should be suppressed.) Add a pain noise at the begining voice:Antonov]] "Gah! Damn it!"),
				T(873286507107, --[[ModItemVoiceResponse Antonov Wounded VoiceResponse Wounded - Unit is Wounded. (When the Wounded VR is played, the Pain VR should be suppressed.) Add a pain noise at the begining voice:Antonov]] "Ahh! Taking hits!")
			}),
			comment = "Holds all the text responces",
			group = "MercenariesNew",
			id = "Antonov",
		}),
		}),
}
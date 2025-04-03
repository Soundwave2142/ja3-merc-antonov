UndefineClass('Antonov')
DefineClass.Antonov = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	comment = "Holds overall information about merc, from stats to references of other components",
	object_class = "UnitData",
	Health = 89,
	Agility = 80,
	Dexterity = 83,
	Strength = 70,
	Wisdom = 66,
	Leadership = 7,
	Marksmanship = 95,
	Mechanical = 23,
	Explosives = 27,
	Medical = 31,
	Portrait = "Mod/trKkXGq/Images/portrait_small.png",
	BigPortrait = "Mod/trKkXGq/Images/portrait_full.png",
	IsMercenary = true,
	Name = T(245431349293, --[[ModItemUnitDataCompositeDef Antonov Name]] "Maxim Antonov"),
	Nick = T(202676591599, --[[ModItemUnitDataCompositeDef Antonov Nick]] "Antonov"),
	AllCapsNick = T(966988130237, --[[ModItemUnitDataCompositeDef Antonov AllCapsNick]] "ANTONOV"),
	Bio = T(799997975520, --[[ModItemUnitDataCompositeDef Antonov Bio]] "A former mobster, Antonov entered the military to reduce his sentence. Distrusted by his squad because of his criminal past, he found himself assigned to duties no one else wanted. Went missing during late stages of the Soviet-Afghan war, but reappered after the collapse of USSR Antonov, this time among the ranks of A.I.M."),
	Nationality = "Russia",
	Title = T(790567408304, --[[ModItemUnitDataCompositeDef Antonov Title]] "In Mafia, I killed many bosses"),
	Email = T(612463336785, --[[ModItemUnitDataCompositeDef Antonov Email]] "AntonovMaxim@aim.com"),
	snype_nick = T(120094897283, --[[ModItemUnitDataCompositeDef Antonov snype_nick]] "ANTONOV"),
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(982096208443, --[[ModItemUnitDataCompositeDef Antonov Text Offline ChatMessage voice:Antonov]] "If you need me, just follow trail of hot brass."),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(372718621820, --[[ModItemUnitDataCompositeDef Antonov Text GreetingAndOffer ChatMessage voice:Antonov]] "What do you need?"),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(478305994139, --[[ModItemUnitDataCompositeDef Antonov Text ConversationRestart ChatMessage voice:Antonov]] "I feel optimistic about future."),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(634859577116, --[[ModItemUnitDataCompositeDef Antonov Text IdleLine ChatMessage voice:Antonov]] "And now back to work."),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(879581990080, --[[ModItemUnitDataCompositeDef Antonov Text PartingWords ChatMessage voice:Antonov]] "We are done here. Send chopper and vodka."),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(219999570648, --[[ModItemUnitDataCompositeDef Antonov Text RehireIntro ChatMessage voice:Antonov]] "Don't count me out, huh?"),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(755993364762, --[[ModItemUnitDataCompositeDef Antonov Text RehireOutro ChatMessage voice:Antonov]] "It is rare, but today, fortune smiles on Antonov."),
		}),
	},
	StartingSalary = 1986,
	SalaryIncrease = 200,
	SalaryMaxLv = 6000,
	StartingLevel = 3,
	CustomEquipGear = function (self, items)  end,
	Likes = {
		"Ivan",
		"Omryn",
	},
	LearnToLike = {
		"Igor",
		"Kalyna",
	},
	Dislikes = {
		"Grizzly",
		"Meltdown",
	},
	LearnToDislike = {
		"Steroid",
		"Red",
	},
	StartingPerks = {
		"AntonovEffect",
		"Loner",
		"Stealthy",
		"Optimist",
		"Deadeye",
		"DeathFromAbove",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "Antonov",
		}),
	},
	Equipment = {
		"Antonov",
	},
	Tier = "Veteran",
	Specialization = "Marksmen",
	pollyvoice = "Nicole",
	gender = "Male",
	blocked_spots = set(),
	VoiceResponseId = "Antonov",
	FallbackMissingVR = "Ivan",
	DaysUntilOnline = 1,
}


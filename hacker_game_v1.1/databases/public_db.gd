extends Resource
class_name PublicDB

func get_targets():
	# Extensive but not procedurally generated: we define a static list.
	# Varying difficulty, loot, and xp by hand.
	return [
		{
			"unique_id": 1001,
			"id": "john_doe@oldleaks.com",
			"risk": "low",
			"difficulty": 0.3,
			"loot": 20,
			"base_xp": 50,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1002,
			"id": "jane_smith@somecorp.com",
			"risk": "low",
			"difficulty": 0.4,
			"loot": 25,
			"base_xp": 5,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1003,
			"id": "mark_jones@financeco.org",
			"risk": "medium",
			"difficulty": 0.6,
			"loot": 50,
			"base_xp": 10,
			"security_level": 1,
			"security": "basic"
		},
		{
			"unique_id": 1004,
			"id": "alice_lee@techhub.net",
			"risk": "medium",
			"difficulty": 0.5,
			"loot": 40,
			"base_xp": 8,
			"security_level": 1,
			"security": "basic"
		},
		{
			"unique_id": 1005,
			"id": "charlie_rivera@venturecap.com",
			"risk": "high",
			"difficulty": 0.8,
			"loot": 100,
			"base_xp": 20,
			"security_level": 1,
			"security": "advanced"
		},
		{
			"unique_id": 1006,
			"id": "daniel_gray@xcorporate.com",
			"risk": "high",
			"difficulty": 0.85,
			"loot": 150,
			"base_xp": 25,
			"security_level": 2,
			"security": "advanced"
		},
		{
			"unique_id": 1007,
			"id": "emily_watson@securefiles.org",
			"risk": "medium",
			"difficulty": 0.7,
			"loot": 70,
			"base_xp": 12,
			"security_level": 2,
			"security": "advanced"
		},
		{
			"unique_id": 1008,
			"id": "franklin_burns@lowbank.net",
			"risk": "low",
			"difficulty": 0.2,
			"loot": 15,
			"base_xp": 3,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1009,
			"id": "grace_coleman@privacyplus.io",
			"risk": "very high",
			"difficulty": 0.95,
			"loot": 250,
			"base_xp": 50,
			"security_level": 3,
			"security": "military-grade"
		},
		{
			"unique_id": 1010,
			"id": "harvey_kane@futurize.com",
			"risk": "medium",
			"difficulty": 0.55,
			"loot": 45,
			"base_xp": 8,
			"security_level": 2,
			"security": "basic"
		},
		{
			"unique_id": 1011,
			"id": "isabella_nova@onlinetraders.biz",
			"risk": "low",
			"difficulty": 0.35,
			"loot": 30,
			"base_xp": 5,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1012,
			"id": "jacob_roth@privdatasystems.com",
			"risk": "high",
			"difficulty": 0.75,
			"loot": 120,
			"base_xp": 18,
			"security_level": 2,
			"security": "enhanced"
		},
		{
			"unique_id": 1013,
			"id": "katherine_lynn@researchgate.io",
			"risk": "very high",
			"difficulty": 0.9,
			"loot": 300,
			"base_xp": 50,
			"security_level": 3,
			"security": "military-grade"
		},
		{
			"unique_id": 1014,
			"id": "leo_harper@cloudsource.app",
			"risk": "medium",
			"difficulty": 0.6,
			"loot": 60,
			"base_xp": 12,
			"security_level": 2,
			"security": "basic"
		},
		{
			"unique_id": 1015,
			"id": "mia_reyes@stealthnet.net",
			"risk": "very high",
			"difficulty": 0.98,
			"loot": 500,
			"base_xp": 100,
			"security_level": 4,
			"security": "military-grade"
		},
		{
			"unique_id": 1016,
			"id": "nathan_pierce@instantmailer.net",
			"risk": "low",
			"difficulty": 0.3,
			"loot": 20,
			"base_xp": 4,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1017,
			"id": "olivia_moore@freeshop.xyz",
			"risk": "low",
			"difficulty": 0.35,
			"loot": 22,
			"base_xp": 5,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1018,
			"id": "patrick_hayes@cloudvault.com",
			"risk": "medium",
			"difficulty": 0.5,
			"loot": 55,
			"base_xp": 12,
			"security_level": 2,
			"security": "basic"
		},
		{
			"unique_id": 1019,
			"id": "quincy_rogers@bytecrypt.io",
			"risk": "medium",
			"difficulty": 0.55,
			"loot": 48,
			"base_xp": 10,
			"security_level": 2,
			"security": "basic"
		},
		{
			"unique_id": 1020,
			"id": "rachel_evans@streamdata.tv",
			"risk": "medium",
			"difficulty": 0.6,
			"loot": 65,
			"base_xp": 15,
			"security_level": 2,
			"security": "enhanced"
		},
		{
			"unique_id": 1021,
			"id": "steven_grant@securenet.io",
			"risk": "high",
			"difficulty": 0.8,
			"loot": 125,
			"base_xp": 25,
			"security_level": 3,
			"security": "advanced"
		},
		{
			"unique_id": 1022,
			"id": "taylor_snow@marketanalytics.net",
			"risk": "high",
			"difficulty": 0.75,
			"loot": 110,
			"base_xp": 20,
			"security_level": 3,
			"security": "advanced"
		},
		{
			"unique_id": 1023,
			"id": "ursula_diaz@blockchainvault.io",
			"risk": "very high",
			"difficulty": 0.9,
			"loot": 400,
			"base_xp": 50,
			"security_level": 4,
			"security": "military-grade"
		},
		{
			"unique_id": 1024,
			"id": "victor_torres@quantumgate.ai",
			"risk": "very high",
			"difficulty": 0.95,
			"loot": 600,
			"base_xp": 75,
			"security_level": 4,
			"security": "military-grade"
		},
		{
			"unique_id": 1025,
			"id": "wendy_harper@encryptedfile.io",
			"risk": "medium",
			"difficulty": 0.6,
			"loot": 70,
			"base_xp": 15,
			"security_level": 2,
			"security": "enhanced"
		},
		{
			"unique_id": 1026,
			"id": "xavier_ross@vaultprotection.net",
			"risk": "very high",
			"difficulty": 0.98,
			"loot": 900,
			"base_xp": 100,
			"security_level": 4,
			"security": "military-grade"
		},
		{
			"unique_id": 1027,
			"id": "yasmine_ali@backdoorcloud.biz",
			"risk": "low",
			"difficulty": 0.25,
			"loot": 30,
			"base_xp": 6,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1028,
			"id": "zack_thompson@newstoday.info",
			"risk": "low",
			"difficulty": 0.2,
			"loot": 18,
			"base_xp": 4,
			"security_level": 1,
			"security": "none"
		},
		{
			"unique_id": 1029,
			"id": "yvonne_gale@deepwebmail.io",
			"risk": "high",
			"difficulty": 0.85,
			"loot": 175,
			"base_xp": 30,
			"security_level": 3,
			"security": "advanced"
		},
		{
			"unique_id": 1030,
			"id": "aaron_carter@cypherhold.com",
			"risk": "very high",
			"difficulty": 0.98,
			"loot": 1200,
			"base_xp": 150,
			"security_level": 5,
			"security": "military-grade"
		}
	]

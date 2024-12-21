extends Node
class_name Techniques

var techniques_data = {
	"phishing": {
		"xp_required": 0,
		"success_modifier": 1.0
	},
	"buffer_overflow": {
		"xp_required": 50,
		"success_modifier": 1.1
	},
	"xss_injection": {
		"xp_required": 100,
		"success_modifier": 1.2
	}
}

func is_technique_unlocked(tech_name: String) -> bool:
	return tech_name in GameState.unlocked_techniques

func is_valid_technique(tech_name: String) -> bool:
	return techniques_data.has(tech_name) and is_technique_unlocked(tech_name)

func get_technique_success_modifier(tech_name: String) -> float:
	if techniques_data.has(tech_name):
		return float(techniques_data[tech_name]["success_modifier"])
	return 1.0

func check_for_new_unlocks():
	for tech_name in techniques_data.keys():
		if tech_name not in GameState.unlocked_techniques:
			var xp_req = techniques_data[tech_name]["xp_required"]
			if GameState.previous_xp < xp_req and GameState.xp >= xp_req:
				GameState.unlocked_techniques.append(tech_name)
				var msg = "Milestone: You have unlocked the '%s' technique!" % tech_name
				GameState.player_logs.append(msg)

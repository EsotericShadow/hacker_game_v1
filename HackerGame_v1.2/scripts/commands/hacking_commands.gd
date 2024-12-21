extends Node

const TechniquesClass = preload("res://scripts/commands/techniques.gd")
var Techniques = TechniquesClass.new()

func _cmd_target_exploit(parts: Array) -> String:
	if parts.size() < 2:
		return "Usage: target.exploit <unique_id> --technique=<technique_name>"

	var unique_id = parts[1]
	var technique = _extract_technique(parts)

	if technique == "":
		return "Usage: target.exploit <unique_id> --technique=<technique_name>"

	var target = _find_target(unique_id)
	if target.size() == 0:
		return "Target '%s' not found in owned databases." % unique_id

	if not Techniques.is_valid_technique(technique):
		return "You have not unlocked the '%s' technique yet or it doesn't exist." % technique

	var success_chance = _calculate_success_chance(target, technique)
	var success = _attempt_hack(success_chance)

	if success:
		var result = _handle_success(unique_id, target, technique)
		Techniques.check_for_new_unlocks() 
		return result
	else:
		return _handle_failure(unique_id, target, technique)

func _extract_technique(parts: Array) -> String:
	var technique = ""
	for i in range(2, parts.size()):
		var p = parts[i]
		if p.begins_with("--technique="):
			technique = p.substr(12, p.length() - 12).to_lower()
	return technique

func _find_target(unique_id: String) -> Dictionary:
	for db_name in GameState.owned_databases:
		if GameState.databases.has(db_name):
			for t in GameState.databases[db_name]:
				if str(t["unique_id"]) == str(unique_id):
					return t
	return {}

func _calculate_success_chance(target: Dictionary, _technique: String) -> float:
	var base_chance = 1.0 - float(target["difficulty"])
	var technique_modifier = Techniques.get_technique_success_modifier(_technique)
	var final_chance = base_chance * technique_modifier
	return min(final_chance, 1.0)

func _attempt_hack(success_chance: float) -> bool:
	var rand_val = randf()
	return rand_val <= success_chance

func _handle_success(unique_id: String, target: Dictionary, technique: String) -> String:
	GameState.increment_trace(1)
	var previously_compromised = GameState.compromised_targets.has(unique_id) and GameState.compromised_targets[unique_id]

	if previously_compromised:
		GameState.player_logs.append("Hacked %s again, but target already compromised. No additional reward." % unique_id)
		_update_security_after_attempt(unique_id, target, true)
		return "Hack successful, but the target is already cleaned out. No additional reward."
	else:
		var gained_cc = int(target["loot"])
		var gained_xp = int(target["base_xp"])
		GameState.cryptocoins += gained_cc
		GameState.xp += gained_xp * randf_range(2, 4)
		GameState.compromised_targets[unique_id] = true
		GameState.player_logs.append("Successfully exploited target %s using %s. Gained %d CC and %d XP." % [target["unique_id"], technique, gained_cc, gained_xp])
		_update_security_after_attempt(unique_id, target, true)
		return "Hack successful! +%d CC, +%d XP." % [gained_cc, gained_xp]

func _handle_failure(unique_id: String, target: Dictionary, technique: String) -> String:
	var gained_xp = int(target["base_xp"])
	GameState.increment_trace(2)
	GameState.xp += gained_xp
	GameState.player_logs.append("Failed to exploit target %s using %s." % [target["unique_id"], technique])
	_update_security_after_attempt(unique_id, target, false)
	return "Hack failed! No reward. +%d XP." % [gained_xp]

func _update_security_after_attempt(unique_id: String, target: Dictionary, _success: bool):
	target["security_level"] = int(target["security_level"]) + 1

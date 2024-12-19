extends Node

func _cmd_db_list(_parts: Array) -> String:
	return "Owned Databases:\n" + "\n".join(GameState.owned_databases)

func _cmd_db_view(parts: Array) -> String:
	if parts.size() < 2:
		return "Usage: db.view <database_name>"
	var db_name = parts[1]
	if (db_name in GameState.owned_databases) and GameState.databases.has(db_name):
		var targets = GameState.databases[db_name]
		if targets.size() == 0:
			return "No targets found in %s" % db_name
		var output = "Targets in %s:\n" % db_name
		for t in targets:
			output += "%s (risk: %s, security: %s)\n" % [t["id"], t["risk"], t["security"]]
		return output.strip_edges()
	else:
		return "Database '%s' not found or not owned." % db_name

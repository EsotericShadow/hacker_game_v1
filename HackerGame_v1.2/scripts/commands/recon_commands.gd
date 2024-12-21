extends Node

func _cmd_db_list(_parts: Array) -> String:
	return "Owned Databases:\n" + "\n".join(GameState.owned_databases)

func _cmd_db_view(parts: Array) -> String:
	if parts.size() < 2:
		return "Usage: db.view <database_name>"

	var db_name = parts[1]
	if (db_name in GameState.owned_databases) and GameState.databases.has(db_name):
		var db_instance = GameState.databases[db_name]
		var targets = db_instance.get_paginated_target_data()  # Use the correct function!
		if targets.size() == 0:
			return "No targets found in %s" % db_name
		return db_instance.get_paginated_targets()  # Call formatted view here
	else:
		return "Database '%s' not found or not owned." % db_name

func _cmd_next(_parts: Array) -> String:
	var db_instance = GameState.databases["public_db"]
	db_instance.next_page()
	return _cmd_db_view(["db.view", "public_db"])

func _cmd_back(_parts: Array) -> String:
	var db_instance = GameState.databases["public_db"]
	db_instance.previous_page()
	return _cmd_db_view(["db.view", "public_db"])

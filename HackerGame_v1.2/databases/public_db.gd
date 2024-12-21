extends Resource
class_name PublicDB

var total_targets = 50  # Number of targets to generate at once
var page_size = 5  # Number of targets to display per page
var current_page = 0  # Current page for pagination
var targets = []
var total_generated_targets = 0  # Tracks how many total targets have been created

# Called once at the start to generate initial targets
func _init():
	_generate_targets(total_targets)

# Generate a set number of random targets for the database
func _generate_targets(amount: int):
	var first_names = ["john", "jane", "mark", "alice", "charlie", "daniel", "emily", "franklin", "grace", "harvey"]
	var last_names = ["doe", "smith", "jones", "lee", "rivera", "gray", "watson", "burns", "coleman", "kane"]
	var domains = ["oldleaks.com", "techhub.net", "financeco.org", "venturecap.com", "securefiles.org"]

	for i in range(amount):
		var unique_id = total_generated_targets + 1000  # Ensure unique identifier
		var email = "%s_%s@%s" % [first_names[randi() % first_names.size()], last_names[randi() % last_names.size()], domains[randi() % domains.size()]]
		var difficulty = randf_range(0.2, 0.95)
		var loot = int(randf_range(10, 1000))
		var base_xp = int(randf_range(5, 100))
		var security_types = ["none", "basic", "enhanced", "advanced", "military-grade"]
		var security = security_types[randi() % security_types.size()]
		var risk = self._calculate_risk(difficulty)
		var target = {
			"unique_id": unique_id,
			"email": email,
			"risk": risk,
			"difficulty": difficulty,
			"loot": loot,
			"base_xp": base_xp,
			"security_level": 1,
			"security": security
		}
		targets.append(target)
		total_generated_targets += 1

# Calculate the risk level based on difficulty
func _calculate_risk(difficulty: float) -> String:
	if difficulty < 0.3:
		return "low"
	elif difficulty < 0.6:
		return "medium"
	elif difficulty < 0.8:
		return "high"
	else:
		return "very high"

# Get paginated target data (this is an Array)
func get_paginated_target_data() -> Array:
	var start_index = current_page * page_size
	var end_index = min(start_index + page_size, targets.size())
	return targets.slice(start_index, end_index)

# Get paginated targets as ASCII formatted string
func get_paginated_targets() -> String:
	var page_targets = get_paginated_target_data()
	var output = ""
	var border = "+-----------------------------------------------+\n"

	for t in page_targets:
		output += border
		output += "|  Unique ID: %s\n" % pad_left(str(t["unique_id"]), 6)
		output += "|  Email    : %s\n" % pad_right(t["email"], 30)
		output += "|  Risk     : %s\n" % pad_right(t["risk"].capitalize(), 10)
		output += "|  Security : %s\n" % pad_right(t["security"].capitalize(), 15)
		output += border

	return output

# Move to the next page
func next_page():
	if (current_page + 1) * page_size >= targets.size():
		_generate_targets(total_targets)  # Generate more targets if we are at the last page
	current_page += 1

# Move to the previous page
func previous_page():
	if current_page > 0:
		current_page -= 1

# Custom string padding function to pad the left side of a string
func pad_left(text: String, total_length: int) -> String:
	if text.length() >= total_length:
		return text
	var padding = String(" ").repeat(total_length - text.length())
	return padding + text

# Custom string padding function to pad the right side of a string
func pad_right(text: String, total_length: int) -> String:
	if text.length() >= total_length:
		return text
	var padding = String(" ").repeat(total_length - text.length())
	return text + padding

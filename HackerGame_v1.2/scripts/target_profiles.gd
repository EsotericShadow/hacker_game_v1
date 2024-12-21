extends Node
class_name TargetProfiles

# Stores all target profiles in a dictionary { unique_id: profile }
var profiles = {}

# Adds a target profile
func add_target_profile(profile: Dictionary):
	var unique_id = profile["unique_id"]
	if not profiles.has(unique_id):
		profiles[unique_id] = profile

# Get an existing target profile
func get_target_profile(unique_id: int) -> Dictionary:
	if profiles.has(unique_id):
		return profiles[unique_id]
	return {}

# Create and store a profile for the given unique_id
func create_target_profile(public_db_instance: Resource, unique_id: int) -> Dictionary:
	if profiles.has(unique_id):
		return profiles[unique_id]
	
	var profile = public_db_instance.get_target_profile(unique_id)
	if profile.size() > 0:
		profiles[unique_id] = profile
		print("Profile created for target ID %d" % unique_id)
	return profile

extends Node

var cryptocoins = 200
var xp = 0
var previous_xp = 0
var skills = ["phishing"]
var owned_databases = ["public_db"]

var inventory = []
var player_logs = []

var databases = {}
var compromised_targets = {}
var trace_level = 0
var trace_threshold = 10

# Store unlocked techniques
var unlocked_techniques = ["phishing"]

var misc_commands_instance
var hacking_commands_instance
var recon_commands_instance
var techniques_instance
var vendor_commands_instance  # New: Vendor commands instance

func add_item_to_inventory(item_name: String):
	if item_name not in inventory:
		inventory.append(item_name)
		player_logs.append("Item '%s' added to inventory." % item_name)

func _ready():
	randomize()
	var public_db_instance = PublicDB.new()
	databases["public_db"] = public_db_instance.get_targets()

	misc_commands_instance = load("res://scripts/commands/misc_commands.gd").new()
	hacking_commands_instance = load("res://scripts/commands/hacking_commands.gd").new()
	recon_commands_instance = load("res://scripts/commands/recon_commands.gd").new()
	techniques_instance = load("res://scripts/commands/techniques.gd").new()
	vendor_commands_instance = load("res://scripts/commands/vendor_commands.gd").new()  # Load vendor commands

func handle_command(command_str: String) -> String:
	var parts = command_str.split(" ")
	var cmd = parts[0]

	if cmd == "":
		return ""

	var method_name = "_cmd_" + cmd.replace(".", "_")

	if misc_commands_instance.has_method(method_name):
		return misc_commands_instance.call(method_name, parts)
	elif hacking_commands_instance.has_method(method_name):
		return hacking_commands_instance.call(method_name, parts)
	elif recon_commands_instance.has_method(method_name):
		return recon_commands_instance.call(method_name, parts)
	elif vendor_commands_instance.has_method(method_name):
		return vendor_commands_instance.call(method_name, parts)  # Vendor commands support
	else:
		return "Unknown command. Type 'help' for a list of available commands."

func increment_trace(level: int):
	if "VPN" in inventory:
		level = max(1, level - 1)  # VPN reduces trace increment
	trace_level += level
	if trace_level > trace_threshold:
		_trigger_trace_event()

func _trigger_trace_event():
	var loss = min(50, cryptocoins)
	cryptocoins -= loss
	player_logs.append("Trace Event Triggered! High suspicion levels. Lost %d CryptoCoins." % loss)

func add_xp(amount: int):
	previous_xp = xp
	xp += amount
	techniques_instance.check_for_new_unlocks()

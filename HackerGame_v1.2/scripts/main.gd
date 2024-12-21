extends Control

@onready var terminal_output = $"/root/main_ui/terminal_output"
@onready var terminal_input = $"/root/main_ui/terminal_input"

func _ready() -> void:
	# Start the staged intro sequence
	_call_start_intro()

# --- SEQUENTIAL INTRO LOADING ---
func _call_start_intro() -> void:
	# Call the intro asynchronously
	_start_intro()

func _start_intro() -> void:
	_print_to_terminal("""
================================================================================
""")
	
	# Part 1 - Initial Title Load
	await _typewriter_effect("""
			  ** HACKERGAME v1.0 — INITIALIZING TERMINAL ACCESS **
""", 0.001)  # Faster text speed

	_print_to_terminal("""
================================================================================
""")
	
	await _typewriter_effect("""\n
								 **LOADING**\n""")
	
	# Loading bar instead of "loading..." text
	await _typewriter_effect("""|##############################################################################|""", 0.02) 
	# Part 2 - System Status Check
	await _typewriter_effect("\n
							   [ SYSTEM STATUS ]\n", 0.03)
	await _cycle_system_checks()

	# Part 3 - User Profile Load
	await _typewriter_effect("\n
						   [ LOADING USER PROFILE ]\n", 0.03)
	await _typewriter_effect("> CryptoCoins:       200\n", 0.02)
	await _typewriter_effect("> XP:                0\n", 0.02)
	await _typewriter_effect("> Skills:            Phishing\n", 0.02)
	await _typewriter_effect("> Databases:         public_db\n", 0.02)

	await _pause_effect("\n
					  System Ready. Connection Secure.\n", 0.001)
	_print_to_terminal("""
================================================================================
""")
	await _typewriter_effect("""\n
💡 **GETTING STARTED**
1️⃣ Type **'help'** to see a list of available commands.
2️⃣ Use **'db.view public_db'** to see potential targets you can exploit.
3️⃣ Use **'target.exploit <unique_id> --technique=<technique_name>'** to hack a target.
4️⃣ Use **'next'** and **'back'** to browse through targets if more than 5 are available.
5️⃣ Use **'tutorial'** if you feel unsure and need extra guidance.

The system is live. The network is yours.  
Type **'help'** to begin.
""", 0.001)  # Faster text speed

	# Connect the terminal input after the full intro
	terminal_input.connect("text_submitted", Callable(self, "_on_input_submitted"))

# --- FUNCTION: TYPEWRITER EFFECT ---
func _typewriter_effect(text: String, speed: float = 0.02) -> void:
	# Prints characters one at a time with a delay
	for i in range(text.length()):
		_print_to_terminal(text[i])
		await get_tree().create_timer(speed).timeout

# --- FUNCTION: PAUSE EFFECT (for visual delays) ---
func _pause_effect(text: String, pause_time: float = 1.0) -> void:
	_print_to_terminal(text)
	await get_tree().create_timer(pause_time).timeout

# --- FUNCTION: SYSTEM STATUS CHECK ---
func _cycle_system_checks() -> void:
	var system_checks = [
		"> Integrity Check:   ",
		"> Trace Monitor:     ",
		"> VPN Secure:        ",
		"> Firewalls:         "
	]
	var results = [
		"[ OK ]",
		"[ ONLINE ]",
		"[ NOT ACTIVE ]",
		"[ NOT ACTIVE ]"
	]

	for i in range(system_checks.size()):
		await _typewriter_effect(system_checks[i], 0.03)
		await _pause_effect(results[i] + "\n", 0.4)  # Slight delay



# --- FUNCTION: PRINT TO TERMINAL ---
func _print_to_terminal(text: String) -> void:
	terminal_output.text += text
	var vbar = terminal_output.get_v_scroll_bar()
	if vbar:
		vbar.value = vbar.max_value

# --- FUNCTION: INPUT HANDLER ---
func _on_input_submitted(new_text: String) -> void:
	terminal_input.text = ""
	var input_str = new_text.strip_edges()
	if input_str != "":
		# Check if GameState is available
		if not GameState:
			printerr("ERROR: GameState is NULL. Make sure it's set as an autoload singleton.")
			return
		
		var result = GameState.handle_command(input_str)
		if result != "":
			_print_to_terminal(result + "\n")
	_display_player_event_logs()

# --- FUNCTION: DISPLAY PLAYER LOGS ---
func _display_player_event_logs() -> void:
	if GameState.player_event_logs.size() > 0:
		for event_log in GameState.player_event_logs:
			_print_to_terminal(event_log + "\n")
		GameState.player_event_logs.clear()

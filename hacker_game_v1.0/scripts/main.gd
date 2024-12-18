extends Control

@onready var terminal_output = $/root/main_ui/terminal_output
@onready var terminal_input = $/root/main_ui/terminal_input

func _ready():
	_print_to_terminal("""Welcome to Hackergame.
You are an underground hacker, operating from the shadows to exploit vulnerabilities, crack systems, and accumulate wealth in CryptoCoins.
Your mission is to grow your arsenal of hacking techniques, gain experience (XP), and avoid detection at all costs.

Current Status:
- CryptoCoins: 200
- XP: 0
- Skills: phishing
- Owned Databases: public_db

💡 **Getting Started**
1️⃣ Type 'help' to see a list of available commands.
2️⃣ Use 'db.view public_db' to see potential targets you can exploit.
3️⃣ Use 'target.exploit <target_id> --technique=<technique_name>' to hack a target.
4️⃣ Use 'lost' if you feel unsure and need extra guidance.

Can you master the shadows and become a legendary hacker? The journey starts now.

Type 'help' for commands.
""")
	terminal_input.connect("text_submitted", Callable(self, "_on_input_submitted"))

func _on_input_submitted(new_text: String):
	terminal_input.text = ""
	var input_str = new_text.strip_edges()
	if input_str != "":
		var result = GameState.handle_command(input_str)
		if result != "":
			_print_to_terminal(result + "\n")
	_display_player_logs()

func _print_to_terminal(text: String):
	terminal_output.text += text
	var vbar = terminal_output.get_v_scroll_bar()
	vbar.value = vbar.max_value

func _display_player_logs():
	if GameState.player_logs.size() > 0:
		for log in GameState.player_logs:
			_print_to_terminal(log + "\n")
		GameState.player_logs.clear()

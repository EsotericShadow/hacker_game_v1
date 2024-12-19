extends Node

func _cmd_help(_parts: Array) -> String:
	var help_text = """
Available Commands:
	
how to play:
help - Show this help text
tutorial - More context on what to do
techniques - Information about Hacking Techniques

View:
status - Show your current status
inventory - View your inventory
logs - View your logs


Actions:
db.list - List owned databases
db.view <database_name> - View targets in a database
vendor - Open the White Market for tools
vendor.buy <item_name> - Buy a tool from the White Market
target.exploit <target_id> --technique=<technique_name> - Attempt to hack a target using available technique

"""
	return help_text
	
func _cmd_techniques(_parts: Array) -> String:
	var technique_text = """
Techniques (Unlocked via XP milestones, milestone messages will appear in logs):
phishing - Unlocked at 0 XP *Using social engineering techniques you attempt to gain information about the target from their own mistake of entering the data in your malicious form.
buffer_overflow - Unlocked at 50 XP *using carefully crafted memory allocation exploits you attempt to rewrite the return address of a target application or system leading to full control.
xss_injection - Unlocked at 100 XP *By injecting malicious scripts into a target's web application, you manipulate user-side data, steal session cookies, or deface web pages.
Use: target.exploit <target_id> --technique=<technique_name>
"""
	return technique_text

func _cmd_tutorial(_parts: Array) -> String:
	var tutorial_text = """Feeling lost? Here's how to get started in Hackergame.

1️⃣ **View Your Status**: Type 'status' to see your CryptoCoins, XP, unlocked techniques, and trace level.

2️⃣ **Find Targets**: Use 'db.view public_db' to view potential targets. Each target has a risk, difficulty, and reward.

3️⃣ **Hack a Target**: Type 'target.exploit <target_id> --technique=<technique_name>' to hack a target. For example:
	target.exploit john_doe@oldleaks.com --technique=phishing

4️⃣ **Unlock New Techniques**: Gain XP by hacking targets. When you hit 50 XP, you'll unlock 'buffer_overflow'. At 100 XP, you'll unlock 'xss_injection'.

5️⃣ **Stay Safe**: Watch your trace level! If it gets too high, you'll lose CryptoCoins.

🛠️ **Useful Commands**
- 'help': View all available commands.
- 'status': Check your CryptoCoins, XP, skills, and unlocked techniques.
- 'logs': View your previous hacking activity.
- 'lost': Show this guide again.
- 'db.view public_db': View available targets.
- 'target.exploit <target_id> --technique=<technique_name>': Hack a target.
"""
	return tutorial_text

func _cmd_status(_parts: Array) -> String:
	var unlocked_techniques = GameState.unlocked_techniques
	return "CryptoCoins: %d | XP: %d | Skills: %s\nOwned Databases: %s\nTrace Level: %d\nUnlocked Techniques: %s" % [
		GameState.cryptocoins,
		GameState.xp,
		", ".join(GameState.skills),
		", ".join(GameState.owned_databases),
		GameState.trace_level,
		", ".join(unlocked_techniques)
	]

func _cmd_inventory(_parts: Array) -> String:
	if GameState.inventory.size() == 0:
		return "Your inventory is empty."
	return "Inventory:\n" + "\n".join(GameState.inventory)

func _cmd_logs(_parts: Array) -> String:
	if GameState.player_logs.size() == 0:
		return "No logs available."
	return "Player Logs:\n" + "\n".join(GameState.player_logs)

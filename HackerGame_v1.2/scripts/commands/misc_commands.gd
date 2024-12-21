extends Node

func _cmd_help(_parts: Array) -> String:
	var help_text = """
Available Commands:
	
🛠️ **How to Play:**
help - Show this help text
tutorial - More context on what to do
techniques - Information about Hacking Techniques

📜 **View and Navigation:**
status - Show your current status
inventory - View your inventory
logs - View your logs

🕵️ **Database and Targets:**
db.list - List owned databases
db.view <database_name> - View targets in a database (displays 5 at a time)
next - View the next 5 targets in the database
back - View the previous 5 targets in the database

💥 **Hacking and Exploitation:**
target.exploit <unique_id> --technique=<technique_name> - Attempt to hack a target using available technique

🛒 **Market and Tools:**
vendor - Open the White Market for tools
vendor.buy <item_name> - Buy a tool from the White Market

"""
	return help_text
	
func _cmd_techniques(_parts: Array) -> String:
	var technique_text = """
🎓 **Hacking Techniques:**
phishing - Unlocked at 0 XP 
*Using social engineering techniques, you attempt to gain information about the target from their own mistake of entering data into your malicious form.

buffer_overflow - Unlocked at 50 XP 
*Using carefully crafted memory allocation exploits, you attempt to rewrite the return address of a target application or system, leading to full control.

xss_injection - Unlocked at 100 XP 
*By injecting malicious scripts into a target's web application, you manipulate user-side data, steal session cookies, or deface web pages.

**Usage:** target.exploit <unique_id> --technique=<technique_name>
"""
	return technique_text

func _cmd_tutorial(_parts: Array) -> String:
	var tutorial_text = """📘 **Hackergame Tutorial:**

1️⃣ **View Your Status**: 
Type 'status' to see your CryptoCoins, XP, unlocked techniques, and trace level.

2️⃣ **Find Targets**: 
Use 'db.view public_db' to view potential targets. Each target has a risk, difficulty, and reward.

3️⃣ **Navigate Targets**: 
If there are more than 5 targets, use 'next' to view the next 5 and 'back' to view the previous 5.

4️⃣ **Hack a Target**: 
Type 'target.exploit <unique_id> --technique=<technique_name>' to hack a target. 
**Example:** target.exploit 1001 --technique=phishing

5️⃣ **Unlock New Techniques**: 
Gain XP by hacking targets. At 50 XP, you'll unlock 'buffer_overflow'. At 100 XP, you'll unlock 'xss_injection'.

6️⃣ **Stay Safe**: 
Watch your trace level! If it gets too high, you'll lose CryptoCoins.

🛠️ **Useful Commands:**
- 'help': View all available commands.
- 'status': Check your CryptoCoins, XP, skills, and unlocked techniques.
- 'logs': View your previous hacking activity.
- 'db.view public_db': View available targets.
- 'next': View the next 5 targets.
- 'back': View the previous 5 targets.
- 'target.exploit <unique_id> --technique=<technique_name>': Hack a target.
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
	if GameState.player_event_logs.size() == 0:
		return "No logs available."
	return "Player Logs:\n" + "\n".join(GameState.player_event_logs)

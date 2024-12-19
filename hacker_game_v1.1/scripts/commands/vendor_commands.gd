extends Node

# Available tools for purchase (normalized lowercase keys)
var tools = {
	"vpn": {
		"price": 100,
		"description": "Reduces trace level each round."
	},
	"antivirus": {
		"price": 150,
		"description": "Reduces risk of spyware infection."
	}
}

# Command: vendor (displays the marketplace)
func _cmd_vendor(_parts: Array) -> String:
	var output = "Welcome to the White Market!\nAvailable Tools:\n"
	var i = 1
	for tool_name in tools.keys():
		var tool = tools[tool_name]
		output += "%d. %s - %d CC (%s)\n" % [i, tool_name.capitalize(), tool.price, tool.description]  # Capitalize the tool name for display only
		i += 1
	output += "Type 'vendor.buy <item_name>' to purchase an item."
	return output

# Command: vendor.buy <item_name> (buys an item)
func _cmd_vendor_buy(parts: Array) -> String:
	if parts.size() < 2:
		return "Usage: vendor.buy <item_name>"

	# Normalize the player's input to lowercase to match the keys in the tools list
	var item_name = parts[1].to_lower()
	if not tools.has(item_name):
		return "Item '%s' not found in the White Market." % parts[1]  # Return original input for user clarity

	var item = tools[item_name]
	var price = item.price

	if GameState.cryptocoins < price:
		return "Insufficient CryptoCoins. You need %d CC to buy %s." % [price, parts[1]]

	GameState.cryptocoins -= price
	GameState.inventory.append(item_name.capitalize())  # Store the original capitalized name
	GameState.player_logs.append("\n")
	return "Purchase successful! %s added to your inventory." % item_name.capitalize()

# HackerGame v1

Hackergame is an interactive, command-line hacking simulation game where players take on the role of a hacker. Players gain experience (XP), unlock new hacking techniques, and exploit various targets to accumulate in-game cryptocurrency known as CryptoCoins. The game features an immersive command-line interface (CLI) that gives players the feel of working inside a real hacker terminal.

---

## **Features**
- **Command-line Interface**: Interact with the game using text commands, mimicking a real hacker's terminal environment.
- **XP-Based Unlock System**: Gain XP and unlock powerful new hacking techniques like `buffer_overflow` and `xss_injection`.
- **Dynamic Risk System**: Each target has a unique risk level, difficulty, and potential reward.
- **Trace and Security**: Be careful—each failed hack increases your trace level. If your trace level reaches the threshold, you'll lose CryptoCoins.
- **Vendor System**: Access the White Market to buy hacking tools like VPNs, Antivirus, and more.
- **Passive Tool Effects**: Tools like VPNs passively reduce trace, while Antivirus reduces the chance of spyware infections.
- **Player Inventory**: Purchased tools are stored in your inventory, which you can view at any time.
- **Open Source**: This project is 100% open source, and we welcome contributors from all backgrounds.

---

## **How to Play**
1. **Start the game**: Run the game and you will be greeted with a welcome message.
2. **View available commands**: Type `help` to see a list of commands you can use.
3. **List available targets**: Use `db.view public_db` to see all available targets.
4. **Exploit targets**: Use the command `target.exploit <target_id> --technique=<technique_name>` to hack a target.
5. **Check your progress**: Use `status` to view your CryptoCoins, XP, trace level, and unlocked techniques.
6. **Visit the Vendor**: Use the `vendor` command to access the White Market and purchase new tools.
7. **Unlock new techniques**: Earn XP by successfully hacking targets and unlock new techniques at specific milestones.

**Example Commands:**
```
help
status
db.view public_db
target.exploit john_doe@oldleaks.com --technique=phishing
vendor
vendor.buy VPN
```

---

## **Commands**
- `help`: Display the list of available commands.
- `status`: View your CryptoCoins, XP, skills, owned databases, trace level, and unlocked techniques.
- `db.list`: List all available databases.
- `db.view <database_name>`: View available targets in a specific database.
- `target.exploit <target_id> --technique=<technique_name>`: Attempt to exploit a target using a specific hacking technique.
- `vendor`: Open the White Market to view and purchase tools.
- `vendor.buy <item_name>`: Purchase a specific tool from the White Market.
- `inventory`: View the player's inventory of purchased tools and items.
- `logs`: View your recent hacking logs.

---

## **Unlockable Techniques**
- **phishing**: Unlocked by default.
- **buffer_overflow**: Unlocked at 50 XP.
- **xss_injection**: Unlocked at 100 XP.

Gain XP by hacking targets and unlocking new techniques to hack more challenging and rewarding targets.

---

## **Vendor System**
The Vendor system allows players to purchase powerful hacking tools and utilities. Use the `vendor` command to browse available items and `vendor.buy <item_name>` to purchase them.

**Available Tools:**
- **VPN**: 100 CC - Reduces trace level increment each round.
- **Antivirus**: 150 CC - Reduces the risk of spyware infection.

More tools will be added in future updates, giving players more control over their hacking environment.

---

## **Contributing**
Hackergame is open source, and contributions are welcome from everyone! Whether you are a beginner or an experienced developer, we encourage you to participate.

**How to contribute:**
1. Fork the repository.
2. Make changes or add features.
3. Submit a pull request (PR) with a clear description of the changes you made.

**What you can contribute:**
- New hacking techniques.
- Improvements to the terminal commands.
- Bug fixes and optimizations.
- New gameplay features (like more databases, targets, and hacking tools).

---

## **Installation**
1. **Clone the repository**:
   ```bash
   git clone [https://github.com/EsotericShadow/hacker_game_v1]
   cd hacker_game_v1
   ```

2. **Run the game**:
   - Open the project in Godot and press the **Play** button to start the game.

---

## **Project Structure**
```
├── res/
│   ├── databases/
│   ├── scripts/
│       ├── main.gd
│       ├── game_state.gd
│       ├── commands/
│           ├── techniques.gd
│           ├── hacking_commands.gd
│           ├── recon_commands.gd
│           ├── vendor_commands.gd
│           ├── misc_commands.gd
│   └── main_ui/ (ControlNode)
│       ├── terminal_output (TextEdit node)
│       └── terminal_input (LineEdit node)
└── README.md
```
- **databases**: Contains in-game target databases.
- **scripts**: Core game logic, including commands, GameState, and Techniques.
- **main_ui**: The CLI terminal UI.

---

## **Contributors**
- **Project Creator**: Shadow Fox
- **Contributors**: Rook God Forks

If you'd like to become a contributor, just submit a pull request or reach out on GitHub.

---

## **Contact**
Have a question or suggestion? Open an issue on GitHub or contact me directly.

Happy hacking!


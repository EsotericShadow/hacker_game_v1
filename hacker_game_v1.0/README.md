# Hackergame

Hackergame is an interactive, command-line hacking simulation game where players take on the role of a hacker. Players gain experience (XP), unlock new hacking techniques, and exploit various targets to accumulate in-game cryptocurrency known as CryptoCoins. The game features an immersive command-line interface (CLI) that gives players the feel of working inside a real hacker terminal.

## **Features**
- **Command-line Interface**: Interact with the game using text commands.
- **XP-Based Unlock System**: Gain XP and unlock powerful new hacking techniques like `buffer_overflow` and `xss_injection`.
- **Dynamic Risk System**: Each target has a unique risk level, difficulty, and potential reward.
- **Trace and Security**: Be careful—each failed hack increases your trace level. Get traced too much, and you lose CryptoCoins.
- **Open Source**: This project is 100% open source, and we welcome contributors from all backgrounds.

---

## **How to Play**
1. **Start the game**: Run the game and you will be greeted with the welcome message.
2. **View available commands**: Type `help` to see a list of commands you can use.
3. **List available targets**: Use `db.view public_db` to see all available targets.
4. **Exploit targets**: Use the command `target.exploit <target_id> --technique=<technique_name>` to hack a target.
5. **Check your progress**: Use `status` to view your CryptoCoins, XP, trace level, and unlocked techniques.
6. **Unlock new techniques**: Earn XP by successfully hacking targets and unlock new techniques at specific milestones.

Example Commands:
```
help
status
db.view public_db
target.exploit john_doe@oldleaks.com --technique=phishing
```

---

## **Commands**
- `help`: Display the list of available commands.
- `status`: View your CryptoCoins, XP, skills, owned databases, trace level, and unlocked techniques.
- `db.list`: List all available databases.
- `db.view <database_name>`: View available targets in a specific database.
- `target.exploit <target_id> --technique=<technique_name>`: Attempt to exploit a target using a specific hacking technique.
- `logs`: View your recent hacking logs.

---

## **Unlockable Techniques**
- **phishing**: Unlocked by default.
- **buffer_overflow**: Unlocked at 50 XP.
- **xss_injection**: Unlocked at 100 XP.

Gain XP by hacking targets and unlocking new techniques to hack more challenging and rewarding targets.

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
- New gameplay features (like more databases or targets).

---

## **Installation**
1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/hackergame.git
   cd hackergame
   ```

2. **Run the game**:
   - Open the project in Godot and press the **Play** button to start the game.

---

## **Project Structure**
```
├── res/
│   ├── databases/
│   ├── scripts/
│       ├── commands/
│       ├── main.gd
│       ├── GameState.gd
│       ├── Techniques.gd
│   └── main_ui/
│       ├── terminal_output (TextEdit node)
│       └── terminal_input (LineEdit node)
└── README.md
```
- **databases**: Contains in-game target databases.
- **scripts**: Core game logic, including commands, GameState, and Techniques.
- **main_ui**: The CLI terminal UI.

---

## **License**
This project is licensed under the **MIT License**, meaning it is 100% open source and free to use, modify, and distribute with no restrictions. See the [LICENSE](LICENSE) file for more details.

---

## **Contributors**
- **Project Creator**: [Your Name]
- **Contributors**: See the list of contributors on GitHub.

If you'd like to become a contributor, just submit a pull request or reach out on GitHub.

---

## **Contact**
Have a question or suggestion? Open an issue on GitHub or contact us directly.

Happy hacking!

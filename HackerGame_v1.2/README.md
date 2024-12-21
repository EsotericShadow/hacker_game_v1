# HackerGame v1.2

![HackerGame Banner](path/to/screenshot_banner.png)

**HackerGame** is an immersive, interactive command-line hacking simulation game where players assume the role of a skilled hacker. Engage in realistic terminal interactions, execute hacking techniques, and navigate through dynamically generated targets to accumulate in-game cryptocurrency known as **CryptoCoins**. With procedural generation, ASCII art/text animations, enhanced color schemes, and a robust autocomplete feature, HackerGame offers a compelling and authentic hacker experience.

---

## 📋 Table of Contents

- [Features](#features)
- [How to Play](#how-to-play)
- [Example Commands](#example-commands)
- [Commands](#commands)
- [Unlockable Techniques](#unlockable-techniques)
- [Vendor System](#vendor-system)
- [Autocomplete System](#autocomplete-system)
- [Procedural Generation](#procedural-generation)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [Credits & Plugins](#credits--plugins)
- [Contact](#contact)

---

## 🎮 Features

- **Command-line Interface (CLI):**
  - Interact with the game using text commands, mimicking a real hacker's terminal environment.
  
- **Autocomplete System:**
  - Dynamic autocompletion powered by the Auto Complete Menu Node plugin by Lenrow.
  - Provides suggestions for commands, target IDs, and techniques as you type.
  
- **XP-Based Unlock System:**
  - Gain experience (XP) through successful hacks.
  - Unlock powerful new hacking techniques like `buffer_overflow` and `xss_injection` as you progress.
  
- **Dynamic Risk System:**
  - Each target has a unique risk level, difficulty, and potential reward.
  - Procedurally generated targets ensure a fresh experience every playthrough.
  
- **Trace and Security:**
  - Every failed hack increases your trace level.
  - Maintain a low trace level to avoid detection; exceeding the threshold results in CryptoCoins loss.
  
- **Vendor System:**
  - Access the White Market to purchase essential hacking tools like VPNs and Antivirus.
  - Future updates will introduce more tools for enhanced gameplay.
  
- **Passive Tool Effects:**
  - Tools like VPNs passively reduce trace increments.
  - Antivirus tools decrease the chance of spyware infections.
  
- **Player Inventory:**
  - View and manage purchased tools in your inventory at any time.
  
- **Procedural Generation:**
  - Targets are procedurally generated with unique profiles, ensuring variability and replayability.
  
- **ASCII Art/Text Animations:**
  - Engaging ASCII art and text animations enhance the terminal experience.
  
- **Color Updates:**
  - Enhanced color schemes provide a visually appealing and realistic terminal interface.
  
- **Open Source:**
  - 100% open source project welcoming contributions from developers of all backgrounds.

---

## 🕹️ How to Play

1. **Start the Game:**
   - Open the project in Godot and press the **Play** button to launch the game.
   
2. **View Available Commands:**
   - Type `help` to see a list of commands you can use.
   
3. **List Available Targets:**
   - Use `db.view public_db` to see all available targets.
   
4. **Exploit Targets:**
   - Execute hacks using the command:
	 ```
	 target.exploit <target_id> --technique=<technique_name>
	 ```
	 - Replace `<target_id>` with the unique identifier of the target.
	 - Replace `<technique_name>` with the desired hacking technique.
   
5. **Check Your Progress:**
   - Use `status` to view your CryptoCoins, XP, trace level, and unlocked techniques.
   
6. **Visit the Vendor:**
   - Use the `vendor` command to access the White Market and purchase new tools.
   
7. **Unlock New Techniques:**
   - Earn XP by successfully hacking targets to unlock new techniques at specific milestones.

---

## 📝 Example Commands

```
help
status
db.view public_db
target.exploit john_doe@oldleaks.com --technique=phishing
vendor
vendor.buy VPN
inventory
logs
```

---

## 🔑 Commands

### **help**
Display the list of available commands.

### **status**
View your CryptoCoins, XP, skills, owned databases, trace level, and unlocked techniques.

### **db.list**
List all available databases.

### **db.view <database_name>**
View available targets in a specific database.

### **target.exploit <target_id> --technique=<technique_name>**
Attempt to exploit a target using a specific hacking technique.

### **vendor**
Open the White Market to view and purchase tools.

### **vendor.buy <item_name>**
Purchase a specific tool from the White Market.

### **inventory**
View the player's inventory of purchased tools and items.

### **logs**
View your recent hacking logs.

---

## 🛠️ Unlockable Techniques

- **phishing**: Unlocked by default.
- **buffer_overflow**: Unlocked at 50 XP.
- **xss_injection**: Unlocked at 100 XP.

Gain XP by hacking targets and unlocking new techniques to hack more challenging and rewarding targets.

---

## 🛒 Vendor System

The Vendor system allows players to purchase powerful hacking tools and utilities. Use the `vendor` command to browse available items and `vendor.buy <item_name>` to purchase them.

### **Available Tools:**

- **VPN**: 100 CC
  - **Effect**: Reduces trace level increment each round.
  
- **Antivirus**: 150 CC
  - **Effect**: Reduces the risk of spyware infection.
  
- **[Future Tool Name]**: [Price] CC
  - **Effect**: [Description]

*More tools will be added in future updates, giving players more control over their hacking environment.*

---

## 🔍 Autocomplete System

HackerGame utilizes the **Auto Complete Menu Node** plugin by **Lenrow** for autocomplete functionality.

### **How It Works:**

- As you type commands, the autocomplete system suggests matching commands, target IDs, and techniques.
- The autocomplete system uses a `terms.json` file to populate the list of possible commands, targets, and other suggestions.
- All commands, targets, and techniques are included in this file to ensure a smooth user experience.

---

## 🔄 Procedural Generation

HackerGame features procedural generation to ensure a unique and varied experience each time you play.

### **Key Points:**

- **Dynamic Targets**: Each target is procedurally generated with unique profiles, including email, risk level, difficulty, loot, and security measures.
- **Scalability**: New targets are generated as you progress, maintaining a fresh pool of challenges.
- **Replayability**: The variability in target profiles ensures that each playthrough offers new challenges and rewards.

---

## 📥 Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/EsotericShadow/hacker_game_v1.2.git
   cd hacker_game_v1.2
   ```

2. **Open the Project in Godot:**
   - Launch Godot.
   - Click on **Import** and navigate to the cloned repository folder.
   - Open the project and wait for it to load.

3. **Run the Game:**
   - Press the **Play** button in Godot to start the game.

---

## 📁 Project Structure

```
├── res/
│   ├── databases/
│   │   └── public_db.gd
│   ├── scripts/
│   │   ├── main.gd
│   │   ├── game_state.gd
│   │   ├── commands/
│   │       ├── techniques.gd
│   │       ├── hacking_commands.gd
│   │       ├── recon_commands.gd
│   │       ├── vendor_commands.gd
│   │       ├── misc_commands.gd
│   ├── fonts/
│   │   └── JetBrainsMono.ttf
│   ├── main_ui/ (Control Node)
│   │   ├── terminal_output (TextEdit node)
│   │   ├── terminal_input (LineEdit node)
│   │   ├── skip_label (Label node)
│   │   └── Auto Complete Assistant (Custom node)
├── addons/
│   └── auto_complete_menu_node/
│       ├── Scripts/
│       ├── Assets/
│       ├── complete_plugin.gd
│       └── terms.json
├── assets/
│   └── ascii_art/
│       └── [ASCII Art Files]
├── README.md
└── LICENSE
```

### **Directory Breakdown:**

- **databases/**: Contains in-game target databases.
- **scripts/**: Core game logic, including commands, GameState, and Techniques.
- **commands/**: All custom commands, like `vendor`, `target.exploit`, and `help`.
- **fonts/**: Contains the JetBrains Mono font file used in the terminal.
- **main_ui/**: The CLI terminal UI components.
- **addons/auto_complete_menu_node/**: Contains the autocomplete logic and JSON file for term autocompletion.
- **assets/ascii_art/**: Stores ASCII art files used in the game.
- **LICENSE**: Open-source license file.

---

## 🤝 Contributing

HackerGame is open source, and contributions are welcome from everyone! Whether you are a beginner or an experienced developer, we encourage you to participate.

### **How to Contribute:**

1. **Fork the Repository:**
   - Click the **Fork** button at the top-right corner of the repository page.

2. **Clone Your Fork:**
   ```bash
   git clone https://github.com/YourUsername/hacker_game_v1.2.git
   cd hacker_game_v1.2
   ```

3. **Create a New Branch:**
   ```bash
   git checkout -b feature/YourFeatureName
   ```

4. **Make Your Changes:**
   - Implement your feature, bug fix, or improvement.

5. **Commit Your Changes:**
   ```bash
   git commit -m "Add [Your Feature/Improvement]"
   ```

6. **Push to Your Fork:**
   ```bash
   git push origin feature/YourFeatureName
   ```

7. **Create a Pull Request:**
   - Navigate to the original repository.
   - Click on **Compare & pull request**.
   - Provide a clear description of your changes and submit the pull request.

### **What You Can Contribute:**

- New hacking techniques.
- Improvements to the terminal commands.
- Bug fixes and optimizations.
- New gameplay features (like more databases, targets, and hacking tools).
- Enhanced procedural generation algorithms.
- Additional ASCII art for terminal animations.
- UI/UX enhancements.

---

## 👏 Credits & Plugins

### **Credits**

- **Project Creator:** Shadow Fox
- **Contributors:** Rook God Forks, Lenrow (for the autocomplete plugin)
- **Special Thanks:** To the open-source community for invaluable resources and support.

### **Plugins Used**

- **Auto Complete Menu Node Plugin**
  - **Author:** Lenrow
  - **Repository:** [https://github.com/lenrow/auto-complete-menu-node](https://github.com/lenrow/auto-complete-menu-node)
  - **Description:** This plugin provides smooth autocompletion functionality for the terminal commands in HackerGame.

---

## 📬 Contact

Have a question or suggestion? Open an issue on [GitHub](https://github.com/EsotericShadow/hacker_game_v1.2/issues) or contact me directly at [your.email@example.com](mailto:your.email@example.com).

Happy hacking! 🎉

---

## 📸 Screenshots

![Main Terminal Interface](path/to/screenshot_main_terminal.png)

*Description: The main terminal interface displaying system status and available commands.*

![Vendor Market](path/to/screenshot_vendor_market.png)

*Description: Accessing the White Market to purchase hacking tools.*

![Hacking a Target](path/to/screenshot_hacking_target.png)

*Description: Executing a hack on a selected target using a specific technique.*

*Replace the placeholder paths (`path/to/screenshot_*.png`) with the actual paths to your screenshot images.*

---

---

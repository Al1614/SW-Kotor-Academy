# KOTOR Academy

Play **Star Wars: Knights of the Old Republic** and **Knights of the Old Republic II** with the real-time movement and lightsaber combat of **Jedi Knight: Jedi Academy**.

The stories, party, equipment, levels, feats and Force powers are KOTOR's. The fighting is yours: you swing, block, dodge and cast in real time, and your character sheet decides how much each hit counts.

KOTOR Academy is an unofficial, free, non-commercial fan project. It contains no files from any game. It reads the games you already own.

> **Status: early release.** Both campaigns can be played from start to finish, but not every scene and side quest has been played through by hand. Expect rough edges, and see [Known issues](#known-issues).

## What you need

You need three things on your PC before KOTOR Academy will start:

1. **KOTOR II.** It is always needed, even if you only want to play KOTOR I, because KOTOR Academy draws its menus with KOTOR II's files.
2. **Star Wars Jedi Knight: Jedi Academy.**
3. **Movie Duels**, a free mod for Jedi Academy.

**KOTOR I** is only needed if you want to play KOTOR I. With KOTOR II alone you can play KOTOR II.

Any PC copy of the games should work. Steam copies are the ones that have been tested.

Your PC needs Windows 10 or 11 and a graphics card from roughly the last eight years.

## How to install

### Step 1: Install the games

Install KOTOR II and Jedi Academy (and KOTOR I, if you want to play it) the normal way (for example from Steam). Start each one once to make sure it runs, then close it.

### Step 2: Install Movie Duels

1. Go to the [Movie Duels downloads page](https://www.moddb.com/mods/movie-duels/downloads).
2. Download **Movie Duels - Update 6 + Patch AIO (Automatic Installation)**. Use this exact version; newer ones (Update 7 and 8) have not been tested and may not work.
3. Run the file you downloaded and follow its steps. When it asks where to install, choose your Jedi Academy folder.

### Step 3: Download KOTOR Academy

1. Open the **[KOTOR Academy Releases page](../../releases)**.
2. Find the newest release at the top. Under **Assets**, click `KOTOR-Academy-alpha-windows.zip`. (If you only see the word Assets, click it to open the list.)

Do not use the green "Code" button at the top of this page. That downloads the wrong thing.

### Step 4: Unpack it

1. Find the file you just downloaded (usually in your Downloads folder). It is called `KOTOR-Academy-alpha-windows.zip`.
2. Right-click it and choose **Extract All**, then click **Extract**.
3. You now have a folder called **KOTOR Academy**. You can move it anywhere you like, for example your Desktop. Do not put it inside a game's folder.

### Step 5: Play

1. Open the **KOTOR Academy** folder.
2. Double-click **Play KOTOR Academy**.
3. If Windows shows a blue box saying "Windows protected your PC", click **More info**, then **Run anyway**. This appears because the program is new and unsigned.
4. The first time, it asks if you want a shortcut on your desktop. Click **Yes** if you do. It also copies a few Jedi Academy files into its own folder (about 1 GB); this happens once.
5. If you own both KOTOR games, a window asks which one to play. Click **KOTOR** or **KOTOR II**.
6. The very first time, a setup page lists the games it found. Click **Import and play**. If you do not own KOTOR I, it says so and lets you go on with KOTOR II.

That is it. Next time, just use the desktop shortcut.

KOTOR Academy finds your games by itself. If it cannot find one, it tells you which, and lets you pick that game's folder. It never changes anything in your game folders.

## Optional: add mods for better looks

You do not need any of these. The game plays fine without them. They only change how KOTOR I looks.

Every mod is added the same way:

1. Open your **KOTOR Academy** folder.
2. Open the `mods` folder inside it. It is already there, empty and ready.
3. Download the mod from its creator's page.
4. Unpack the download (right-click, **Extract All**).
5. Copy the mod's files into the `mods` folder. Textures inside folders are found too, so a texture pack can be copied in as the folder it unpacked to. Other kinds of files (such as `.2da`, `.uti` or `.mdl`) must sit directly in `mods`.

**Mods already in your KOTOR folder count too.** KOTOR Academy also reads the `Override` folder inside your KOTOR I and KOTOR II installs, the way the original games do, so mods you installed there are used as well. For KOTOR II, folders inside `Override` are read too. The `mods` folder is for KOTOR I only; KOTOR II mods go in KOTOR II's own `Override`. If the same file is in both places, the one in `mods` wins.

**Texture packs without `.txi` files work.** A replacement texture that comes without its small `.txi` settings file uses the original texture's settings, so shiny armour stays shiny. If a pack does include `.txi` files, copy them too: they are used.

Do this **before** you start a new game. Changing your mods later can stop your saved games from loading.

### Hooded Jedi robes in the KOTOR II style

Mod: [JC's Fashion Line I: Cloaked Jedi Robes for K1](https://deadlystream.com/files/file/1378-jcs-fashion-line-i-cloaked-jedi-robes-for-k1/) by JCarter426.

1. Download and unpack it.
2. Do **not** run its installer. Open the unpacked folder, then open `tslpatchdata`.
3. Open one of these folders, depending on the colours you want:
   - `k_bbb` for all-brown robes
   - `k_brb` for brown, red and blue robes
   - `k_brb-a` for the alternative brown, red and blue robes
4. Copy every file in that folder into your `mods` folder, **except** `appearance.2da` and the files ending in `.ini` and `.rtf`.

Jedi robes in KOTOR I now have the hood and cloak.

### Sharper textures and better weapon models

These are the mods used in the project's videos. Copy their files into `mods` the same way.

- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730?tab=files): sharper worlds.
- [Weapon Model Overhaul](https://www.nexusmods.com/kotor/mods/1096) with its [Texture Rework](https://www.nexusmods.com/kotor/mods/8): better weapons and lightsaber hilts.
- [Revan Items](https://deadlystream.com/files/file/85-revan-items/): Revan's robes and lightsabers.

### The combat practice arena

The arena is a room where you can fight practice battles without touching your story.

**How to open it:** in the game, walk up to a computer panel named **Combat Practice** and use it. You will find one:

- **KOTOR I:** on the Ebon Hawk beside the workbench, and at the Jedi Council on Dantooine.
- **KOTOR II:** beside the workbench in the medical bay where the game begins on Peragus, and on the Ebon Hawk beside the workbench.

**KOTOR II:** the arena works straight away. Nothing extra to install.

**KOTOR I:** the arena needs one more mod, **[Duel Room Final 1.0](https://deadlystream.com/files/file/559-duel-room-final/)** by Aneeryrlue and ARK07:

1. Download the mod from the link above and unpack it (right-click, **Extract All**).
2. Open your **KOTOR Academy** folder and make a new folder inside it named `arena`.
3. Copy everything from the unpacked mod into the `arena` folder.

The story does not need this mod. Without it, KOTOR I plays normally and only the arena is missing.

## Removing KOTOR Academy

Delete the **KOTOR Academy** folder and the desktop shortcut. Your games are untouched.

## Help

- **"KOTOR Academy cannot start yet"**: the message underneath says what is missing. Install that, then try again.
- **It cannot find a game**: when it asks, click **Yes** and pick the folder where that game is installed.
- **The story movies do not play**: they need a free program called [FFmpeg](https://ffmpeg.org/download.html) installed on your PC. Without it the movies are skipped and the game carries on.
- **The second locked door on the Endar Spire will not open**: Trask opens it. Click Trask's portrait to switch to him, look at the door, change the action from Open to **Security** (mouse wheel, or D-pad right on a controller), then use it. Switch back to your own character afterwards.
- **The door after that one stays locked, and the room before it was empty**: this was a bug in earlier downloads, when the Security door opened while Trask was still talking. Download the newest release, then load a save from before that door or start a new game. A save made after it happened stays stuck.
- **A mod's texture looks wrong**: check the same file is not also in your KOTOR `Override` folder or in `mods` from another pack. The one in `mods` is used first, then `Override`, then the game's own.
- **The game closes as soon as it starts**: start it again. The launcher tries DirectX 12 first and then lets your graphics card choose, and switches back by itself if the mode it remembered stops working. Your graphics card needs DirectX 12 or Vulkan; if it still closes, update the graphics driver. To make the launcher forget its remembered choice by hand, open `paths.txt` in your KOTOR Academy folder and delete the line `GRAPHICS=auto`.
- **My energy shield does nothing**: a shield works only while it is worn. Press **I**, open the Equipment tab and put it on an arm, then press the shield key.
- **Stuck in the Ebon Hawk's crew quarters with only "CutStart" to point at** (KOTOR I): this was a bug in earlier downloads for a woman who began as a Jedi Guardian or Sentinel. Download the newest release and load a save from before you boarded the ship. In a save made inside the quarters, point at "CutStart" and use it to start the vision.
- **Where are my saves?** Press the Windows key, type `%APPDATA%\kjk` and press Enter. Delete that folder only if you want to wipe your saves and settings.
- **Setting a game folder by hand**: copy `paths.example.txt`, name the copy `paths.txt`, and type the game's folder into it.

## Controls

Keyboard and mouse defaults. Everything can be changed in **Options**. Controllers are supported.

| Key | Action |
|---|---|
| W A S D / mouse | Move / look |
| Space / C / Shift | Jump / crouch (roll while running) / walk |
| Left mouse / right mouse | Attack / the weapon's other attack (saber throw, kick, blaster special) |
| Left Alt | Guard |
| E | Use, talk, open. Hold over a fallen companion to revive them |
| Tab | Switch to the next party member |
| F / [ and ] | Use the selected Force power / select the previous or next one |
| G / R / Q | Force Grip / Lightning / Drain |
| X / 6 | Force power wheel / item wheel |
| T | Throw a grenade (hold to throw farther) |
| 3 / 4 / 5 | Medpac / stimulant / energy shield |
| H / B | Ready or put away your weapon / swap weapon sets |
| L / F2 and F3 | Saber style / previous and next saber stance |
| Z | Lock on to a target |
| Caps Lock / O / U | Stealth / lay a mine / Security |
| I / J / M / P / K | Inventory / journal / map / party / abilities |
| F1 | First or third person |
| F5 / F9 | Quick save / quick load |

To equip weapons, press **I**, open the Equipment tab, pick a hand and choose a weapon. Two single sabers or two pistols go in the right and left hand. A double-bladed saber goes in the right hand and uses both.

## How combat is different

The short version:

- **Your aim, then the dice.** A swing or shot has to touch the target. Each one that does makes the original game's attack roll against Defense: a hit deals full damage, a miss deals nothing.
- **Enemies play by the same roll.** High Defense makes their attacks miss.
- **Two combat modes.** KOTOR Academy Combat (the default) is described here. Fast Combat, the first alpha's combat with no misses, can be chosen in Options → Gameplay, from the main menu or the pause menu.
- **You block yourself.** Hold Guard to raise your blade; time an attack press for a perfect parry; deflect blaster bolts with a lightsaber.
- **Force powers are real time**, cost what they always did, and keep the original effects.

The full explanation, with the numbers, is in [How combat works](docs/COMBAT.md). Every rule the game plays by is in the [rulebook](docs/RULEBOOK.md). Console cheats for single-player are in the [cheat sheet](docs/CHEATS.md).

## What is new in this update

- **KOTOR II's galaxy map opens.** You can leave Peragus for Telos and travel between planets from the map.
- **KOTOR Academy Combat.** Attacks that land now make the original game's attack roll: a hit deals full damage, a miss deals nothing, and a miss against a blade shows as a block. The first alpha's combat is still there as **Fast Combat** in Options → Gameplay, from the main menu or the pause menu.
- **Difficulty works as in the original games**: Padawan, Knight and Master change the damage your party takes.
- **Item wheel pins.** In the inventory (**I**), select an item and choose **Pin to wheel**. Hold **6**, point at a slice and release to use it. Up to ten pins; grenades can be pinned and thrown from the wheel.
- **Auto Level Up**, for your character and, as an option, for companions.
- **Mods load more like the original games**: the `Override` folder wins over a level's own files, KOTOR II reads folders inside `Override`, texture packs can sit in folders inside `mods`, and textures without `.txi` files keep their shine.
- **KOTOR II with The Sith Lords Restored Content Mod** has been played from start to credits in automated testing, with fixes for the rebuilt Enclave's exit and Visas Marr's fight aboard the Ebon Hawk.
- **The launcher recovers** when a remembered graphics mode stops starting.
- **KOTOR I: the vision in the Ebon Hawk's crew quarters now starts** for a woman who began as a Jedi Guardian or Sentinel. Before, she stood in the quarters with only "CutStart" to point at and could not go on.
- **An energy shield you are wearing keeps its key and its place in the item list** when you carry four or more other kinds of medpacs, stimulants and grenades.
- Menu and control fixes, including switching party member from the pause menu.

## Known issues

- Not every side quest and planet order has been played through by hand.
- Movie Duels Update 7 and 8 are untested.
- Only the Steam versions of the games have been tested. Other copies should work; tell us if one does not.
- An update can make a save from an older version refuse to load.
- Adding, removing or changing files in the `mods` folder or in a game's `Override` folder can make existing saves refuse to load. Decide on your mods before you start a playthrough.
- This update reads `Override` differently, so a save made with mods in `Override` on an older version may refuse to load.
- Your graphics card needs DirectX 12 or Vulkan. Older cards with neither cannot start the game.

## Credits

KOTOR Academy stands on more than twenty years of community work. Thank you to everyone below.

**Engine**

- [KJK](https://github.com/kjk-engine/kjk), the KOTOR and Jedi Academy engine this project is built on, by the kjk contributors (MIT licence). KOTOR Academy is a modified build of it.
- [OpenJK](https://github.com/JACoders/OpenJK), the open-source Jedi Academy engine, by JACoders and contributors.

**Movie Duels**

- [Movie Duels](https://www.moddb.com/mods/movie-duels/downloads) by the Movie Duels Team, building on Wector's Movie Duels 2.
- Movie Duels asset credits: Darth Maul by DT85, edited by Jedinoob124. Anakin Skywalker by MIKCZ, with HapSlash and Toshi. Lightsaber Hilt Collection by Plasma. Additional hilts by Doughnuts, SimonKTemplar, Rooxon and Arany Gergő. [Full asset-by-asset credits](https://www.nexusmods.com/starwarsjediknightjediacademy/mods/45).

**KOTOR mods used in the project's videos and testing**

- [Revan Items](https://deadlystream.com/files/file/85-revan-items/) by ChAiNz.2da: Revan's robes and lightsabers.
- [JC's Fashion Line I: Cloaked Jedi Robes for K1](https://deadlystream.com/files/file/1378-jcs-fashion-line-i-cloaked-jedi-robes-for-k1/) by JCarter426: the hooded Jedi robes.
- [Effixian's Jedi Knight Revan Robes](https://deadlystream.com/files/file/2135-effixians-jedi-knight-revan-robes-swgoh/) by Effixian: the Jedi Revan outfit.
- [Weapon Model Overhaul](https://www.nexusmods.com/kotor/mods/1096) by Toasty Fresh.
- [Weapon Model Overhaul Texture Rework](https://www.nexusmods.com/kotor/mods/8) by Fallen Guardian.
- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730?tab=files) by Vurt.
- [TSLRCM](https://deadlystream.com/files/file/578-tsl-restored-content-mod/) by Zbyl2, DarthStoney, Hassat Hunter, VarsityPuppet and contributors: the restored content mod for KOTOR II.
- [Duel Room Final 1.0](https://deadlystream.com/files/file/559-duel-room-final/) by Aneeryrlue and ARK07, built on Talchia's KOTOR Arena, with robes by InSidious and Rece and scripting help from Fair Strides: the room setup read by KOTOR I's optional combat arena.

**Inspiration**

- [SkyCraft](https://github.com/chasmlol/SkyCraft) by chasmlol, for the idea of running two game engines together.

**The original games**

- Star Wars: Knights of the Old Republic by BioWare and LucasArts.
- Star Wars: Knights of the Old Republic II - The Sith Lords by Obsidian Entertainment and LucasArts.
- Star Wars Jedi Knight: Jedi Academy by Raven Software and LucasArts.

**Development journal:** [KOTOR Academy on Deadly Stream](https://deadlystream.com/topic/12469-kotor-academy-jedi-academy-combat-in-tsl-wip/)

## AI disclosure

KOTOR Academy was made with AI tools, under my direction. See the [AI disclosure](AI-DISCLOSURE.md) for where and how.

## Legal

KOTOR Academy is a fan project. It is not made, endorsed or supported by Lucasfilm, Disney, BioWare, Obsidian Entertainment, Raven Software, Aspyr or any other rights holder. Star Wars and all related names are trademarks of their owners.

It ships no game files and no mod files. You need your own legal copies of the games, and you install the mods from their creators' pages.

KOTOR Academy's own work is copyright 2026 Al1614 and released under the MIT licence; see `LICENSE`, `NOTICE` and `THIRD-PARTY-LICENSES.txt` in the download.

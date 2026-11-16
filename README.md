# KOTOR Academy

Play **Star Wars: Knights of the Old Republic** and **Knights of the Old Republic II** with the real-time movement and lightsaber combat of **Jedi Knight: Jedi Academy**.

The stories, party, equipment, levels, feats and Force powers are KOTOR's. The fighting is yours: you swing, block, dodge and cast in real time, and your character sheet decides how much each hit counts.

KOTOR Academy is an unofficial, free, non-commercial fan project. It contains no files from any game. It reads the games you already own.

> **Status: early release.** Both campaigns can be played from start to finish, but not every scene and side quest has been played through by hand. Expect rough edges, and see [Known issues](#known-issues).

## What you need

You need three things on your PC before KOTOR Academy will start:

1. **KOTOR I or KOTOR II** (or both). You only need the one you want to play.
2. **Star Wars Jedi Knight: Jedi Academy.**
3. **Movie Duels**, a free mod for Jedi Academy.

Any PC copy of the games should work. Steam copies are the ones that have been tested.

Your PC needs Windows 10 or 11 and a graphics card from roughly the last eight years.

## How to install

### Step 1: Install the games

Install KOTOR I and/or KOTOR II, and Jedi Academy, the normal way (for example from Steam). Start each one once to make sure it runs, then close it.

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

That is it. Next time, just use the desktop shortcut.

KOTOR Academy finds your games by itself. If it cannot find one, it tells you which, and lets you pick that game's folder. It never changes anything in your game folders.

## Optional: add mods for better looks

You do not need any of these. The game plays fine without them. They only change how KOTOR I looks.

Every mod is added the same way:

1. Open your **KOTOR Academy** folder.
2. Open the `mods` folder inside it. It is already there, empty and ready.
3. Download the mod from its creator's page.
4. Unpack the download (right-click, **Extract All**).
5. Copy the mod's files into the `mods` folder. Copy the files themselves, not the folder they came in.

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

**KOTOR I:** the arena needs one more mod, ARK07's **KOTOR Duel Room 1.0**:

1. Download the mod and unpack it (right-click, **Extract All**).
2. Open your **KOTOR Academy** folder and make a new folder inside it named `arena`.
3. Copy everything from the unpacked mod into the `arena` folder.

The story does not need this mod. Without it, KOTOR I plays normally and only the arena is missing.

## Removing KOTOR Academy

Delete the **KOTOR Academy** folder and the desktop shortcut. Your games are untouched.

## Help

- **"KOTOR Academy cannot start yet"**: the message underneath says what is missing. Install that, then try again.
- **It cannot find a game**: when it asks, click **Yes** and pick the folder where that game is installed.
- **The story movies do not play**: they need a free program called [FFmpeg](https://ffmpeg.org/download.html) installed on your PC. Without it the movies are skipped and the game carries on.
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

- **Hits are real.** A swing or shot hits when it touches the target. There is no dice roll that makes a clean hit miss.
- **Skill sets damage.** Your attack bonus against the target's Defense decides how much of your damage a hit deals, using the original game's to-hit formula.
- **Defense reduces every hit** instead of making some miss.
- **You block yourself.** Hold Guard to raise your blade; time an attack press for a perfect parry; deflect blaster bolts with a lightsaber.
- **Force powers are real time**, cost what they always did, and keep the original effects.

The full explanation, with the numbers, is in [How combat works](docs/COMBAT.md). Every rule the game plays by is in the [rulebook](docs/RULEBOOK.md). Console cheats for single-player are in the [cheat sheet](docs/CHEATS.md).

## Known issues

- Not every side quest and planet order has been played through by hand.
- Movie Duels Update 7 and 8 are untested.
- Only the Steam versions of the games have been tested. Other copies should work; tell us if one does not.
- An update can make a save from an older version refuse to load.
- Adding, removing or changing files in the `mods` folder can make existing KOTOR I saves refuse to load. Decide on your mods before you start a playthrough.

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
- KOTOR Duel Room 1.0 by ARK07, with InSidious: the room setup read by KOTOR I's optional combat arena.

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

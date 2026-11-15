# KOTOR Academy

Play **Star Wars: Knights of the Old Republic** and **Knights of the Old Republic II** with the real-time movement and lightsaber combat of **Jedi Knight: Jedi Academy**.

The stories, party, equipment, levels, feats and Force powers are KOTOR's. The fighting is yours: you swing, block, dodge and cast in real time, and your character sheet decides how much each hit counts.

KOTOR Academy is an unofficial, free, non-commercial fan project. It contains no files from any game. It reads the games you already own.

> **Status: early release.** Both campaigns can be played from start to finish, but not every scene and side quest has been played through by hand. Expect rough edges, and see [Known issues](#known-issues).

## What you need

| | |
|---|---|
| **Windows 10 or 11**, 64-bit | A graphics card that supports DirectX 12 or Vulkan |
| **KOTOR I and/or KOTOR II** | Any PC copy. You only need the one you want to play. Tested with the Steam versions. |
| **Jedi Knight: Jedi Academy** | Any PC copy. Tested with the Steam version. |
| **Movie Duels** (mod for Jedi Academy) | **Update 6 + Patch AIO**. See below. |

### Movie Duels: which version

KOTOR Academy's saber styles, guard poses and hilts come from Movie Duels. It was built and tested with **Movie Duels - Update 6 + Patch AIO (Automatic Installation)**.

Download it from the [Movie Duels downloads page on ModDB](https://www.moddb.com/mods/movie-duels/downloads) and install it into your Jedi Academy folder with its installer.

Newer Movie Duels updates (7 and 8) have not been tested yet and may not work.

## Install

1. Install **KOTOR I and/or KOTOR II**.
2. Install **Jedi Academy**.
3. Install **Movie Duels - Update 6 + Patch AIO** into Jedi Academy.
4. Download **[KOTOR-Academy-alpha-windows.zip](../../raw/main/download/KOTOR-Academy-alpha-windows.zip)**. Do not use the green "Code" button; that downloads this page's files, not just the game.
5. Extract the zip anywhere, for example your Desktop.
6. Open the extracted folder and double-click **Play KOTOR Academy**.

The first time, Windows may show "Windows protected your PC" because the program is not signed. Click **More info**, then **Run anyway**.

The launcher finds your games by itself, wherever they are installed. If it cannot find one, it asks you to point to that game's folder once and remembers it. If something is not installed, it tells you what and where to get it.

### If a game is not found

The launcher normally asks you for the folder. You can also set folders by hand: copy `paths.example.txt` to `paths.txt`, put the game's folder in it, and run **Play KOTOR Academy** again.

### Uninstall

Delete the extracted folder. Saves and settings are in `%APPDATA%\kjk`; delete that folder too if you want them gone. Your KOTOR and Jedi Academy installs are never changed.

## Optional extras

None of these are needed.

- **In-game movies.** Install [FFmpeg](https://ffmpeg.org/download.html) so `ffmpeg` is on your PATH, and the games' cutscene movies will play. Without it they are skipped.
- **KOTOR I texture and model mods.** Put loose mod files (`.tpc`, `.tga`, `.mdl`, `.mdx` and so on) into a `mods` folder next to **Play KOTOR Academy**. The project's videos use:
  - [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730?tab=files)
  - [Weapon Model Overhaul](https://www.nexusmods.com/kotor/mods/1096) with the [Texture Rework](https://www.nexusmods.com/kotor/mods/8)
  - [Revan Items](https://deadlystream.com/files/file/85-revan-items/)
- **KOTOR I combat arena.** KOTOR II's practice arena works out of the box. KOTOR I's is switched off unless you add ARK07's KOTOR Duel Room 1.0 mod, whose room setup it reads: extract that mod into an `arena` folder next to **Play KOTOR Academy** (so that a `Modules\goroom.mod` file is somewhere inside it). The campaign does not need it.

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

The full explanation, with the numbers, is in [How combat works](docs/COMBAT.md). Every rule the game plays by is in the [rulebook](docs/RULEBOOK.md).

## Known issues

- Not every side quest and planet order has been played through by hand.
- Movie Duels Update 7 and 8 are untested.
- Only the Steam versions of the games have been tested. Other copies should work; tell us if one does not.
- On the Leviathan (KOTOR I), a companion can stay behind in a fight and the lift asks you to gather your party. Walk back to them and finish the fight.
- Manaan's Sonic Emitter shows a count of 255 on the HUD. It is unlimited.
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
- [Weapon Model Overhaul](https://www.nexusmods.com/kotor/mods/1096) by Toasty Fresh.
- [Weapon Model Overhaul Texture Rework](https://www.nexusmods.com/kotor/mods/8) by Fallen Guardian.
- [Vurt's KotOR Visual Resurgence](https://www.nexusmods.com/kotor/mods/1730?tab=files) by Vurt.
- [TSLRCM](https://deadlystream.com/files/file/578-tsl-restored-content-mod/) by Zbyl2, DarthStoney, Hassat Hunter, VarsityPuppet and contributors: part of the test setup.
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

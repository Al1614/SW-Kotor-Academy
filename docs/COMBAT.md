# How combat works in KOTOR Academy

KOTOR Academy keeps the Knights of the Old Republic rules (levels, attributes, feats, Force powers, equipment) and plays them in real time with Jedi Academy's movement and lightsaber combat. Nothing waits behind a pause menu: you swing, block, dodge and cast yourself, and the original game's attack roll decides whether each blow that lands counts. Your character sheet still decides how much each of those is worth.

This page covers the changes that matter most. Every number the game plays by is in the [full rulebook](RULEBOOK.md).

## Two ways to fight

**KOTOR Academy Combat** is the default. **Fast Combat** is the combat of the first alpha. Switch between them in **Options → Gameplay**. Everything below describes KOTOR Academy Combat unless it says otherwise.

## Hitting: your aim, then the dice

An attack lands when the blade or bolt actually touches the target. Every attack that lands then makes the original game's attack roll:

    d20 + attack bonus  against  the target's Defense

- A roll that meets or beats Defense **hits** and deals the weapon's full damage roll.
- A roll below Defense **misses** and deals nothing. A natural 20 always hits; a natural 1 always misses.
- Against someone holding a blade, a miss shows as a **block**: the swing is turned aside.
- The roll is the same for you, your companions and your enemies, and for every weapon.
- There is no fixed number of attacks per round. You attack as often as you swing or shoot.

Attack bonus is what it was in the original: base attack bonus, Strength (melee) or Dexterity (ranged), Weapon Focus, lightsaber Forms, item bonuses, and the penalties for two weapons or missing proficiency.

## Defense

Defense is 10 + Dexterity modifier (limited by armor) + armor, class and other bonuses, as in the original. It makes attacks miss. The higher your Defense, the more often an enemy's attack does nothing.

## Damage

A weapon's damage is its damage roll, plus bonus damage, Strength modifier (melee) and Weapon Specialization. Critical hits multiply it. Sneak Attack adds to it. The target's resistances and damage reduction come off. A swing that cuts one body several times is one attack with one roll.

Doors, containers and other objects are not rolled against: they take damage as they did before.

## Difficulty

Difficulty changes only the damage your party takes, as in the original games.

| Difficulty | Damage the party takes | Damage the party deals |
|---|---|---|
| Padawan | 50% | 100% |
| Knight | 100% | 100% |
| Master | 150% | 100% |

## Fast Combat

Fast Combat makes no attack roll. Every attack that touches its target hits, and the chance the roll would have had sizes the damage instead:

    (21 + attack bonus − target's Defense) ÷ 20

A hit never deals less than 5% or more than 95% of its damage. Defense reduces every hit instead of making some miss. Fights are quicker and less swingy. The numbers Fast Combat plays by are in the [rulebook](RULEBOOK.md).

## Blocking

A character who is not attacking blocks blows, blaster bolts and thrown lightsabers that come from in front, within a block arc. The arc widens with defense level:

- **Lightsaber:** level 1 with Jedi Defense, 2 with Advanced Jedi Defense, 3 with Master Jedi Defense.
- **Other melee weapons:** level 1 if you are proficient with the weapon.

You cannot block while attacking, while knocked down, or without a weapon ready.

### Manual guard

Hold **Guard** (Left Alt, or the left bumper on a controller) to raise your blade yourself.

- A held guard intercepts melee swings and turns blaster bolts. Only a lit lightsaber turns bolts.
- Whether a bolt is turned uses the original game's deflection roll: your d20 + base attack bonus + your lightsaber's deflection bonus, plus 3 for each Jedi Defense feat past the first, against the shooter's attack roll.
- Hold **Attack** with the guard up to send bolts back at the shooter.
- Press **Attack** just as a blow arrives for a perfect parry. The window is 0.2 seconds.

## Lightsabers and melee

A blade harms whatever it passes through. It can be blocked by a blade held ready, or met by another blade in a clash or a saber lock. Single sabers, two sabers and double-bladed sabers each have their own styles, taken from the weapons you equip.

## The Force

Force powers are used in real time and cost the Force points their descriptions list. Their damage, saving throws and effects are the original game's.

- In KOTOR I, an empty pool of Force points refills in 20 seconds, whatever its size. KOTOR II uses its own regeneration rule.
- Force points do not regenerate while a power is active, during a Force jump, a lightsaber special, or a thrown lightsaber.
- A power you hold (such as Lightning) pays its cost again every second.
- Toggled powers (the speed powers, Force Shield and Armor, Resistance and Immunity, Affect and Dominate Mind, Fury, Force Sight) last their duration. Use one again to turn it off.

## Falling in battle

A party member reduced to 0 vitality falls unconscious instead of dying. They get up when the fight ends, or sooner if you hold **Use** over them to revive them. If the whole party falls, the game is over.

## Levels and experience

Experience, levels, feats, skills and powers follow the original games. The party shares one pool of experience.

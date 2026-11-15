# How combat works in KOTOR Academy

KOTOR Academy keeps the Knights of the Old Republic rules (levels, attributes, feats, Force powers, equipment) and plays them in real time with Jedi Academy's movement and lightsaber combat. Nothing is rolled behind a pause menu: you swing, block, dodge and cast yourself. Your character sheet still decides how much each of those is worth.

This page covers the changes that matter most. Every number the game plays by is in the [full rulebook](RULEBOOK.md).

## Hitting: your aim, your character's skill

An attack hits when the blade or bolt actually touches the target. There is no to-hit roll that makes a clean swing miss.

Instead, your character's skill sets **how much damage a hit deals**. Each hit is multiplied by the chance the original game's attack roll would have had:

    (21 + attack bonus − target's Defense) ÷ 20

- A skilled attacker against low Defense deals close to full damage.
- A weak attacker against high Defense deals little.
- A hit never deals less than 5% or more than 95% of its damage.

Attack bonus is what it was in the original: base attack bonus, Strength (melee) or Dexterity (ranged), Weapon Focus, lightsaber Forms, item bonuses, and the penalties for two weapons or missing proficiency.

## Defense

Defense is still 10 + Dexterity modifier (limited by armor) + armor, class and other bonuses. It no longer makes attacks miss. It **reduces the damage of every hit you take**, by the formula above. Raising Defense is as valuable as before; it just works on every hit instead of some of them.

## Damage

A weapon's damage is its damage roll, plus bonus damage, Strength modifier (melee) and Weapon Specialization. Critical hits multiply it. Sneak Attack adds to it. The target's resistances and damage reduction come off, and the result is scaled by the chance to hit.

A few things were tuned so real-time fights last a sensible time:

| Rule | Value |
|---|---|
| Combat pace: each round of attacks deals this many rounds' worth of damage, spread over the weapon's swings or shots | ×4 |
| Party member's vibroblade or sword: damage rolls per full swing | 2 |
| Party member's blade: least damage a landed swing deals, however high the Defense | 75% |
| Party member's blaster: least damage a landed shot deals | 50% |
| Party member's blaster: damage per shot, against its rate of fire | ×3 |
| Enemies' weapon damage | 60% |
| Most a damage resistance can stop (immunity is not limited) | 50% of the roll |

A fast weapon deals many light hits; a slow one deals few heavy hits. The total over a round is the same.

## Difficulty

| Difficulty | Damage the party takes | Damage the party deals |
|---|---|---|
| Padawan | 55% | 125% |
| Knight | 80% | 110% |
| Master | 110% | 95% |

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

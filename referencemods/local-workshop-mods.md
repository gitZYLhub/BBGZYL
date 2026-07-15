# Local Workshop Reference Mods

Date: 2026-07-15

Source directory: `D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070`

These packages were downloaded locally through SteamCMD and are now part of the
implementation reference set for `ZYL_LightweightBalance`. Use them as examples
for Civ VI SQL/XML/Lua structure only; do not copy broad balance changes unless
they are explicitly selected for this mod.

## Summary

| Workshop ID | Resolved name | Approx. scope | Main reference value |
| --- | --- | --- | --- |
| `2465378070` | Civ6 Plus: Harmony in Diversity / 文明6 Plus：和而不同 | Large complete overhaul | Belief, yield, building, district, improvement, game mode, and UI patterns |
| `2673025199` | Team PVP Balanced mod 行业 1.01 | Monopolies and Corporations balance | Small game-mode SQL package and `ModifierArguments` updates |
| `3475004450` | Team PVP Balanced mod 基础 4.86 | Broad PvP balance package | New pantheon pattern, belief modifiers, golden age and civilization balance examples |
| `3475173328` | Team PVP Balanced mod 结社 3.93 | Secret Societies balance | Society promotion timing, society building changes, and governor-title refund pattern |

## `2465378070` - Civ6 Plus: Harmony in Diversity

Local path:
`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070/2465378070`

Observed package size and shape: about 454 MB, with hundreds of SQL/XML/Lua
files. This is a very large PVE-oriented overhaul. Its description says it
rebuilt terrain, features, resources, buildings, citizens, districts,
improvements, religions, governors, city-states, great people, policies,
tech/civics, military balance, happiness, and more.

Useful files to study:

- `Description.txt`: broad design description and external project links.
- `UpdateDataBase/DL_Districts.sql`: specialist slots, specialist great person
  points, and district citizen yields.
- `UpdateDataBase/DL_Beliefs.sql`: extensive pantheon and religion overhaul.
- `UpdateDataBase/DL_Buildings.sql`: building yield and modifier examples.
- `UpdateDataBase/HD_AdjustYields.sql`: resource and base yield examples.
- `UpdateDataBase/DL_DistrictAdjacency.sql`: district adjacency examples.
- `UpdateDataBase/DL_Improvements.sql`: improvement yield examples.
- `GameModeSupport/SecretSocietiesMode/HD_SecretSocieties.sql`: Secret Societies support.

Reference notes:

- `DL_Beliefs.sql` adds many pantheons, including examples such as
  `BELIEF_OCEAN_MOTHER`, `BELIEF_HD_SUN_GOD`, `BELIEF_FISHING_TRADITION`,
  `BELIEF_GODDESS_OF_THE_DESERT`, and others. It is a strong structural
  reference for `Types`, `Beliefs`, `BeliefModifiers`, localization, and icons.
- `HD_AdjustYields.sql` is useful for resource-yield implementation style, but
  its actual balance values are much broader than our first-version scope.
- Specialist enhancement research is recorded in
  `ReferenceMods/harmony-in-diversity-expert-notes.md`.
- Treat this package as an advanced reference. It changes many systems at once,
  so copy only narrow patterns, not global assumptions.

## `2673025199` - Team PVP Balanced mod 行业 1.01

Local path:
`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070/2673025199`

Observed package shape: very small package with one main SQL file plus
localization and `.modinfo`.

Useful files to study:

- `Monopolies.sql`: direct updates to Industries, Corporations, and Products.
- `Stringtext.xml`: localization.
- `NewBuilding5.modinfo`: compact game-mode package structure.

Reference notes:

- This is useful for light-touch edits to existing game-mode modifiers, mostly
  through `UPDATE ModifierArguments`.
- It is not directly about pantheons, but it is a clean example of a narrow
  balance module.

## `3475004450` - Team PVP Balanced mod 基础 4.86

Local path:
`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070/3475004450`

Observed package shape: medium-sized PvP balance package with SQL, XML, Lua,
icons, and UI replacements. The `.modinfo` credits BBG, BBS, 号码菌, and zpMod.

Useful files to study:

- `civs_sql.sql`: broad gameplay balance, belief changes, and new pantheon examples.
- `huangjinshidai.sql`: golden age / dedication examples.
- `wonders_sql.sql`: wonder balance examples.
- `updataFourMonth.sql`, `2.67_sql.sql`, `2.81_sql.sql`, `3.09_sql.sql`: older
  or versioned balance entries.
- `Stringtext.xml`: localization for the package.
- `icons.xml`: icon definitions.
- `Close_PantheonChooser.lua` and `.xml`: pantheon chooser UI changes. Use only
  if UI work becomes necessary.

Reference notes:

- `civs_sql.sql` contains a direct new-pantheon pattern for
  `BELIEF_SHIPHERDER_PATH`: it inserts the belief into `Types` and `Beliefs`,
  attaches modifiers through `BeliefModifiers`, and uses
  `CITY_FOLLOWS_PANTHEON_REQUIREMENTS`.
- The same file also modifies vanilla pantheons with terrain/district adjacency
  effects. This is especially relevant to our planned new pantheons and pantheon
  buffs.
- Because this is a PvP balance mod, values should be treated as design
  reference only, not as defaults for our lighter mod.

## `3475173328` - Team PVP Balanced mod 结社 3.93

Local path:
`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070/3475173328`

Observed package shape: Secret Societies balance package with one main SQL file,
localization, icons, building art definitions, and game-mode config.

Useful files to study:

- `secretSocieties.sql`: all major gameplay changes for the mode.
- `Config/GameConfig_SECRETSOCIETIES.xml`: game-mode load criteria.
- `Stringtext.xml`: localization.
- `icons.xml`: icon definitions.
- `Build_shipYard.xml` and `Buildings.artdef`: building/art support examples.

Reference notes:

- `secretSocieties.sql` changes Secret Society discovery odds, society building
  yields, Vampire Castle effects, Ley Line behavior, promotion era requirements,
  and other mode-specific values.
- It directly demonstrates the likely implementation route for our planned
  "society promotions are free" design: attach
  `CIVIC_GRANT_PLAYER_GOVERNOR_POINTS` through `GovernorPromotionModifiers` to
  Secret Society promotions.
- For our stated design, the likely future implementation should attach the
  refund only to the Medieval-and-later society tiers, probably the `_2`, `_3`,
  and `_4` promotions for each society, unless the group decides the first
  society title should also be refunded.

## Reference Priority For Our Mod

1. New pantheons: start with `3475004450/civs_sql.sql`, then compare with
   `2465378070/UpdateDataBase/DL_Beliefs.sql`.
2. Pantheon localization and icons: compare `3475004450/Stringtext.xml`,
   `3475004450/icons.xml`, and Harmony in Diversity belief localization.
3. Secret Societies free-title behavior: start with
   `3475173328/secretSocieties.sql`.
4. Resource, building, district, and improvement yields: compare BBG first, then
   use Harmony in Diversity and Team PVP only for additional SQL patterns.
5. Monopolies and Corporations mode edits: use `2673025199/Monopolies.sql` if
   that game mode enters scope later.

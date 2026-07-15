# How To Add Balance Changes

This mod follows BBG's practical structure, but with a narrower and lighter
scope. Prefer gentle changes, keep every change agreed by the group, and do not
treat "buff-only" as a strict rule.

## Where to edit

- `sql/Base/Buffs.sql`: base-game changes.
- `sql/XP1/Buffs_XP1.sql`: Rise and Fall changes.
- `sql/XP2/Buffs_XP2.sql`: Gathering Storm changes.
- `lang/english.xml`: text shown in the UI or Civilopedia.
- `ZYL_LightweightBalance.modinfo`: load order and file list.

## Safe SQL habits

Use `INSERT OR IGNORE` for new rows when possible.

Prefix new IDs with `ZYL_LBM_`.

Guard vanilla `UPDATE` statements so another mod's existing buff is not undone:

```sql
UPDATE Units
SET Combat = 45
WHERE UnitType = 'UNIT_EXAMPLE'
  AND Combat < 45;
```

Avoid global changes unless the group really wants them. A global scout buff,
for example, affects every civilization and can shift the early game more than
expected.

## Suggested workflow

1. Write one buff.
2. Add or update the matching text.
3. Test one game start or saved game.
4. Commit the change with a short note about the design reason.
5. Repeat.

## Useful BBG files to study

- `BetterBalancedGame.modinfo`: load criteria and file ordering.
- `sql/Base/Arabia.sql`: trait modifier and adjacency examples.
- `sql/Base/Norway.sql`: unit, building, and adjacency examples.
- `sql/XP1/Georgia.sql`: XP1 civilization buff examples.
- `sql/XP1/Scotland.sql`: unique improvement and unit examples.

## Local Workshop reference mods

The local scan is documented in `../../ReferenceMods/local-workshop-mods.md`.
Use these as implementation references alongside BBG:

- `steamcmd/steamapps/workshop/content/289070/3475004450/civs_sql.sql`: Team PVP
  base package; useful for new pantheon definitions and pantheon modifiers.
- `steamcmd/steamapps/workshop/content/289070/3475173328/secretSocieties.sql`:
  Team PVP Secret Societies package; useful for society promotion timing and
  governor-title refund modifiers.
- `steamcmd/steamapps/workshop/content/289070/2465378070/UpdateDataBase/DL_Beliefs.sql`:
  Harmony in Diversity; useful as a large belief-system reference.
- `steamcmd/steamapps/workshop/content/289070/2465378070/UpdateDataBase/DL_Districts.sql`
  and `UpdateDataBase/DL_Buildings.sql`: Harmony in Diversity; useful for
  specialist slots, specialist great person points, and building-based
  specialist yield scaling. See `../../ReferenceMods/harmony-in-diversity-expert-notes.md`.
- `steamcmd/steamapps/workshop/content/289070/2465378070/UpdateDataBase/HD_AdjustYields.sql`:
  Harmony in Diversity; useful for resource-yield SQL patterns.
- `steamcmd/steamapps/workshop/content/289070/2673025199/Monopolies.sql`: Team
  PVP Industries package; useful for compact game-mode modifier edits.

# ZYL的轻量化平衡模组

English name: ZYL Lightweight Balance Mod

A lightweight Civilization VI mod for friendly multiplayer balance changes.
The mod prefers gentle changes, but "buff-only" is not a strict rule.

## Current state

Version 0.7.2 implements the current agreed set of changes in four categories:

- game-wide numerical adjustments
- game content additions
- civilization balance adjustments
- an optional repaired Rich Vertical Continent map for Gathering Storm

The optional map exposes vanilla-equivalent city-state counts and a dedicated
Single Player / Multiplayer city-state placement rule. Multiplayer remains the
default and preserves the map's original Team PVP behavior.

Detailed documentation:

- `docs/changelog.md`: changes in the current version compared with the previous version.
- `docs/full_changes.md`: all current changes compared with the unmodded game.
- `docs/full_changes_mobile.md`: a shorter, phone-friendly presentation of all player-facing changes.
- `docs/ZYL轻量化平衡模组_修改大全_微信版_无编号版.docx`: a large-type, narrow-page Word edition for sharing in WeChat.
- `docs/work_log.md`: implementation notes and temporarily deferred items.

Documentation maintenance rule: every gameplay change must update both `docs/full_changes.md` and `docs/full_changes_mobile.md`, then regenerate the WeChat Word edition with `.tools/build_wechat_docx.py`. The phone and WeChat editions list only actual differences from the unmodded game and omit unchanged rules.

See `docs/how_to_add_buffs.md` for examples.

## Install for local testing

Copy the whole `ZYL_LightweightBalance` folder into the Civilization VI Mods
folder, usually:

`Documents\My Games\Sid Meier's Civilization VI\Mods`

Then enable `ZYL Lightweight Balance Mod` in Additional Content.

Keep only one installed copy of the mod, and confirm it is enabled before
starting a new game. The current Workshop item uses ID `3765780333`.

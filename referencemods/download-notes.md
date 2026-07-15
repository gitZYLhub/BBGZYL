# New Pantheon Mod Reference Notes

Date: 2026-07-15

## Downloaded reference material

### Ancient Egyptian Pantheons

- Steam Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=1484935230
- Local files:
  - `ReferenceMods/AncientEgyptianPantheons/steam_ancient_egyptian_pantheons.html`
  - `ReferenceMods/AncientEgyptianPantheons/steam_ancient_egyptian_pantheons_details.json`
- Usefulness: best reference found for a mod that explicitly adds new pantheon beliefs. The public Steam description says it adds 10 Egyptian-themed pantheons.

Pantheons listed in the public description:

1. Lord of All Gods (Amun): +1 Amenity and +1 Housing in the Capital. Palace yields are doubled.
2. Lord of the Horizon (Horus): extra Wildcard policy slot in any Government.
3. God of the Oases (Ash): +2 Culture, +2 Faith, and +2 Production from Oases; +1 Science, +1 Food, and +1 Gold from tiles adjacent to an Oasis.
4. God of Watery Abyss (Nun): +1 Science, +1 Food, and +1 Gold to coastal cities.
5. Goddess of Fertility (Aset): +1 Food and +1 Gold from Farms adjacent to a River.
6. Lord of Royal Power (Apedemak): combat victories grant Science equal to 50% of the defeated unit's strength.
7. Guardian God (Sebiumeker): cities receive an additional ranged strike each turn; city garrisons receive +5 Combat Strength.
8. God of Creation (Atum): free Builder in the Capital; Builders receive +1 Charge.
9. God of Mummification (Anubis): free Settler in the Capital; +2 Faith to all cities.
10. House God (Bes): Bonus resources provide +4 Amenities per type as if they were Luxury resources.

### Pantheon - World Wonder

- Steam Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=3153028046
- Local files:
  - `ReferenceMods/PantheonWorldWonder/steam_pantheon_world_wonder.html`
  - `ReferenceMods/PantheonWorldWonder/steam_pantheon_world_wonder_details.json`
- Usefulness: secondary reference only. This appears to add a world wonder related to pantheon bonuses, not new pantheon beliefs.

### Steam search results

- Local file:
  - `ReferenceMods/SteamSearch/steam_pantheon_pack_render.json`
  - `ReferenceMods/SteamSearch/candidate_details.json`
- Usefulness: records other candidate Workshop items found during search, including Faith Pantheons, SPM Pantheon Beliefs, Vinrock's Pantheons, Create Your Pantheon, and p0kiehl's Better Pantheons.

Candidate items worth revisiting:

- Faith Pantheons (`1300008347`): adds new faith-based pantheons.
- SPM Pantheon Beliefs (`1899387161`): adds 16 new pantheons.
- Vinrock's Pantheons (`2493618364`): adds several early-game pantheon choices.
- Create Your Pantheon (`2990102039`): lets players combine a domain and power to create a custom pantheon.
- Gedemo Pantheons (`1898889676`): additional pantheon reference candidate.

## Local Workshop packages

The user later downloaded several local Workshop packages to:

`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070`

These local packages are better implementation references than the public Steam
metadata above because they include actual `.modinfo`, SQL, XML, and Lua files.
See `ReferenceMods/local-workshop-mods.md` for the current scan and reference
notes.

## Source package download attempts

Steam Workshop source package download was attempted through SteamCMD.

For `Ancient Egyptian Pantheons`:

```text
workshop_download_item 289070 1484935230
ERROR! Download item 1484935230 failed (Failure).
```

Additional candidate items tested:

```text
workshop_download_item 289070 1300008347  # Faith Pantheons
workshop_download_item 289070 1899387161  # SPM Pantheon Beliefs
workshop_download_item 289070 2493618364  # Vinrock's Pantheons
workshop_download_item 289070 2990102039  # Create Your Pantheon
workshop_download_item 289070 1898889676  # Gedemo Pantheons
```

Each additional candidate also returned:

```text
ERROR! Download item <id> failed (Failure).
```

The GGNETWORK download API also did not return the actual package for the candidate Workshop items tested. Steam's public UGC file endpoint requires an API key for direct file details.

Conclusion: the actual `.modinfo` / SQL package was not obtainable anonymously from this environment. The locally saved Steam page and metadata are still useful for design reference, while BBG remains the main local reference for Civilization VI SQL/XML implementation patterns.

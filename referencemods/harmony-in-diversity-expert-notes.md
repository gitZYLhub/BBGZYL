# Harmony in Diversity Expert Notes

Date: 2026-07-15

Source mod: Civ6 Plus: Harmony in Diversity / 文明6 Plus：和而不同

Local path:
`D:/Coderlife/BBGZYL/steamcmd/steamapps/workshop/content/289070/2465378070`

This note records how Harmony in Diversity enhances specialists. It is research
only; `ZYL_LightweightBalance` does not implement specialist changes yet.

## Main Files

- `UpdateDataBase/DL_Districts.sql`: district specialist slots, specialist great
  person points, and base district citizen yields.
- `UpdateDataBase/DL_Buildings.sql`: building-based specialist yield scaling.
- `UpdateDataBase/DL_BuildingDefinations.sql`: additional custom building
  specialist yields.
- `UpdateDataBase/DL_Wonders.sql`: some wonders add specialist-style citizen
  yields to their dummy/support buildings.

## Core Mechanism

Harmony in Diversity uses two vanilla database tables for specialists:

- `District_CitizenGreatPersonPoints`: gives specialists in a district great
  person points.
- `Building_CitizenYieldChanges`: lets buildings in that district change the
  yields of specialists working the district.

It also increases `Districts.CitizenSlots` for major specialty districts so
players can actually assign district specialists earlier and more consistently.

## Great Person Points

In `DL_Districts.sql`, the mod inserts rows like these:

- Campus specialists: scientist points.
- Commercial Hub specialists: merchant points.
- Encampment specialists: general points.
- Harbor specialists: admiral points.
- Holy Site specialists: prophet points, plus small artist and musician points.
- Industrial Zone specialists: engineer points.
- Theater Square specialists: writer, artist, and musician points.

It then copies those rows to unique district replacements through
`DistrictReplaces`, so unique districts inherit the same specialist GPP logic.

The source comment says: `1 represents 2 points`. The inserted values are mostly
`2`, with Holy Site artist/musician and Lavra writer entries using `1`.

## Citizen Slots

In `DL_Districts.sql`, the mod sets these district citizen slots:

- Major specialty districts such as Campus, Commercial Hub, Encampment, Harbor,
  Holy Site, Industrial Zone, and Theater Square: `CitizenSlots = 1`.
- Unique replacements of those districts: also `CitizenSlots = 1`.
- Seowon: `CitizenSlots = 4`.
- Neighborhood and Neighborhood replacements: `CitizenSlots = 4`.

This is not just a yield buff. It makes specialist assignment more accessible by
ensuring districts have usable slots.

## Building-Based Specialist Yields

In `DL_Buildings.sql`, Harmony in Diversity adds `Building_CitizenYieldChanges`
rows. Its own comment summarizes the target totals:

- Most district specialists scale to total yields of 2, 3, 4, and 6 through
  building tiers.
- Industrial Zone specialists are an exception: 2, 4, 5, and 6.
- Holy Site specialists are an exception: 3, 4, 5, and 6.
- Extra specialist yields usually add negative gold as a cost, except when the
  added yield is Gold or Faith.

Examples from the file:

- Campus:
  - Library: +1 Science, -1 Gold.
  - University: +1 Science, -1 Gold.
  - Research Lab: +2 Science, -2 Gold.
  - Madrasa: +1 Science, +1 Faith, -1 Gold.
- Theater Square:
  - Amphitheater and museums: +1 Culture, -1 Gold.
  - Broadcast Center / Film Studio: +2 Culture, -2 Gold.
  - Marae: +1 Culture, -1 Gold.
- Industrial Zone:
  - Workshop: +2 Production, -2 Gold.
  - Factory and power plants: +1 Production, -1 Gold.
- Holy Site:
  - Shrine: +1 Faith.
  - Temple and Stave Church: +1 Faith.
- Harbor:
  - Lighthouse: +2 Production.
  - Shipyard: +1 Food, +1 Production, -2 Gold.
  - Seaport: +2 Production, -2 Gold.
- Encampment:
  - Barracks, Stable, Ordu, and Armory: +1 Production, -1 Gold.
  - Military Academy: +2 Production, -2 Gold.
- Commercial Hub:
  - Market: +2 Gold.
  - Bank and Grand Bazaar: +2 Gold.
  - Stock Exchange: +4 Gold.
- Neighborhood:
  - Food Market: +1 Food.
  - Shopping Mall: +3 Gold.

## Takeaway For ZYL Balance

If we later implement expert enhancement, the cleanest light version would be:

1. Use `District_CitizenGreatPersonPoints` for a small, direct GPP identity per
   district type.
2. Use `Building_CitizenYieldChanges` for modest building-tier scaling.
3. Copy district rows to unique replacements through `DistrictReplaces`.
4. Avoid Harmony in Diversity's broader system changes unless the group
   explicitly wants specialists to become a major economy pillar.

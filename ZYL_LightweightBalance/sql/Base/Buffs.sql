------------------------------------------------------------------------------
-- FILE:    Base/Buffs.sql
-- PURPOSE: Base-game balance changes that are safe for base-game rules.
--
-- Scope:
--   1. Only implement the changes explicitly listed by the group.
--   2. Use the ZYL_LBM_ prefix for new rows to avoid collisions.
--   3. Keep existing values from being lowered unless the change explicitly
--      asks for a lower value.
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Game-wide yield and infrastructure changes
------------------------------------------------------------------------------

-- Luxury resource yield adjustments.
INSERT OR IGNORE INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) VALUES
	('RESOURCE_MERCURY', 'YIELD_PRODUCTION', 0),
	('RESOURCE_JADE', 'YIELD_PRODUCTION', 0),
	('RESOURCE_INCENSE', 'YIELD_FOOD', 0),
	('RESOURCE_TEA', 'YIELD_FOOD', 0),
	('RESOURCE_COTTON', 'YIELD_FOOD', 0),
	('RESOURCE_MARBLE', 'YIELD_GOLD', 0);

UPDATE Resource_YieldChanges
SET YieldChange = YieldChange + 1
WHERE (ResourceType = 'RESOURCE_MERCURY' AND YieldType = 'YIELD_PRODUCTION')
   OR (ResourceType = 'RESOURCE_JADE' AND YieldType = 'YIELD_PRODUCTION')
   OR (ResourceType = 'RESOURCE_INCENSE' AND YieldType = 'YIELD_FOOD')
   OR (ResourceType = 'RESOURCE_TEA' AND YieldType = 'YIELD_FOOD')
   OR (ResourceType = 'RESOURCE_COTTON' AND YieldType = 'YIELD_FOOD');

UPDATE Resource_YieldChanges
SET YieldChange = YieldChange + 2
WHERE ResourceType = 'RESOURCE_MARBLE'
  AND YieldType = 'YIELD_GOLD';

-- Fishing Boats: keep the vanilla food and add +1 Production.
INSERT OR IGNORE INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 0);

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange + 1
WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS'
  AND YieldType = 'YIELD_PRODUCTION';

-- Commercial Hub and unique replacements receive a major Gold adjacency from Luxury resources.
INSERT OR IGNORE INTO Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentResourceClass)
VALUES
	('ZYL_LBM_COMMERCIAL_HUB_LUXURY_GOLD', 'LOC_DISTRICT_ZYL_LBM_COMMERCIAL_HUB_LUXURY_GOLD', 'YIELD_GOLD', 2, 1, 'RESOURCECLASS_LUXURY');

INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId)
	SELECT DistrictType, 'ZYL_LBM_COMMERCIAL_HUB_LUXURY_GOLD'
	FROM Districts
	WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB'
	   OR DistrictType IN (
			SELECT CivUniqueDistrictType
			FROM DistrictReplaces
			WHERE ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB'
	   );

-- Bank and all Bank replacements, including Grand Bazaar and Gilded Vault when present: +10 Gold.
INSERT OR IGNORE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange)
	SELECT BuildingType, 'YIELD_GOLD', 0
	FROM Buildings
	WHERE BuildingType = 'BUILDING_BANK'
	   OR BuildingType IN (
			SELECT CivUniqueBuildingType
			FROM BuildingReplaces
			WHERE ReplacesBuildingType = 'BUILDING_BANK'
	   )
	   OR BuildingType IN ('BUILDING_GRAND_BAZAAR', 'BUILDING_GILDED_VAULT');

UPDATE Building_YieldChanges
SET YieldChange = 10
WHERE YieldType = 'YIELD_GOLD'
  AND YieldChange < 10
  AND BuildingType IN (
		SELECT 'BUILDING_BANK'
		UNION SELECT CivUniqueBuildingType FROM BuildingReplaces WHERE ReplacesBuildingType = 'BUILDING_BANK'
		UNION SELECT 'BUILDING_GRAND_BAZAAR'
		UNION SELECT 'BUILDING_GILDED_VAULT'
  );

UPDATE Buildings
SET Description = 'LOC_BUILDING_ZYL_LBM_BANK_DESCRIPTION'
WHERE BuildingType = 'BUILDING_BANK';

-- Stock Exchange: +1 Gold per citizen in the city.
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_STOCK_EXCHANGE_GOLD_PER_POP', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_STOCK_EXCHANGE_GOLD_PER_POP', 'YieldType', 'YIELD_GOLD'),
	('ZYL_LBM_STOCK_EXCHANGE_GOLD_PER_POP', 'Amount', 1);

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
	SELECT BuildingType, 'ZYL_LBM_STOCK_EXCHANGE_GOLD_PER_POP'
	FROM Buildings
	WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE'
	   OR BuildingType IN (
			SELECT CivUniqueBuildingType
			FROM BuildingReplaces
			WHERE ReplacesBuildingType = 'BUILDING_STOCK_EXCHANGE'
	   );

UPDATE Buildings
SET Description = 'LOC_BUILDING_ZYL_LBM_STOCK_EXCHANGE_DESCRIPTION'
WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';

-- Workshop cost: 195 -> 140 on standard speed.
UPDATE Buildings
SET Cost = 140
WHERE BuildingType = 'BUILDING_WORKSHOP'
  AND Cost > 140;

-- District specialists: increase baseline specialist yields. Unique district
-- replacements inherit the target values from their matching normal districts.
CREATE TEMPORARY TABLE ZYL_LBM_DistrictSpecialistYieldTargets (
	ReplacesDistrictType TEXT NOT NULL,
	YieldType TEXT NOT NULL,
	YieldChange INTEGER NOT NULL,
	PRIMARY KEY (ReplacesDistrictType, YieldType)
);

INSERT INTO ZYL_LBM_DistrictSpecialistYieldTargets
	(ReplacesDistrictType, YieldType, YieldChange)
VALUES
	('DISTRICT_HARBOR', 'YIELD_FOOD', 1),
	('DISTRICT_HARBOR', 'YIELD_GOLD', 4),
	('DISTRICT_INDUSTRIAL_ZONE', 'YIELD_PRODUCTION', 3),
	('DISTRICT_THEATER', 'YIELD_CULTURE', 3),
	('DISTRICT_ENCAMPMENT', 'YIELD_PRODUCTION', 2),
	('DISTRICT_ENCAMPMENT', 'YIELD_GOLD', 2),
	('DISTRICT_COMMERCIAL_HUB', 'YIELD_GOLD', 6),
	('DISTRICT_HOLY_SITE', 'YIELD_FAITH', 3),
	('DISTRICT_CAMPUS', 'YIELD_SCIENCE', 3);

INSERT OR IGNORE INTO District_CitizenYieldChanges
	(DistrictType, YieldType, YieldChange)
	SELECT ReplacesDistrictType, YieldType, 0
	FROM ZYL_LBM_DistrictSpecialistYieldTargets;

INSERT OR IGNORE INTO District_CitizenYieldChanges
	(DistrictType, YieldType, YieldChange)
	SELECT DistrictReplaces.CivUniqueDistrictType, ZYL_LBM_DistrictSpecialistYieldTargets.YieldType, 0
	FROM ZYL_LBM_DistrictSpecialistYieldTargets
		INNER JOIN DistrictReplaces
			ON DistrictReplaces.ReplacesDistrictType = ZYL_LBM_DistrictSpecialistYieldTargets.ReplacesDistrictType;

UPDATE District_CitizenYieldChanges
SET YieldChange = (
	SELECT ZYL_LBM_DistrictSpecialistYieldTargets.YieldChange
	FROM ZYL_LBM_DistrictSpecialistYieldTargets
	WHERE ZYL_LBM_DistrictSpecialistYieldTargets.ReplacesDistrictType = District_CitizenYieldChanges.DistrictType
	  AND ZYL_LBM_DistrictSpecialistYieldTargets.YieldType = District_CitizenYieldChanges.YieldType
)
WHERE EXISTS (
	SELECT 1
	FROM ZYL_LBM_DistrictSpecialistYieldTargets
	WHERE ZYL_LBM_DistrictSpecialistYieldTargets.ReplacesDistrictType = District_CitizenYieldChanges.DistrictType
	  AND ZYL_LBM_DistrictSpecialistYieldTargets.YieldType = District_CitizenYieldChanges.YieldType
	  AND District_CitizenYieldChanges.YieldChange < ZYL_LBM_DistrictSpecialistYieldTargets.YieldChange
);

UPDATE District_CitizenYieldChanges
SET YieldChange = (
	SELECT ZYL_LBM_DistrictSpecialistYieldTargets.YieldChange
	FROM ZYL_LBM_DistrictSpecialistYieldTargets
		INNER JOIN DistrictReplaces
			ON DistrictReplaces.ReplacesDistrictType = ZYL_LBM_DistrictSpecialistYieldTargets.ReplacesDistrictType
	WHERE DistrictReplaces.CivUniqueDistrictType = District_CitizenYieldChanges.DistrictType
	  AND ZYL_LBM_DistrictSpecialistYieldTargets.YieldType = District_CitizenYieldChanges.YieldType
)
WHERE EXISTS (
	SELECT 1
	FROM ZYL_LBM_DistrictSpecialistYieldTargets
		INNER JOIN DistrictReplaces
			ON DistrictReplaces.ReplacesDistrictType = ZYL_LBM_DistrictSpecialistYieldTargets.ReplacesDistrictType
	WHERE DistrictReplaces.CivUniqueDistrictType = District_CitizenYieldChanges.DistrictType
	  AND ZYL_LBM_DistrictSpecialistYieldTargets.YieldType = District_CitizenYieldChanges.YieldType
	  AND District_CitizenYieldChanges.YieldChange < ZYL_LBM_DistrictSpecialistYieldTargets.YieldChange
);

DROP TABLE ZYL_LBM_DistrictSpecialistYieldTargets;

------------------------------------------------------------------------------
-- New pantheon beliefs
------------------------------------------------------------------------------

INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('BELIEF_ZYL_LBM_MOON_GODDESS', 'KIND_BELIEF'),
	('BELIEF_ZYL_LBM_CALM_SEA_GODDESS', 'KIND_BELIEF'),
	('BELIEF_ZYL_LBM_COMMERCE_GODDESS', 'KIND_BELIEF'),
	('BELIEF_ZYL_LBM_SUN_GOD', 'KIND_BELIEF');

INSERT OR IGNORE INTO Beliefs (BeliefType, Name, Description, BeliefClassType) VALUES
	('BELIEF_ZYL_LBM_MOON_GODDESS', 'LOC_BELIEF_ZYL_LBM_MOON_GODDESS_NAME', 'LOC_BELIEF_ZYL_LBM_MOON_GODDESS_DESCRIPTION', 'BELIEF_CLASS_PANTHEON'),
	('BELIEF_ZYL_LBM_CALM_SEA_GODDESS', 'LOC_BELIEF_ZYL_LBM_CALM_SEA_GODDESS_NAME', 'LOC_BELIEF_ZYL_LBM_CALM_SEA_GODDESS_DESCRIPTION', 'BELIEF_CLASS_PANTHEON'),
	('BELIEF_ZYL_LBM_COMMERCE_GODDESS', 'LOC_BELIEF_ZYL_LBM_COMMERCE_GODDESS_NAME', 'LOC_BELIEF_ZYL_LBM_COMMERCE_GODDESS_DESCRIPTION', 'BELIEF_CLASS_PANTHEON'),
	('BELIEF_ZYL_LBM_SUN_GOD', 'LOC_BELIEF_ZYL_LBM_SUN_GOD_NAME', 'LOC_BELIEF_ZYL_LBM_SUN_GOD_DESCRIPTION', 'BELIEF_CLASS_PANTHEON');

-- Moon Goddess: +2 Gold on Coast and Ocean terrain. Lakes usually use Coast terrain.
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_PLOT_IS_WATER_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY');

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_PLOT_TERRAIN_COAST', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'),
	('ZYL_LBM_REQUIRES_PLOT_TERRAIN_OCEAN', 'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_PLOT_TERRAIN_COAST', 'TerrainType', 'TERRAIN_COAST'),
	('ZYL_LBM_REQUIRES_PLOT_TERRAIN_OCEAN', 'TerrainType', 'TERRAIN_OCEAN');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_PLOT_IS_WATER_REQUIREMENTS', 'ZYL_LBM_REQUIRES_PLOT_TERRAIN_COAST'),
	('ZYL_LBM_PLOT_IS_WATER_REQUIREMENTS', 'ZYL_LBM_REQUIRES_PLOT_TERRAIN_OCEAN');

-- Sun God resource tag: Wheat, Rice, and Maize when present.
INSERT OR IGNORE INTO Tags (Tag, Vocabulary) VALUES
	('CLASS_ZYL_LBM_SUN_GOD_FAITH', 'RESOURCE_CLASS');

INSERT OR IGNORE INTO TypeTags (Type, Tag)
	SELECT ResourceType, 'CLASS_ZYL_LBM_SUN_GOD_FAITH'
	FROM Resources
	WHERE ResourceType IN ('RESOURCE_WHEAT', 'RESOURCE_RICE', 'RESOURCE_MAIZE');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_PLOT_HAS_SUN_GOD_RESOURCE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_PLOT_HAS_SUN_GOD_RESOURCE', 'REQUIREMENT_PLOT_RESOURCE_TAG_MATCHES');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_PLOT_HAS_SUN_GOD_RESOURCE', 'Tag', 'CLASS_ZYL_LBM_SUN_GOD_FAITH');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_PLOT_HAS_SUN_GOD_RESOURCE_REQUIREMENTS', 'ZYL_LBM_REQUIRES_PLOT_HAS_SUN_GOD_RESOURCE');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_MOON_GODDESS_WATER_GOLD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_MOON_GODDESS_WATER_GOLD_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_PLOT_IS_WATER_REQUIREMENTS'),
	('ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY_MODIFIER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', NULL),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH_MODIFIER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD', NULL),
	('ZYL_LBM_SUN_GOD_RESOURCE_FAITH', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_SUN_GOD_RESOURCE_FAITH_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_PLOT_HAS_SUN_GOD_RESOURCE_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_MOON_GODDESS_WATER_GOLD', 'ModifierId', 'ZYL_LBM_MOON_GODDESS_WATER_GOLD_MODIFIER'),
	('ZYL_LBM_MOON_GODDESS_WATER_GOLD_MODIFIER', 'YieldType', 'YIELD_GOLD'),
	('ZYL_LBM_MOON_GODDESS_WATER_GOLD_MODIFIER', 'Amount', 2),
	('ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE', 'ModifierId', 'ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE_MODIFIER'),
	('ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
	('ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE_MODIFIER', 'Amount', 1),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY', 'ModifierId', 'ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY_MODIFIER'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY_MODIFIER', 'Amount', 1),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH', 'ModifierId', 'ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH_MODIFIER'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH_MODIFIER', 'YieldType', 'YIELD_FAITH'),
	('ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH_MODIFIER', 'Amount', 1),
	('ZYL_LBM_SUN_GOD_RESOURCE_FAITH', 'ModifierId', 'ZYL_LBM_SUN_GOD_RESOURCE_FAITH_MODIFIER'),
	('ZYL_LBM_SUN_GOD_RESOURCE_FAITH_MODIFIER', 'YieldType', 'YIELD_FAITH'),
	('ZYL_LBM_SUN_GOD_RESOURCE_FAITH_MODIFIER', 'Amount', 2);

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) VALUES
	('BELIEF_ZYL_LBM_MOON_GODDESS', 'ZYL_LBM_MOON_GODDESS_WATER_GOLD'),
	('BELIEF_ZYL_LBM_CALM_SEA_GODDESS', 'ZYL_LBM_CALM_SEA_FISHING_BOATS_CULTURE'),
	('BELIEF_ZYL_LBM_COMMERCE_GODDESS', 'ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_CAPACITY'),
	('BELIEF_ZYL_LBM_COMMERCE_GODDESS', 'ZYL_LBM_COMMERCE_GODDESS_TRADE_ROUTE_FAITH'),
	('BELIEF_ZYL_LBM_SUN_GOD', 'ZYL_LBM_SUN_GOD_RESOURCE_FAITH');

------------------------------------------------------------------------------
-- Existing pantheon belief changes
------------------------------------------------------------------------------

-- City Patron Goddess: district production in cities without a specialty district +40%.
UPDATE ModifierArguments
SET Value = '40'
WHERE ModifierId = 'CITY_PATRON_GODDESS_DISTRICT_PRODUCTION_MODIFIER'
  AND Name = 'Amount';

-- Stone Circles: Quarries provide +1 Culture and +1 Faith.
UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'STONE_CIRCLES_QUARRY_FAITH_MODIFIER'
  AND Name = 'Amount';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE_MODIFIER', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'PLOT_HAS_QUARRY_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE', 'ModifierId', 'ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE_MODIFIER'),
	('ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE_MODIFIER', 'YieldType', 'YIELD_CULTURE'),
	('ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE_MODIFIER', 'Amount', 1);

INSERT OR IGNORE INTO BeliefModifiers (BeliefType, ModifierID) VALUES
	('BELIEF_STONE_CIRCLES', 'ZYL_LBM_STONE_CIRCLES_QUARRY_CULTURE');

-- Religious Idols: Mines on Luxury or Bonus resources provide +3 Faith.
UPDATE ModifierArguments
SET Value = '3'
WHERE ModifierId IN ('RELIGIOUS_IDOLS_BONUS_MINE_FAITH_MODIFIER', 'RELIGIOUS_IDOLS_LUXURY_MINE_FAITH_MODIFIER')
  AND Name = 'Amount';

-- Monument to the Gods: +15% Production to wonders from all eras.
UPDATE ModifierArguments
SET Value = 'ERA_INFORMATION'
WHERE ModifierId = 'MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER'
  AND Name = 'EndEra';

UPDATE ModifierArguments
SET Value = '15'
WHERE ModifierId = 'MONUMENT_TO_THE_GODS_ANCIENTCLASSICALWONDER_MODIFIER'
  AND Name = 'Amount';

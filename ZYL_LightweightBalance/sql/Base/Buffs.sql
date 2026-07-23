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

-- Halve each standard wall tier's Outer Defense hit points while preserving
-- its strength, cost, Tourism, ranged strikes, and siege-support behavior.
UPDATE Buildings
SET OuterDefenseHitPoints = 50,
	Description = CASE BuildingType
		WHEN 'BUILDING_WALLS' THEN 'LOC_BUILDING_ZYL_LBM_WALLS_DESCRIPTION'
		WHEN 'BUILDING_CASTLE' THEN 'LOC_BUILDING_ZYL_LBM_CASTLE_DESCRIPTION'
		WHEN 'BUILDING_STAR_FORT' THEN 'LOC_BUILDING_ZYL_LBM_STAR_FORT_DESCRIPTION'
	END
WHERE BuildingType IN (
	'BUILDING_WALLS',
	'BUILDING_CASTLE',
	'BUILDING_STAR_FORT'
);

-- Steel replaces constructed walls with Urban Defenses, so its independent
-- defense value must also be halved from 400 to 200.
UPDATE ModifierArguments
SET Value = '200'
WHERE ModifierId = 'STEEL_UNLOCK_URBAN_DEFENSES'
  AND Name = 'DefenseValue';

UPDATE Technologies
SET Description = 'LOC_TECH_ZYL_LBM_STEEL_DESCRIPTION'
WHERE TechnologyType = 'TECH_STEEL';

-- Battleship: align with BBG's lower combat profile.
UPDATE Units
SET Combat = 65,
	RangedCombat = 75
WHERE UnitType = 'UNIT_BATTLESHIP';

------------------------------------------------------------------------------
-- Ocean resources
------------------------------------------------------------------------------

-- Shark is a new coast-only luxury resource. It deliberately has no
-- FEATURE_REEF entry, so it cannot spawn on reefs.
INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('RESOURCE_ZYL_LBM_SHARK', 'KIND_RESOURCE');

INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES
	('RESOURCE_ZYL_LBM_SHARK', 'CLASS_FOOD'),
	('RESOURCE_ZYL_LBM_SHARK', 'CLASS_GOLD'),
	('RESOURCE_ZYL_LBM_SHARK', 'CLASS_SEA');

INSERT OR IGNORE INTO Resources
	(ResourceType, Name, ResourceClassType, LakeEligible, SeaFrequency, NoRiver, Happiness, Frequency)
VALUES
	('RESOURCE_ZYL_LBM_SHARK', 'LOC_RESOURCE_ZYL_LBM_SHARK_NAME', 'RESOURCECLASS_LUXURY', 0, 1, 0, 4, 0);

INSERT OR IGNORE INTO Resource_ValidTerrains (ResourceType, TerrainType) VALUES
	('RESOURCE_ZYL_LBM_SHARK', 'TERRAIN_COAST');

INSERT OR IGNORE INTO Improvement_ValidResources
	(ImprovementType, ResourceType, MustRemoveFeature)
VALUES
	('IMPROVEMENT_FISHING_BOATS', 'RESOURCE_ZYL_LBM_SHARK', 0);

-- Set the seven ordinary ocean resources to their agreed final yields.
DELETE FROM Resource_YieldChanges
WHERE ResourceType IN (
	'RESOURCE_FISH',
	'RESOURCE_CRABS',
	'RESOURCE_PEARLS',
	'RESOURCE_ZYL_LBM_SHARK',
	'RESOURCE_WHALES',
	'RESOURCE_TURTLES',
	'RESOURCE_AMBER'
);

INSERT INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) VALUES
	('RESOURCE_FISH', 'YIELD_FOOD', 1),
	('RESOURCE_CRABS', 'YIELD_PRODUCTION', 1),
	('RESOURCE_CRABS', 'YIELD_GOLD', 1),
	('RESOURCE_PEARLS', 'YIELD_FOOD', 1),
	('RESOURCE_PEARLS', 'YIELD_FAITH', 1),
	('RESOURCE_ZYL_LBM_SHARK', 'YIELD_FOOD', 1),
	('RESOURCE_ZYL_LBM_SHARK', 'YIELD_GOLD', 1),
	('RESOURCE_WHALES', 'YIELD_PRODUCTION', 1),
	('RESOURCE_WHALES', 'YIELD_GOLD', 1),
	('RESOURCE_TURTLES', 'YIELD_SCIENCE', 1),
	('RESOURCE_AMBER', 'YIELD_CULTURE', 1);

-- Fish may appear on reefs. Crabs, pearls, sharks, and whales must not.
INSERT OR IGNORE INTO Resource_ValidFeatures (ResourceType, FeatureType)
SELECT 'RESOURCE_FISH', 'FEATURE_REEF'
WHERE EXISTS (SELECT 1 FROM Features WHERE FeatureType = 'FEATURE_REEF');

DELETE FROM Resource_ValidFeatures
WHERE ResourceType IN ('RESOURCE_CRABS', 'RESOURCE_PEARLS', 'RESOURCE_WHALES')
	AND FeatureType = 'FEATURE_REEF';

-- Amber now follows the turtle model: sea-only and only valid when a reef is
-- present. Clearing its previous land placements keeps it out of land pools.
UPDATE Resources
SET LakeEligible = 0,
	SeaFrequency = 1,
	Frequency = 0
WHERE ResourceType = 'RESOURCE_AMBER';

DELETE FROM Resource_ValidTerrains
WHERE ResourceType = 'RESOURCE_AMBER';

INSERT OR IGNORE INTO Resource_ValidTerrains (ResourceType, TerrainType) VALUES
	('RESOURCE_AMBER', 'TERRAIN_COAST');

DELETE FROM Resource_ValidFeatures
WHERE ResourceType = 'RESOURCE_AMBER';

INSERT OR IGNORE INTO Resource_ValidFeatures (ResourceType, FeatureType)
SELECT 'RESOURCE_AMBER', 'FEATURE_REEF'
WHERE EXISTS (SELECT 1 FROM Features WHERE FeatureType = 'FEATURE_REEF');

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

-- Luxury resources can be harvested after the technology for their normal
-- improvement is unlocked. Strategic resources use their own reveal/develop
-- technology so late resources are not advertised on earlier technologies.
-- Resources remain under newly founded City Centers because harvesting does
-- not alter the base game's resource settlement behavior.
INSERT OR REPLACE INTO Resource_Harvests
	(ResourceType, YieldType, Amount, PrereqTech)
	SELECT
		Resources.ResourceType,
		CASE Resources.ResourceClassType
			WHEN 'RESOURCECLASS_STRATEGIC' THEN 'YIELD_PRODUCTION'
			WHEN 'RESOURCECLASS_LUXURY' THEN 'YIELD_GOLD'
		END,
		CASE Resources.ResourceClassType
			WHEN 'RESOURCECLASS_STRATEGIC' THEN 20
			WHEN 'RESOURCECLASS_LUXURY' THEN 40
		END,
		CASE
			WHEN Resources.ResourceClassType = 'RESOURCECLASS_STRATEGIC'
				THEN Resources.PrereqTech
			WHEN EXISTS (
				SELECT 1 FROM Improvement_ValidResources
				WHERE ResourceType = Resources.ResourceType
				  AND ImprovementType = 'IMPROVEMENT_PLANTATION'
			) THEN 'TECH_IRRIGATION'
			WHEN EXISTS (
				SELECT 1 FROM Improvement_ValidResources
				WHERE ResourceType = Resources.ResourceType
				  AND ImprovementType IN ('IMPROVEMENT_PASTURE', 'IMPROVEMENT_CAMP')
			) THEN 'TECH_ANIMAL_HUSBANDRY'
			WHEN EXISTS (
				SELECT 1 FROM Improvement_ValidResources
				WHERE ResourceType = Resources.ResourceType
				  AND ImprovementType IN ('IMPROVEMENT_MINE', 'IMPROVEMENT_QUARRY')
			) THEN 'TECH_MINING'
			WHEN EXISTS (
				SELECT 1 FROM Improvement_ValidResources
				WHERE ResourceType = Resources.ResourceType
				  AND ImprovementType = 'IMPROVEMENT_FISHING_BOATS'
			) THEN 'TECH_SAILING'
			ELSE Resources.PrereqTech
		END
	FROM Resources
	WHERE Resources.ResourceClassType IN (
		'RESOURCECLASS_STRATEGIC',
		'RESOURCECLASS_LUXURY'
	)
	  AND Resources.ResourceType NOT IN (
		'RESOURCE_CINNAMON',
		'RESOURCE_CLOVES',
		'RESOURCE_COSMETICS',
		'RESOURCE_JEANS',
		'RESOURCE_PERFUME',
		'RESOURCE_TOYS'
	  );

-- Fishing Boats: keep the vanilla food and add +1 Production.
INSERT OR IGNORE INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 0);

UPDATE Improvement_YieldChanges
SET YieldChange = YieldChange + 1
WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS'
  AND YieldType = 'YIELD_PRODUCTION';

-- Harbors and unique Harbor replacements provide +2 Housing. Lighthouses and
-- their replacements no longer provide Housing, moving the sea-city Housing
-- payoff to the district itself.
UPDATE Buildings
SET Housing = 0,
	Description = CASE
		WHEN BuildingType = 'BUILDING_LIGHTHOUSE' THEN 'LOC_BUILDING_ZYL_LBM_LIGHTHOUSE_DESCRIPTION'
		ELSE Description
	END
WHERE BuildingType = 'BUILDING_LIGHTHOUSE'
   OR BuildingType IN (
		SELECT CivUniqueBuildingType
		FROM BuildingReplaces
		WHERE ReplacesBuildingType = 'BUILDING_LIGHTHOUSE'
   );

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_HARBOR_HOUSING', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_HARBOR_HOUSING', 'Amount', 2);

INSERT OR IGNORE INTO DistrictModifiers (DistrictType, ModifierId)
	SELECT DistrictType, 'ZYL_LBM_HARBOR_HOUSING'
	FROM Districts
	WHERE DistrictType = 'DISTRICT_HARBOR'
	   OR DistrictType IN (
			SELECT CivUniqueDistrictType
			FROM DistrictReplaces
			WHERE ReplacesDistrictType = 'DISTRICT_HARBOR'
	   );

UPDATE Districts
SET Description = CASE
	WHEN DistrictType = 'DISTRICT_HARBOR' THEN 'LOC_DISTRICT_ZYL_LBM_HARBOR_DESCRIPTION'
	ELSE Description
END
WHERE DistrictType = 'DISTRICT_HARBOR'
   OR DistrictType IN (
		SELECT CivUniqueDistrictType
		FROM DistrictReplaces
		WHERE ReplacesDistrictType = 'DISTRICT_HARBOR'
   );

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
	('ZYL_LBM_STOCK_EXCHANGE_GOLD_PER_POP', 'MODIFIER_ZYL_LBM_SINGLE_CITY_ADJUST_YIELD_PER_POPULATION');

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

-- Seaport: unlock earlier at Steam Power and reduce standard-speed cost to 360.
UPDATE Buildings
SET PrereqTech = 'TECH_STEAM_POWER',
	Cost = 360,
	Description = 'LOC_BUILDING_ZYL_LBM_SEAPORT_DESCRIPTION'
WHERE BuildingType = 'BUILDING_SEAPORT';

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

------------------------------------------------------------------------------
-- FILE:    XP2/Buffs_XP2.sql
-- PURPOSE: Changes for Gathering Storm content.
------------------------------------------------------------------------------

-- Fire Goddess: Volcanic Soil and Geothermal Fissures provide +4 Faith.
UPDATE ModifierArguments
SET Value = '4'
WHERE ModifierId = 'GODDESS_OF_FIRE_FEATURES_FAITH_MODIFIER'
  AND Name = 'Amount';

-- Earth Goddess: Charming or better Appeal tiles provide +1 Faith.
UPDATE Modifiers
SET SubjectRequirementSetId = 'PLOT_CHARMING_APPEAL'
WHERE ModifierId = 'EARTH_GODDESS_APPEAL_FAITH_MODIFIER';

UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'EARTH_GODDESS_APPEAL_FAITH_MODIFIER'
  AND Name = 'Amount';

------------------------------------------------------------------------------
-- Military Engineer roads
------------------------------------------------------------------------------

-- Ordinary roads no longer consume Military Engineer build charges. Each
-- road tile costs exactly 1 Iron. Railroads retain their vanilla 1 Iron plus
-- 1 Coal cost and are deliberately excluded from these statements.
UPDATE Routes_XP2
SET BuildWithUnitChargeCost = 0
WHERE RouteType IN (
	'ROUTE_ANCIENT_ROAD',
	'ROUTE_MEDIEVAL_ROAD',
	'ROUTE_INDUSTRIAL_ROAD',
	'ROUTE_MODERN_ROAD'
);

DELETE FROM Route_ResourceCosts
WHERE RouteType IN (
	'ROUTE_ANCIENT_ROAD',
	'ROUTE_MEDIEVAL_ROAD',
	'ROUTE_INDUSTRIAL_ROAD',
	'ROUTE_MODERN_ROAD'
);

INSERT OR REPLACE INTO Route_ResourceCosts
	(RouteType, ResourceType, BuildWithUnitCost)
VALUES
	('ROUTE_ANCIENT_ROAD', 'RESOURCE_IRON', 1),
	('ROUTE_MEDIEVAL_ROAD', 'RESOURCE_IRON', 1),
	('ROUTE_INDUSTRIAL_ROAD', 'RESOURCE_IRON', 1),
	('ROUTE_MODERN_ROAD', 'RESOURCE_IRON', 1);

UPDATE Units
SET BaseMoves = 4,
	Description = 'LOC_UNIT_ZYL_LBM_MILITARY_ENGINEER_DESCRIPTION'
WHERE UnitType = 'UNIT_MILITARY_ENGINEER';

------------------------------------------------------------------------------
-- Geothermal Fissure improvements
------------------------------------------------------------------------------

-- Mining unlocks Mines globally, including on Geothermal Fissures. Listing
-- the feature as valid preserves the fissure and its Science yield.
INSERT OR REPLACE INTO Improvement_ValidFeatures
	(ImprovementType, FeatureType, PrereqTech, PrereqCivic)
VALUES
	('IMPROVEMENT_MINE', 'FEATURE_GEOTHERMAL_FISSURE', 'TECH_MINING', NULL);

------------------------------------------------------------------------------
-- Liang / The Surveyor
-- Ported from Better Balanced Game commit 7b3cddbe.
------------------------------------------------------------------------------

-- Shared plot requirements used by Liang's resource and disaster-terrain
-- promotions.
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_LIANG_FLOODPLAINS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY'),
	('ZYL_LBM_LIANG_VOLCANIC_SOIL_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY'),
	('ZYL_LBM_LIANG_VISIBLE_RESOURCE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_LIANG_FLOODPLAINS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_FLOODPLAINS'),
	('ZYL_LBM_LIANG_FLOODPLAINS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_GRASS_FLOODPLAINS'),
	('ZYL_LBM_LIANG_FLOODPLAINS_REQUIREMENTS', 'REQUIRES_PLOT_HAS_PLAINS_FLOODPLAINS'),
	('ZYL_LBM_LIANG_VOLCANIC_SOIL_REQUIREMENTS', 'PLOT_VOLCANIC_SOIL_REQUIREMENT'),
	('ZYL_LBM_LIANG_VISIBLE_RESOURCE_REQUIREMENTS', 'REQUIRES_PLOT_HAS_VISIBLE_RESOURCE');

-- Tier 1 left, Reinforced Materials: retain immunity to Environmental
-- Effects and add +1 Production on Floodplains and Volcanic Soil.
DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE';

UPDATE GovernorPromotions
SET Level = 1
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE';

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_LIANG_FLOODPLAINS_PRODUCTION', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_LIANG_FLOODPLAINS_REQUIREMENTS'),
	('ZYL_LBM_LIANG_VOLCANIC_SOIL_PRODUCTION', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_LIANG_VOLCANIC_SOIL_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_LIANG_FLOODPLAINS_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_LIANG_FLOODPLAINS_PRODUCTION', 'Amount', 1),
	('ZYL_LBM_LIANG_VOLCANIC_SOIL_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_LIANG_VOLCANIC_SOIL_PRODUCTION', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'ZYL_LBM_LIANG_FLOODPLAINS_PRODUCTION'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE', 'ZYL_LBM_LIANG_VOLCANIC_SOIL_PRODUCTION');

-- Remove Aquaculture and every prerequisite that points to it. BBG replaces
-- this promotion with Agriculture and moves Fisheries to the technology tree.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_AQUACULTURE';

DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_AQUACULTURE'
   OR PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_AQUACULTURE';

DELETE FROM GovernorPromotionSets
WHERE GovernorPromotion = 'GOVERNOR_PROMOTION_AQUACULTURE';

DELETE FROM GovernorPromotions
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_AQUACULTURE';

DELETE FROM Types
WHERE Type = 'GOVERNOR_PROMOTION_AQUACULTURE';

-- Tier 1 right, Agriculture: +1 Food on every revealed resource in the city.
INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE', 'KIND_GOVERNOR_PROMOTION');

INSERT OR IGNORE INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column)
VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE', 'LOC_GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE_NAME', 'LOC_GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE_DESCRIPTION', 1, 2);

INSERT OR IGNORE INTO GovernorPromotionSets (GovernorType, GovernorPromotion) VALUES
	('GOVERNOR_THE_BUILDER', 'GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE');

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE', 'GOVERNOR_PROMOTION_BUILDER_GUILDMASTER');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_LIANG_RESOURCE_FOOD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_LIANG_VISIBLE_RESOURCE_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_LIANG_RESOURCE_FOOD', 'YieldType', 'YIELD_FOOD'),
	('ZYL_LBM_LIANG_RESOURCE_FOOD', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE', 'ZYL_LBM_LIANG_RESOURCE_FOOD');

-- Tier 2 left, Parks and Recreation: unlock the reworked City Park after
-- Reinforced Materials.
DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_PARKS_RECREATION';

UPDATE GovernorPromotions
SET Level = 2,
	Column = 0
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_PARKS_RECREATION';

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_PARKS_RECREATION', 'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE');

UPDATE Improvement_YieldChanges
SET YieldChange = 2
WHERE ImprovementType = 'IMPROVEMENT_CITY_PARK'
  AND YieldType = 'YIELD_CULTURE';

INSERT OR IGNORE INTO Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) VALUES
	('IMPROVEMENT_CITY_PARK', 'YIELD_SCIENCE', 3);

UPDATE Improvement_YieldChanges
SET YieldChange = 3
WHERE ImprovementType = 'IMPROVEMENT_CITY_PARK'
  AND YieldType = 'YIELD_SCIENCE';

UPDATE Modifiers
SET SubjectRequirementSetId = NULL
WHERE ModifierId = 'CITY_PARK_WATER_AMENITY';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_CITY_PARK_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_CITY_PARK_HOUSING', 'Amount', 2);

INSERT OR IGNORE INTO ImprovementModifiers (ImprovementType, ModifierID) VALUES
	('IMPROVEMENT_CITY_PARK', 'ZYL_LBM_CITY_PARK_HOUSING');

DELETE FROM ImprovementModifiers
WHERE ModifierID = 'CITY_PARK_GOVERNOR_CULTURE';

DELETE FROM Improvement_ValidTerrains
WHERE ImprovementType = 'IMPROVEMENT_CITY_PARK'
  AND TerrainType IN (
	'TERRAIN_DESERT_HILLS',
	'TERRAIN_GRASS_HILLS',
	'TERRAIN_PLAINS_HILLS',
	'TERRAIN_SNOW_HILLS',
	'TERRAIN_TUNDRA_HILLS'
  );

UPDATE Improvements
SET OnePerCity = 1
WHERE ImprovementType = 'IMPROVEMENT_CITY_PARK';

-- Tier 2 right, Zoning Commissioner: replace +20% District Production with
-- +1 Production on every revealed resource in the city.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER';

DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER';

UPDATE GovernorPromotions
SET Level = 2,
	Column = 2
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER';

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_ZONING_COMMISSIONER', 'GOVERNOR_PROMOTION_ZYL_LBM_AGRICULTURE');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_LIANG_RESOURCE_PRODUCTION', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_LIANG_VISIBLE_RESOURCE_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_LIANG_RESOURCE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_LIANG_RESOURCE_PRODUCTION', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_ZONING_COMMISSIONER', 'ZYL_LBM_LIANG_RESOURCE_PRODUCTION');

-- Tier 3 center, Water Works: +1 Housing and +1 Amenity from every District
-- and Wonder in the city, after completing both tier-2 branches.
DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_WATER_WORKS';

DELETE FROM GovernorPromotionModifiers
WHERE ModifierId IN (
	'WATER_WORKS_NEIGHBORHOOD_HOUSING',
	'WATER_WORKS_CANAL_AMENITY',
	'WATER_WORKS_DAM_AMENITY'
);

UPDATE GovernorPromotions
SET Level = 3,
	Column = 1
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_WATER_WORKS';

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_WATER_WORKS', 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER'),
	('GOVERNOR_PROMOTION_WATER_WORKS', 'GOVERNOR_PROMOTION_PARKS_RECREATION');

UPDATE Modifiers
SET SubjectRequirementSetId = NULL
WHERE ModifierId = 'WATER_WORKS_AQUEDUCT_HOUSING';

UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'WATER_WORKS_AQUEDUCT_HOUSING'
  AND Name = 'Amount';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_LIANG_DISTRICT_AMENITY', 'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_AMENITY');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_LIANG_DISTRICT_AMENITY', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_WATER_WORKS', 'ZYL_LBM_LIANG_DISTRICT_AMENITY');

------------------------------------------------------------------------------
-- Fishery
------------------------------------------------------------------------------

-- Make Fisheries a general Builder improvement unlocked by Celestial
-- Navigation, raise Housing from 0.5 to 1, and remove Liang's production
-- modifier. Base +1 Food, sea-resource placement requirements, and
-- sea-resource adjacency Food are retained.
UPDATE Improvements
SET TraitType = NULL,
	PrereqTech = 'TECH_CELESTIAL_NAVIGATION',
	Housing = 2
WHERE ImprovementType = 'IMPROVEMENT_FISHERY';

-- Reefs become valid Fishery plots, but Fisheries still follow the
-- improvement's existing adjacent sea resource requirement.
INSERT OR IGNORE INTO Improvement_ValidFeatures
	(ImprovementType, FeatureType, PrereqTech, PrereqCivic)
VALUES
	('IMPROVEMENT_FISHERY', 'FEATURE_REEF', NULL, NULL);

DELETE FROM ImprovementModifiers
WHERE ImprovementType = 'IMPROVEMENT_FISHERY';

DELETE FROM ModifierArguments
WHERE ModifierId = 'AQUACULTURE_CAN_BUILD_FISHERY';

DELETE FROM Modifiers
WHERE ModifierId = 'AQUACULTURE_CAN_BUILD_FISHERY';

-- Shipyards provide +1 Production to every Fishery in their city.
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_PLOT_IS_FISHERY', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_PLOT_IS_FISHERY', 'ImprovementType', 'IMPROVEMENT_FISHERY');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_PLOT_IS_FISHERY_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_PLOT_IS_FISHERY_REQUIREMENTS', 'ZYL_LBM_REQUIRES_PLOT_IS_FISHERY');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_SHIPYARD_FISHERY_PRODUCTION', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'ZYL_LBM_PLOT_IS_FISHERY_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_SHIPYARD_FISHERY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_SHIPYARD_FISHERY_PRODUCTION', 'Amount', 1);

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId) VALUES
	('BUILDING_SHIPYARD', 'ZYL_LBM_SHIPYARD_FISHERY_PRODUCTION');

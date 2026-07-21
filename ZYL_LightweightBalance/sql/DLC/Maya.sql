------------------------------------------------------------------------------
-- FILE:    DLC/Maya.sql
-- PURPOSE: Maya civilization balance changes.
------------------------------------------------------------------------------

-- Make the Expansion 2 valid-terrain modifier available to Expansion 1
-- rulesets as well. The current game engine exposes the underlying effect.
INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 'KIND_MODIFIER');

INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
	('MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 'COLLECTION_PLAYER_CITIES', 'EFFECT_ADJUST_IMPROVEMENT_VALID_TERRAIN');

-- Ix Mutal Ajaw: expand the complete near-capital boundary from 6 to 8
-- tiles. The far-city penalty begins immediately outside it, at 9 tiles.
UPDATE RequirementArguments
SET Value = 8
WHERE RequirementId IN (
	'REQUIRES_OBJECT_6_TILES_FROM_CAPITAL_NOT_CAPITAL',
	'REQUIRES_OBJECT_6_TILES_FROM_CAPITAL'
  )
  AND Name = 'MaxDistance';

UPDATE RequirementArguments
SET Value = 9
WHERE RequirementId = 'REQUIRES_OBJECT_7_OR_MORE_TILES_FROM_CAPITAL'
  AND Name = 'MinDistance';

-- Remove the previous capital-only +2 Housing implementation when upgrading
-- or hot-reloading from version 0.6.3.
DELETE FROM TraitModifiers
WHERE ModifierId = 'ZYL_LBM_MAYA_PALACE_HOUSING';

DELETE FROM ModifierArguments
WHERE ModifierId = 'ZYL_LBM_MAYA_PALACE_HOUSING';

DELETE FROM Modifiers
WHERE ModifierId = 'ZYL_LBM_MAYA_PALACE_HOUSING';

DELETE FROM RequirementSetRequirements
WHERE RequirementSetId = 'ZYL_LBM_MAYA_CITY_HAS_PALACE_REQUIREMENTS'
   OR RequirementId = 'ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE';

DELETE FROM RequirementArguments
WHERE RequirementId = 'ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE';

DELETE FROM Requirements
WHERE RequirementId = 'ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE';

DELETE FROM RequirementSets
WHERE RequirementSetId = 'ZYL_LBM_MAYA_CITY_HAS_PALACE_REQUIREMENTS';

-- Mayab: every Maya city gains +1 Housing. The Palace already provides +1
-- Housing in the base game, so a further +1 in the capital makes its total
-- Palace contribution +2 and produces 5 starting Housing versus 3 in other
-- Maya cities.
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_MAYA_CITY_HAS_PALACE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE', 'REQUIREMENT_CITY_HAS_BUILDING');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE', 'BuildingType', 'BUILDING_PALACE');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_MAYA_CITY_HAS_PALACE_REQUIREMENTS', 'ZYL_LBM_REQUIRES_MAYA_CITY_HAS_PALACE');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_MAYA_ALL_CITIES_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_MAYA_PALACE_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING', 'ZYL_LBM_MAYA_CITY_HAS_PALACE_REQUIREMENTS'),
	('ZYL_LBM_MAYA_GRASS_HILLS_FARMS', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', NULL),
	('ZYL_LBM_MAYA_PLAINS_HILLS_FARMS', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', NULL);

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_MAYA_ALL_CITIES_HOUSING', 'Amount', 1),
	('ZYL_LBM_MAYA_PALACE_HOUSING', 'Amount', 1),
	('ZYL_LBM_MAYA_GRASS_HILLS_FARMS', 'ImprovementType', 'IMPROVEMENT_FARM'),
	('ZYL_LBM_MAYA_GRASS_HILLS_FARMS', 'TerrainType', 'TERRAIN_GRASS_HILLS'),
	('ZYL_LBM_MAYA_PLAINS_HILLS_FARMS', 'ImprovementType', 'IMPROVEMENT_FARM'),
	('ZYL_LBM_MAYA_PLAINS_HILLS_FARMS', 'TerrainType', 'TERRAIN_PLAINS_HILLS');

INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES
	('TRAIT_CIVILIZATION_MAYAB', 'ZYL_LBM_MAYA_ALL_CITIES_HOUSING'),
	('TRAIT_CIVILIZATION_MAYAB', 'ZYL_LBM_MAYA_PALACE_HOUSING'),
	('TRAIT_CIVILIZATION_MAYAB', 'ZYL_LBM_MAYA_GRASS_HILLS_FARMS'),
	('TRAIT_CIVILIZATION_MAYAB', 'ZYL_LBM_MAYA_PLAINS_HILLS_FARMS');

------------------------------------------------------------------------------
-- FILE:    DLC/Indonesia.sql
-- PURPOSE: Indonesia civilization balance changes.
------------------------------------------------------------------------------

-- Great Nusantara: Coast and Lake tiles provide a standard adjacency bonus
-- to Holy Sites. Campuses, Industrial Zones, and Theater Squares retain their
-- vanilla minor adjacency bonus.
UPDATE ModifierArguments
SET Value = '1'
WHERE ModifierId = 'TRAIT_NUSANTARA_COAST_HOLY_SITE'
  AND Name = 'TilesRequired';

-- Kampung: shift its base yield to Food while keeping its base Housing.
UPDATE Improvements
SET PrereqTech = 'TECH_CELESTIAL_NAVIGATION'
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

-- Reefs become valid Kampung plots, but the existing adjacent sea resource
-- requirement is retained.
INSERT OR IGNORE INTO Improvement_ValidFeatures
	(ImprovementType, FeatureType, PrereqTech, PrereqCivic)
VALUES
	('IMPROVEMENT_KAMPUNG', 'FEATURE_REEF', NULL, NULL);

DELETE FROM Improvement_YieldChanges
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG'
  AND YieldType = 'YIELD_PRODUCTION';

INSERT OR IGNORE INTO Improvement_YieldChanges
	(ImprovementType, YieldType, YieldChange)
VALUES
	('IMPROVEMENT_KAMPUNG', 'YIELD_FOOD', 1),
	('IMPROVEMENT_KAMPUNG', 'YIELD_FAITH', 0);

UPDATE Improvement_YieldChanges
SET YieldChange = 1
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG'
  AND YieldType = 'YIELD_FOOD';

-- The original Fishing Boat adjacency becomes Production. Add an equivalent
-- Faith adjacency, so every adjacent Fishing Boat grants both yields.
UPDATE Adjacency_YieldChanges
SET YieldType = 'YIELD_PRODUCTION',
	YieldChange = 1,
	TilesRequired = 1
WHERE ID = 'Kampung_FoodFishingBoats';

INSERT OR IGNORE INTO Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement)
VALUES
	('ZYL_LBM_KAMPUNG_FISHING_BOATS_FAITH',
	 'LOC_IMPROVEMENT_ZYL_LBM_KAMPUNG_FISHING_BOATS_FAITH',
	 'YIELD_FAITH', 1, 1, 'IMPROVEMENT_FISHING_BOATS');

INSERT OR IGNORE INTO Improvement_Adjacencies
	(ImprovementType, YieldChangeId)
VALUES
	('IMPROVEMENT_KAMPUNG', 'ZYL_LBM_KAMPUNG_FISHING_BOATS_FAITH');

-- Keep the original Mass Production Housing bonus. Civil Engineering instead
-- grants +1 Food, and Flight tourism follows the improvement's Production.
UPDATE Improvement_BonusYieldChanges
SET YieldType = 'YIELD_FOOD',
	BonusYieldChange = 1
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG'
  AND PrereqCivic = 'CIVIC_CIVIL_ENGINEERING';

UPDATE Improvement_Tourism
SET TourismSource = 'TOURISMSOURCE_PRODUCTION'
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG';

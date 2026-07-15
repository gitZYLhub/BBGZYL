------------------------------------------------------------------------------
-- FILE:    XP2/SecretSocieties.sql
-- PURPOSE: Secret Societies support for the current mod version.
--
-- Scope:
--   1. Make Medieval-and-later Secret Society titles effectively free.
--   2. Move tier 3 to Renaissance and tier 4 to Industrial.
--   3. Lightly improve Hermetic Order Ley Line play.
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Promotion timing
------------------------------------------------------------------------------

-- Society tier 3 moves to the Renaissance era; tier 4 moves to Industrial.
UPDATE GovernorPromotionConditions
SET EarliestGameEra = 'ERA_RENAISSANCE'
WHERE GovernorPromotionType IN (
	'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_3',
	'GOVERNOR_PROMOTION_HERMETIC_ORDER_3',
	'GOVERNOR_PROMOTION_VOIDSINGERS_3',
	'GOVERNOR_PROMOTION_SANGUINE_PACT_3'
);

UPDATE GovernorPromotionConditions
SET EarliestGameEra = 'ERA_INDUSTRIAL'
WHERE GovernorPromotionType IN (
	'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_4',
	'GOVERNOR_PROMOTION_HERMETIC_ORDER_4',
	'GOVERNOR_PROMOTION_VOIDSINGERS_4',
	'GOVERNOR_PROMOTION_SANGUINE_PACT_4'
);

------------------------------------------------------------------------------
-- Secret Society buildings and Ley Lines
------------------------------------------------------------------------------

-- Gilded Vault and Alchemical Society are already unlocked by their society
-- tier 2 promotions. Remove the extra technology/purchase gates.
UPDATE Buildings
SET PrereqTech = NULL,
	PurchaseYield = NULL
WHERE BuildingType IN ('BUILDING_GILDED_VAULT', 'BUILDING_ALCHEMICAL_SOCIETY');

-- Ley Lines: +1 Science and +2 Production on the resource itself.
INSERT OR IGNORE INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange) VALUES
	('RESOURCE_LEY_LINE', 'YIELD_SCIENCE', 0),
	('RESOURCE_LEY_LINE', 'YIELD_PRODUCTION', 0);

UPDATE Resource_YieldChanges
SET YieldChange = 1
WHERE ResourceType = 'RESOURCE_LEY_LINE'
  AND YieldType = 'YIELD_SCIENCE'
  AND YieldChange < 1;

UPDATE Resource_YieldChanges
SET YieldChange = 2
WHERE ResourceType = 'RESOURCE_LEY_LINE'
  AND YieldType = 'YIELD_PRODUCTION'
  AND YieldChange < 2;

-- Ley Line frequency and terrain distribution copied from Team PVP Balanced mod
-- Secret Societies 3.93.
UPDATE Resources
SET Frequency = 10
WHERE ResourceType = 'RESOURCE_LEY_LINE';

DELETE FROM Resource_ValidTerrains
WHERE ResourceType = 'RESOURCE_LEY_LINE'
  AND TerrainType IN (
	'TERRAIN_TUNDRA',
	'TERRAIN_SNOW',
	'TERRAIN_TUNDRA_HILLS',
	'TERRAIN_SNOW_HILLS',
	'TERRAIN_DESERT_HILLS',
	'TERRAIN_DESERT',
	'TERRAIN_GRASS_HILLS',
	'TERRAIN_PLAINS_HILLS'
  );

-- Seowons are Campus replacements but do not inherit Campus adjacency rows.
-- Keep them aligned with normal Campuses for Ley Line Science adjacency.
INSERT OR IGNORE INTO District_Adjacencies (DistrictType, YieldChangeId)
VALUES ('DISTRICT_SEOWON', 'LeyLine_Science');

-- Great People and Ley Lines: Admirals grant Food, Generals grant Production,
-- and Merchants grant +2 Gold.
UPDATE ModifierArguments
SET Value = 'YIELD_FOOD'
WHERE ModifierId = 'HERMETIC_ORDER_GREAT_ADMIRAL_LEY_LINE_SCIENCE'
  AND Name = 'YieldType';

UPDATE ModifierArguments
SET Value = 'YIELD_PRODUCTION'
WHERE ModifierId = 'HERMETIC_ORDER_GREAT_GENERAL_LEY_LINE_SCIENCE'
  AND Name = 'YieldType';

UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'HERMETIC_ORDER_GREAT_MERCHANT_LEY_LINE_GOLD'
  AND Name = 'Amount';

------------------------------------------------------------------------------
-- Free society titles
------------------------------------------------------------------------------

-- Secret Societies: choosing later society promotions refunds one Governor
-- Title, making those society titles effectively free.
--
-- The initial _1 promotion is intentionally excluded. The design request was
-- "from the Medieval era onward", which corresponds to the later society tiers.
INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
	SELECT GovernorPromotionType, 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'
	FROM GovernorPromotions
	WHERE GovernorPromotionType IN (
		'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_2',
		'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_3',
		'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_4',
		'GOVERNOR_PROMOTION_HERMETIC_ORDER_2',
		'GOVERNOR_PROMOTION_HERMETIC_ORDER_3',
		'GOVERNOR_PROMOTION_HERMETIC_ORDER_4',
		'GOVERNOR_PROMOTION_VOIDSINGERS_2',
		'GOVERNOR_PROMOTION_VOIDSINGERS_3',
		'GOVERNOR_PROMOTION_VOIDSINGERS_4',
		'GOVERNOR_PROMOTION_SANGUINE_PACT_2',
		'GOVERNOR_PROMOTION_SANGUINE_PACT_3',
		'GOVERNOR_PROMOTION_SANGUINE_PACT_4'
	)
	  AND EXISTS (
		SELECT 1
		FROM Modifiers
		WHERE ModifierId = 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'
	  );

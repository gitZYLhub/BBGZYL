------------------------------------------------------------------------------
-- FILE:    XP2/SecretSocieties.sql
-- PURPOSE: Secret Societies support for the current mod version.
--
-- Scope:
--   1. Make Medieval-and-later Secret Society titles effectively free.
--   2. Move tier 3 to Renaissance and tier 4 to Industrial.
--   3. Lightly improve Hermetic Order Ley Line play.
--   4. Make each society nearly guaranteed from its original discovery source.
------------------------------------------------------------------------------

------------------------------------------------------------------------------
-- Discovery chances
------------------------------------------------------------------------------

-- Preserve each society's original discovery condition while raising its
-- corresponding base chance high enough to make successful contact
-- effectively guaranteed during normal play.
UPDATE SecretSocieties
SET DiscoverAtCityStateBaseChance = 100000
WHERE SecretSocietyType = 'SECRETSOCIETY_OWLS_OF_MINERVA';

UPDATE SecretSocieties
SET DiscoverAtNaturalWonderBaseChance = 100000
WHERE SecretSocietyType = 'SECRETSOCIETY_HERMETIC_ORDER';

UPDATE SecretSocieties
SET DiscoverAtGoodyHutBaseChance = 100000
WHERE SecretSocietyType = 'SECRETSOCIETY_VOIDSINGERS';

UPDATE SecretSocieties
SET DiscoverAtBarbarianCampBaseChance = 100000
WHERE SecretSocietyType = 'SECRETSOCIETY_SANGUINE_PACT';

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

-- Alchemical Society: replace the flat +2 Production with +1 Science, raising
-- its base yield from 4 to 5 Science. It also mirrors the Campus Science
-- adjacency bonus into Production while retaining the base-game Gold mirror.
INSERT OR IGNORE INTO Building_YieldChanges (BuildingType, YieldType, YieldChange)
	SELECT 'BUILDING_ALCHEMICAL_SOCIETY', 'YIELD_SCIENCE', 5
	WHERE EXISTS (
		SELECT 1 FROM Buildings
		WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY'
	);

UPDATE Building_YieldChanges
SET YieldChange = 5
WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY'
  AND YieldType = 'YIELD_SCIENCE';

DELETE FROM Building_YieldChanges
WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY'
  AND YieldType = 'YIELD_PRODUCTION';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT
		'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE',
		'MODIFIER_PLAYER_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS'
	WHERE EXISTS (
		SELECT 1 FROM Buildings
		WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY'
	);

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT
		'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE',
		'YieldTypeToGrant',
		'YIELD_PRODUCTION'
	WHERE EXISTS (
		SELECT 1 FROM Modifiers
		WHERE ModifierId = 'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE'
	)
	UNION ALL
	SELECT
		'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE',
		'YieldTypeToMirror',
		'YIELD_SCIENCE'
	WHERE EXISTS (
		SELECT 1 FROM Modifiers
		WHERE ModifierId = 'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE'
	);

INSERT OR IGNORE INTO BuildingModifiers (BuildingType, ModifierId)
	SELECT
		'BUILDING_ALCHEMICAL_SOCIETY',
		'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE'
	WHERE EXISTS (
		SELECT 1 FROM Buildings
		WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY'
	)
	  AND EXISTS (
		SELECT 1 FROM Modifiers
		WHERE ModifierId = 'ZYL_LBM_ALCHEMICAL_SOCIETY_PRODUCTION_MIRRORS_SCIENCE'
	);

-- Ley Lines: +1 Science and +2 Production on the resource itself. The guards
-- keep this file safe if another setup removes the game-mode resource.
INSERT OR IGNORE INTO Resource_YieldChanges (ResourceType, YieldType, YieldChange)
	SELECT 'RESOURCE_LEY_LINE', 'YIELD_SCIENCE', 0
	WHERE EXISTS (
		SELECT 1 FROM Resources WHERE ResourceType = 'RESOURCE_LEY_LINE'
	)
	UNION ALL
	SELECT 'RESOURCE_LEY_LINE', 'YIELD_PRODUCTION', 0
	WHERE EXISTS (
		SELECT 1 FROM Resources WHERE ResourceType = 'RESOURCE_LEY_LINE'
	);

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

-- Revealing Ley Lines through the Hermetic Order also makes them immediately
-- harvestable by Builders for the same base Gold amount as Copper. Ley Lines
-- retain normal resource behavior when a city is founded on their tile.
INSERT OR REPLACE INTO Resource_Harvests
	(ResourceType, YieldType, Amount, PrereqTech)
	SELECT 'RESOURCE_LEY_LINE', 'YIELD_GOLD', 40, NULL
	WHERE EXISTS (
		SELECT 1 FROM Resources WHERE ResourceType = 'RESOURCE_LEY_LINE'
	);

-- Raise Ley Line map frequency by 20%: vanilla uses 10, this mod uses 12.
-- Use a fixed value so repeated loads or other database passes cannot compound
-- the increase.
UPDATE Resources
SET Frequency = 12
WHERE ResourceType = 'RESOURCE_LEY_LINE';

-- Ley Line terrain distribution copied from Team PVP Balanced mod Secret
-- Societies 3.93.
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
	SELECT 'DISTRICT_SEOWON', 'LeyLine_Science'
	WHERE EXISTS (
		SELECT 1 FROM Districts WHERE DistrictType = 'DISTRICT_SEOWON'
	)
	  AND EXISTS (
		SELECT 1 FROM Adjacency_YieldChanges WHERE ID = 'LeyLine_Science'
	  );

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

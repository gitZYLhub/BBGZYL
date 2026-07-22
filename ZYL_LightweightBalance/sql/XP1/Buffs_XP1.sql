------------------------------------------------------------------------------
-- FILE:    XP1/Buffs_XP1.sql
-- PURPOSE: Changes for Rise and Fall / Gathering Storm content.
------------------------------------------------------------------------------

-- Pen, Brush, and Voice / "百花齐放": +2 Culture, +1 Production,
-- and +2 Gold per district in Golden or Heroic Ages.
UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE'
  AND Name = 'Amount'
  AND CAST(Value AS INTEGER) < 2;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 'PLAYER_HAS_GOLDEN_AGE'),
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 'PLAYER_HAS_GOLDEN_AGE');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_PRODUCTION', 'Amount', 1),
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_GOLD', 'YieldType', 'YIELD_GOLD'),
	('ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_GOLD', 'Amount', 2);

INSERT OR IGNORE INTO CommemorationModifiers (CommemorationType, ModifierId) VALUES
	('COMMEMORATION_CULTURAL', 'ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_PRODUCTION'),
	('COMMEMORATION_CULTURAL', 'ZYL_LBM_COMMEMORATION_CULTURAL_DISTRICT_GOLD');

------------------------------------------------------------------------------
-- Georgia's Tsikhe retains twice the Outer Defense of its standard wall tier:
-- 100 instead of the Renaissance Walls' new 50.
UPDATE Buildings
SET OuterDefenseHitPoints = 100,
	Description = 'LOC_BUILDING_ZYL_LBM_TSIKHE_DESCRIPTION'
WHERE BuildingType = 'BUILDING_TSIKHE';

------------------------------------------------------------------------------
-- Governor establishment times
------------------------------------------------------------------------------

-- Every regular Governor establishes in 3 turns; Secret Society
-- pseudo-Governors are excluded.
UPDATE Governors
SET TransitionStrength = 150
WHERE GovernorType IN (
	'GOVERNOR_THE_EDUCATOR',
	'GOVERNOR_THE_RESOURCE_MANAGER',
	'GOVERNOR_THE_BUILDER',
	'GOVERNOR_THE_MERCHANT',
	'GOVERNOR_THE_DEFENDER',
	'GOVERNOR_THE_AMBASSADOR',
	'GOVERNOR_THE_CARDINAL',
	'GOVERNOR_IBRAHIM'
);

------------------------------------------------------------------------------
-- Magnus / The Steward
-- Custom lightweight redesign using BBG's production modifier patterns.
------------------------------------------------------------------------------

-- Surplus Logistics: retain +20% Growth and +2 Food for Trade Routes ending
-- in the city, add +1 Production, and merge Provision's no-population-cost
-- Settler effect into this promotion.
UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'SURPLUS_LOGISTICS_TRADE_ROUTE_FOOD'
  AND Name = 'Amount';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION', 'Amount', 1),
	('ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION', 'Domestic', 1),
	('ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION');

DELETE FROM GovernorPromotionModifiers
WHERE ModifierId IN (
	'SURPLUS_LOGISTICS_EXTRA_GROWTH',
	'SURPLUS_LOGISTICS_TRADE_ROUTE_FOOD',
	'EXPEDITION_ADJUST_SETTLERS_CONSUME_POPULATION',
	'ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION'
);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
	SELECT 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS', ModifierId
	FROM Modifiers
	WHERE ModifierId IN (
		'SURPLUS_LOGISTICS_EXTRA_GROWTH',
		'SURPLUS_LOGISTICS_TRADE_ROUTE_FOOD',
		'EXPEDITION_ADJUST_SETTLERS_CONSUME_POPULATION',
		'ZYL_LBM_MAGNUS_TRADE_ROUTE_PRODUCTION'
	);

-- Provision: replace the Settler effect with +20% Production toward units,
-- districts, and non-Wonder buildings in the established city.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_MAGNUS_UNIT_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_MODIFIER'),
	('ZYL_LBM_MAGNUS_BUILDING_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('ZYL_LBM_MAGNUS_DISTRICT_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_MAGNUS_UNIT_PRODUCTION', 'Amount', 20),
	('ZYL_LBM_MAGNUS_BUILDING_PRODUCTION', 'Amount', 20),
	('ZYL_LBM_MAGNUS_BUILDING_PRODUCTION', 'IsWonder', 0),
	('ZYL_LBM_MAGNUS_DISTRICT_PRODUCTION', 'Amount', 20);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'ZYL_LBM_MAGNUS_UNIT_PRODUCTION'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'ZYL_LBM_MAGNUS_BUILDING_PRODUCTION'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 'ZYL_LBM_MAGNUS_DISTRICT_PRODUCTION');

-- Industrialist: replace its original effect with BBG's right-tier-two
-- building package. Power Plant modifiers are attached only when supplied by
-- Gathering Storm; Rise and Fall retains the Workshop and Factory bonuses.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_MAGNUS_WORKSHOP_PRODUCTION', 'MODIFIER_BUILDING_YIELD_CHANGE'),
	('ZYL_LBM_MAGNUS_FACTORY_PRODUCTION', 'MODIFIER_BUILDING_YIELD_CHANGE');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_MAGNUS_WORKSHOP_PRODUCTION', 'BuildingType', 'BUILDING_WORKSHOP'),
	('ZYL_LBM_MAGNUS_WORKSHOP_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_MAGNUS_WORKSHOP_PRODUCTION', 'Amount', 2),
	('ZYL_LBM_MAGNUS_FACTORY_PRODUCTION', 'BuildingType', 'BUILDING_FACTORY'),
	('ZYL_LBM_MAGNUS_FACTORY_PRODUCTION', 'YieldType', 'YIELD_PRODUCTION'),
	('ZYL_LBM_MAGNUS_FACTORY_PRODUCTION', 'Amount', 4);

UPDATE ModifierArguments
SET Value = '7'
WHERE ModifierId IN (
	'INDUSTRIALIST_COAL_POWER_PLANT_PRODUCTION',
	'INDUSTRIALIST_OIL_POWER_PLANT_PRODUCTION',
	'INDUSTRIALIST_NUCLEAR_POWER_PLANT_PRODUCTION'
)
  AND Name = 'Amount';

UPDATE ModifierArguments
SET Value = '4'
WHERE ModifierId = 'INDUSTRIALIST_RESOURCE_POWER_PROVIDED'
  AND Name = 'Amount';

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST', 'ZYL_LBM_MAGNUS_WORKSHOP_PRODUCTION'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST', 'ZYL_LBM_MAGNUS_FACTORY_PRODUCTION');

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
	SELECT 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST', ModifierId
	FROM Modifiers
	WHERE ModifierId IN (
		'INDUSTRIALIST_COAL_POWER_PLANT_PRODUCTION',
		'INDUSTRIALIST_OIL_POWER_PLANT_PRODUCTION',
		'INDUSTRIALIST_NUCLEAR_POWER_PLANT_PRODUCTION',
		'INDUSTRIALIST_RESOURCE_POWER_PROVIDED'
	);

------------------------------------------------------------------------------
-- Victor / The Castellan
-- Ported from Better Balanced Game commit 7b3cddbe.
------------------------------------------------------------------------------

-- Redoubt: retain +5 city defense and 3-turn establishment; raise the
-- governor's Loyalty pressure from 8 to 14.
UPDATE Governors
SET IdentityPressure = 14
WHERE GovernorType = 'GOVERNOR_THE_DEFENDER';

-- Garrison Commander: defending units receive +3 Combat Strength. The
-- existing +4 Loyalty to other domestic cities within 9 tiles is retained.
UPDATE ModifierArguments
SET Value = '3'
WHERE ModifierId = 'GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS'
  AND Name = 'Amount';

-- Defense Logistics: replace siege immunity and strategic-resource
-- accumulation with +25% Production toward military units.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_VICTOR_UNIT_PRODUCTION', 'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_MODIFIER');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_VICTOR_UNIT_PRODUCTION', 'Amount', 25);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_DEFENSE_LOGISTICS', 'ZYL_LBM_VICTOR_UNIT_PRODUCTION');

-- Embrasure: move to the left branch after Garrison Commander, retain the
-- extra city attack, remove the free unit promotion, and add siege immunity.
DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_EMBRASURE';

UPDATE GovernorPromotions
SET Column = 0
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_EMBRASURE';

DELETE FROM GovernorPromotionModifiers
WHERE ModifierId = 'CITY_DEFENDER_FREE_PROMOTIONS';

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_EMBRASURE', 'DEFENSE_LOGISTICS_SIEGE_PROTECTION');

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_EMBRASURE', 'GOVERNOR_PROMOTION_GARRISON_COMMANDER');

-- Arms Race Proponent: move to tier 2 after Defense Logistics. Retain the
-- base-game nuclear-project bonus, add a free promotion, and remove strategic
-- resource costs from units trained in the city.
UPDATE GovernorPromotionPrereqs
SET PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS'
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';

UPDATE GovernorPromotions
SET Level = 2
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';

UPDATE ModifierArguments
SET Value = '100'
WHERE ModifierId = 'BLACK_MARKETEER_STRATEGIC_RESOURCE_COST_DISCOUNT'
  AND Name = 'Amount';

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT', 'CITY_DEFENDER_FREE_PROMOTIONS'),
	('GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT', 'BLACK_MARKETEER_STRATEGIC_RESOURCE_COST_DISCOUNT');

-- Air Defense Initiative: make it the shared capstone after both tier-2
-- branches. Its existing +25 anti-air Combat Strength effect is retained.
DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE';

UPDATE GovernorPromotions
SET Column = 1
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE';

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE', 'GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT'),
	('GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE', 'GOVERNOR_PROMOTION_EMBRASURE');

------------------------------------------------------------------------------
-- Reyna / The Financier
-- Ported from Better Balanced Game commit 7b3cddbe.
------------------------------------------------------------------------------

-- Replace Renewable Subsidizer with Foreign Exchange.
DELETE FROM GovernorPromotionModifiers
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY';

DELETE FROM GovernorPromotionPrereqs
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY'
   OR PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY';

DELETE FROM GovernorPromotionSets
WHERE GovernorPromotion = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY';

DELETE FROM GovernorPromotions
WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY';

-- Land Acquisition: retain faster border growth and increase Gold from each
-- foreign Trade Route passing through the city from 3 to 4.
UPDATE ModifierArguments
SET Value = '4'
WHERE ModifierId = 'FOREIGN_EXCHANGE_GOLD_FROM_FOREIGN_TRADE_PASSING_THROUGH'
  AND Name = 'Amount';

-- Harbormaster: retain doubled Commercial Hub and Harbor adjacency. Add +1
-- Trade Route capacity if the established city has both a Market and a
-- Lighthouse.
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_REQUIREMENTS', 'REQUIRES_CITY_HAS_LIGHTHOUSE'),
	('ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_REQUIREMENTS', 'REQUIRES_CITY_HAS_MARKET');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
	('ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_TRADE_ROUTE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY', 'ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_TRADE_ROUTE', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER', 'ZYL_LBM_REYNA_MARKET_LIGHTHOUSE_TRADE_ROUTE');

-- Forestry Management: retain +1 Appeal around unimproved features. Expand
-- the +2 Gold modifier to affect either unimproved-feature tiles or
-- Breathtaking tiles.
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_PLOT_HAS_UNIMPROVED_FEATURE', 'REQUIREMENT_REQUIREMENTSET_IS_MET');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_PLOT_HAS_UNIMPROVED_FEATURE', 'RequirementSetId', 'PLOT_HAS_ANY_FEATURE_NO_IMPROVEMENTS');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_REYNA_UNIMPROVED_FEATURE_OR_BREATHTAKING', 'REQUIREMENTSET_TEST_ANY');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_REYNA_UNIMPROVED_FEATURE_OR_BREATHTAKING', 'ZYL_LBM_REQUIRES_PLOT_HAS_UNIMPROVED_FEATURE'),
	('ZYL_LBM_REYNA_UNIMPROVED_FEATURE_OR_BREATHTAKING', 'REQUIRES_PLOT_BREATHTAKING_APPEAL');

UPDATE Modifiers
SET SubjectRequirementSetId = 'ZYL_LBM_REYNA_UNIMPROVED_FEATURE_OR_BREATHTAKING'
WHERE ModifierId = 'FORESTRY_MANAGEMENT_FEATURE_NO_IMPROVEMENT_GOLD';

-- Tax Collector: retain +2 Gold per Citizen and add +1 Trade Route capacity.
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_REYNA_TAX_COLLECTOR_TRADE_ROUTE', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_REYNA_TAX_COLLECTOR_TRADE_ROUTE', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR', 'ZYL_LBM_REYNA_TAX_COLLECTOR_TRADE_ROUTE');

-- Contractor: retain Gold purchases of Districts. Add a 50% Gold discount
-- for all Buildings and every Support-class unit available in the database.
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_REYNA_BUILDING_GOLD_DISCOUNT', 'MODIFIER_SINGLE_CITY_ADJUST_ALL_BUILDINGS_PURCHASE_COST');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType)
	SELECT 'ZYL_LBM_REYNA_' || UnitType || '_GOLD_DISCOUNT',
		   'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST'
	FROM Units
	WHERE FormationClass = 'FORMATION_CLASS_SUPPORT';

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_REYNA_BUILDING_GOLD_DISCOUNT', 'Amount', 50);

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'ZYL_LBM_REYNA_' || UnitType || '_GOLD_DISCOUNT', 'UnitType', UnitType
	FROM Units
	WHERE FormationClass = 'FORMATION_CLASS_SUPPORT';

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value)
	SELECT 'ZYL_LBM_REYNA_' || UnitType || '_GOLD_DISCOUNT', 'Amount', 50
	FROM Units
	WHERE FormationClass = 'FORMATION_CLASS_SUPPORT';

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR', 'ZYL_LBM_REYNA_BUILDING_GOLD_DISCOUNT');

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId)
	SELECT 'GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',
		   'ZYL_LBM_REYNA_' || UnitType || '_GOLD_DISCOUNT'
	FROM Units
	WHERE FormationClass = 'FORMATION_CLASS_SUPPORT';

-- Foreign Exchange: replace Renewable Subsidizer as the tier-3 right branch.
-- Each foreign Trade Route passing through provides +1 Science and +1
-- Culture, increasing to +2 each after researching Economics.
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES
	('ZYL_LBM_REQUIRES_PLAYER_HAS_ECONOMICS', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');

INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
	('ZYL_LBM_REQUIRES_PLAYER_HAS_ECONOMICS', 'TechnologyType', 'TECH_ECONOMICS');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
	('ZYL_LBM_PLAYER_HAS_ECONOMICS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
	('ZYL_LBM_PLAYER_HAS_ECONOMICS_REQUIREMENTS', 'ZYL_LBM_REQUIRES_PLAYER_HAS_ECONOMICS');

INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'KIND_GOVERNOR_PROMOTION');

INSERT OR IGNORE INTO GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column)
VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'LOC_GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE_NAME', 'LOC_GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE_DESCRIPTION', 3, 2);

INSERT OR IGNORE INTO GovernorPromotionSets (GovernorType, GovernorPromotion) VALUES
	('GOVERNOR_THE_MERCHANT', 'GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE');

INSERT OR IGNORE INTO GovernorPromotionPrereqs (GovernorPromotionType, PrereqGovernorPromotion) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_BASE', 'MODIFIER_CITY_ADJUST_YIELD_FROM_FOREIGN_TRADE_ROUTES_PASSING_THROUGH'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_BASE', 'MODIFIER_CITY_ADJUST_YIELD_FROM_FOREIGN_TRADE_ROUTES_PASSING_THROUGH');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_ECONOMICS', 'MODIFIER_CITY_ADJUST_YIELD_FROM_FOREIGN_TRADE_ROUTES_PASSING_THROUGH', 'ZYL_LBM_PLAYER_HAS_ECONOMICS_REQUIREMENTS'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_ECONOMICS', 'MODIFIER_CITY_ADJUST_YIELD_FROM_FOREIGN_TRADE_ROUTES_PASSING_THROUGH', 'ZYL_LBM_PLAYER_HAS_ECONOMICS_REQUIREMENTS');

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_BASE', 'YieldType', 'YIELD_SCIENCE'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_BASE', 'Amount', 1),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_BASE', 'YieldType', 'YIELD_CULTURE'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_BASE', 'Amount', 1),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_ECONOMICS', 'YieldType', 'YIELD_SCIENCE'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_ECONOMICS', 'Amount', 1),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_ECONOMICS', 'YieldType', 'YIELD_CULTURE'),
	('ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_ECONOMICS', 'Amount', 1);

INSERT OR IGNORE INTO GovernorPromotionModifiers (GovernorPromotionType, ModifierId) VALUES
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_BASE'),
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_BASE'),
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'ZYL_LBM_REYNA_FOREIGN_TRADE_SCIENCE_ECONOMICS'),
	('GOVERNOR_PROMOTION_ZYL_LBM_FOREIGN_EXCHANGE', 'ZYL_LBM_REYNA_FOREIGN_TRADE_CULTURE_ECONOMICS');

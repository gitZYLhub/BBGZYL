------------------------------------------------------------------------------
-- FILE:    Core.sql
-- PURPOSE: Shared helper definitions for ZYL's Lightweight Balance Mod.
--
-- Keep this file small. Put actual balance changes into the Base, XP1, or XP2
-- files so they are easy to review and toggle.
------------------------------------------------------------------------------

-- The Expansion rulesets define a per-population city-yield modifier, but the
-- standard ruleset does not register that ModifierType. Define a namespaced
-- equivalent so Base/Buffs.sql works in every supported ruleset.
INSERT OR IGNORE INTO Types (Type, Kind) VALUES
	('MODIFIER_ZYL_LBM_SINGLE_CITY_ADJUST_YIELD_PER_POPULATION', 'KIND_MODIFIER');

INSERT OR IGNORE INTO DynamicModifiers (ModifierType, CollectionType, EffectType) VALUES
	('MODIFIER_ZYL_LBM_SINGLE_CITY_ADJUST_YIELD_PER_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION');

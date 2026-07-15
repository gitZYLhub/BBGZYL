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

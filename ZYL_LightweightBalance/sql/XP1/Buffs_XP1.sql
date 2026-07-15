------------------------------------------------------------------------------
-- FILE:    XP1/Buffs_XP1.sql
-- PURPOSE: Changes for Rise and Fall / Gathering Storm content.
------------------------------------------------------------------------------

-- Pen, Brush, and Voice / "百花齐放": +2 Culture per district in Golden or Heroic Ages.
UPDATE ModifierArguments
SET Value = '2'
WHERE ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE'
  AND Name = 'Amount'
  AND CAST(Value AS INTEGER) < 2;
